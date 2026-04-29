Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDCCFF887E
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4959910E3D2;
	Wed, 29 Apr 2026 15:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8R7pzK7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC7010E3D2
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777475362; x=1809011362;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bSQUGphTTw/cGtS6kAc9Fn0xdD4h+YEPjoEgvqIkecs=;
 b=e8R7pzK77eBcgfjiH82/PTDlHFzizo7w2wJvU9Pmrxkqr3WDhvQawEX4
 7FgVrTBnWHqxQdHYcLlC1DSbRD9E9a/BS2wO5XAh7Ob0Y4Wtl9H8RiGWT
 u8n4ynGcOMgtMipfkuXi++dvhDg671ukxRVT9dOrBKELE85fRzLJeWTfu
 NgE5J63nHP/8bBbQQDCP8e3XgCT+Ill5fupLW+GNe+vU4I8730nWtcDlo
 Eu6nZdb099HT+gbSpM6ENSSJBtz8f3eJDSDLHTHqdWhBCESrizgDirMg7
 CW10uduQAsgfQBjQgRgRQrICPXMP456Con1SPQ3aibqJL+LVmcqCL7ucv A==;
X-CSE-ConnectionGUID: dACrQdaZQz+54gI4mrxotw==
X-CSE-MsgGUID: PAiRLGpNQkqib/634wVPmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89781701"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="89781701"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 08:09:21 -0700
X-CSE-ConnectionGUID: qyhRLhj2QSiZF0ywKTf4rw==
X-CSE-MsgGUID: iq+0o5TUQ7mk2s3zHdD5Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="238254350"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 08:09:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 08:09:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 08:09:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 08:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmg+NUv5ifNF6RU3+/yHfBhYiCH8lKSOTVkLpVnai0xQru/gp/CXvcYLevgAKzh5s2F6I4BqfZ3Iu8LeXE8kDrcM+i2SSooeeM8Ng03NRbugiHszLbEGaDmWSIo6L041NPVbwM60vElisaQkcYo/WkPXvDugk56KMO02UStM3LRhoFSA9f71WFgFNQQZP7q6+aKxAIcLW4h5qlEWgYdMX6TCNzBi1EgKsugZdJhvxTADX7OQ87ODNczXKCeRAKZmLUxypT7lJ6rRroXL3z2nmfh4AmbuQonEvR1LL7zVnczCUvhIk7poxKeeX+oyD51KUH616jMZPNnJZYDFirXeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IYbuur1L0TYcxFQHCH/ihNm/83KWCXem8yknlKBNHk=;
 b=QCIMtFMu+c4+CRb4P9yegAbfQIP3r6OdnoJ3sxpBj3VeAHtM2NHmtPIqKwgdJH9tsVmNxgLSsLr/Un5m+cd1YZPL9nq5dh6HUDtpdovN7tum2OHx9A6EDDGmOgReWy7xnzRdAFbOj3HjE0sGyb5hGDmUQa7H2SE9UEhjVuEgx1EOjEqULU3Ya/CNh4e6kWdJZHyxaPOg2UOghGc96gcPADm6s/1vTXKWs4kzDP9UN3bg0dbUWRV0lDnMUMTCDL9Crbf7Vr/MZMHeOY08Zdn4klCQZ4gXvSUCBF7LqivEP4ma2NP0R0fPCTVmXifxNYEB0CVkWSpEUlg63yldzey3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:09:16 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 15:09:10 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
In-Reply-To: <DM4PR11MB54568743003BC9EF6F00FBF6EA202@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260416-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v2-1-9adb9fd3b621@intel.com>
 <20260416193733.GG755471@mdroper-desk1.amr.corp.intel.com>
 <DM4PR11MB54568743003BC9EF6F00FBF6EA202@DM4PR11MB5456.namprd11.prod.outlook.com>
Date: Wed, 29 Apr 2026 12:09:05 -0300
Message-ID: <87mrylajn2.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0198.namprd05.prod.outlook.com
 (2603:10b6:a03:330::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW3PR11MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: 00bc859b-ee78-460b-02b7-08dea6014433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: tLFwgAIr1Vpr3ozwkC4MrfdrBS0pfuKiaDwXRMMBn7yHkcNR0UFYS7P/S1H6dmQ1EHGAzcmQrAvjKezSlDPx7P3OZBEM+uHfVxD8t+nn5rEsA1o1ADeeD6+J2+8Yn2ybC4pf1gfxpOq7nRPxrVLHkymWnomdfbUiTbsJ+JsMjKZSKpYZU1iaY8GuSgembTQvHa920nLMDQyKcJwgvstssTkYM1wRPMUCufe0ngAXR6y4kvttBgiD4O4CqqOtHUkPt3ncIY3aXhPquLlfLINhowY8svOL1j1morRqM7Jw/FnGUEIRclSxY0hiSnx96qTuldRrP4n7TEX9FU3H9JU4y5VVViHHqGD6ILh8ltwx7UPpWCwpKrhdxD8RVmLYTa4mw9X1o2arltXRSqqo8S/Fp+BnZ1rlM/F2jeMclxWeXJZnM8rifBZMkRMLppXd9fYARy/ALzK+CqGCnanNrtxDcsG+kzn7kPZYS9djjliK1Tj7eZ6ZFezEOid/DtLlDMwP6sSzM6FUOil2N7kmW+lJwgPVVvzWn1ma5nXrJUhJJg6B+0anrmva8BIMei29+P32w9C9YD4QfxPXfc9nzlQovh+jYmlZ+r8eLbSfN8u3Sks4HWPKjmP954a4omHDJKmzso9y0zivO8yHpE3Kh3DPTMiyK08pDM+IePIEfB7Z/0oKqXLEjLDQOt/fkyejntur
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?33hH1GLXc8NJTFFouGFMf83aIta6t9TW47DlKpvFJ17w0OmbEAMBx12FcGOY?=
 =?us-ascii?Q?hy/3NTB6mmG676xCag71I0YoIYoSPtCIuTf+Y6oUAArOIryPNcB45p0YmxVR?=
 =?us-ascii?Q?CuVRzX+rNq/89HUVIdjcUw5CiedvlWOH2cD4F90XUz2nyepXg1OPK9jjk2OA?=
 =?us-ascii?Q?2OnYZxO1sYS2yCmV8op/WuGZpd7JBxaAi+h3lCCJNUznof2l9qa9gSkBp8RB?=
 =?us-ascii?Q?TcvqjokxJIftIvjcUp/PG8SV6lXjPckQ62eiyJeWS+JOnO++vE2ME+RqVXJG?=
 =?us-ascii?Q?Ujwky7d/ob3dcwzCiflWQUveUR1Jmc3Zj5XEOWsiacpAlskyI9AKYOVb6W/1?=
 =?us-ascii?Q?+DXQFy/IS2BalebSy7KrdHyWFMSgs7Mm2ukmL8IiVuymwr+Zh5ba48TtUmPz?=
 =?us-ascii?Q?YJD5rTIE8XzLEpb1nuJ0PP9H55tc7QJLPiyjmbwe6nBg5DPfBNv6yBTZeoJt?=
 =?us-ascii?Q?CPOylU59pnvRWYH7hTocpeym23t2kKSknjWD7KUlAFGnTngW6mTcn77jRT+X?=
 =?us-ascii?Q?uQ7HxT0WX4feebnmLbudiF3CkKF5xg4KHaQuGAhsQEFb91zIuX/AWVh9TkGG?=
 =?us-ascii?Q?DG4uR+j4SEjAkXST1leFD+k2zCtrCplzTxR+hzqtsF/ludKSHigwHTGNgs/A?=
 =?us-ascii?Q?j88Ly3jDBabIdY+Pp76fpDqvaNqpsCSrkL6Or4N1waZ8Py99szqYiOigSows?=
 =?us-ascii?Q?5Hic2UD4rQe/jGcoATI4rihKfbuhmoPzcvzOTWP8duQK5OGfv1CJOAhNkgzA?=
 =?us-ascii?Q?ki22wriAeSyVwsXEL2ku+CbG0fYOf/95ZwvYPDdIL4rmiFX3tB/wHnaqkKwr?=
 =?us-ascii?Q?JPim/ZL5A86epLjlO+X53FmLPblBH8U3hoOtlzMAKKIH6Drl4T58wnGXUcRz?=
 =?us-ascii?Q?gKDPyjRQxod3nM9dDG4O5cVxRXZ8Kov/13/i9gFh+bBXMK4WpxWCq6UI+TBz?=
 =?us-ascii?Q?sXr4WWxT/8qcEk2EiKjjapaaHk5hGO5y9BT6eSvkbHxqzvNIrCCMonsFmW4v?=
 =?us-ascii?Q?bSjEGPi5MHIOnbLcZC837OzVvN/Oa+BKVQBY0+pbecYXuWAgBsnVGvECNeJD?=
 =?us-ascii?Q?wfAdByh+UJdty7DtJaTP66BwJvARKYBzp1juZWBqkbLYlA7fAY5K8u9+23av?=
 =?us-ascii?Q?bI3Hc2DLXZMg0vula5miuJ0TdB57GU2R4VdqyLgc+n18TnkB+YRWZx/BtHQr?=
 =?us-ascii?Q?AgqO3nDKDBpciPtgEFbIuN/UpQlG4SXHS4mVdsu0jD9yqxFYEj4XvXYl9pnY?=
 =?us-ascii?Q?0omQy2aI2psw/mR+RlTEql4a/OkMIaWsZqSwfwnRVwZOgZ9ompQ7oCeiFNdG?=
 =?us-ascii?Q?jYlxyojJJLckAbbaPfnv2KIK+AN88OCFp0zw4zZkpOm9/5jTkjb3bDwHMZ/6?=
 =?us-ascii?Q?b2ATdzmO9LyOLKSxIYXCvIDl0887GMpGBMAwUjBuzfSphMoNhU86IUQt28vD?=
 =?us-ascii?Q?XbRCvZqJTbaQdSeujRnOaxRNbmu3JTHqRZlreKgkVWsTSqgtQPkysSbgF7Gl?=
 =?us-ascii?Q?8u8HA7lVbXu8MEDK1+UUltLFbAv5jbb6cWqQEcuZDfmxc4trE0RYD30HrW1A?=
 =?us-ascii?Q?E+NkS1pnbtnE6SH6pJqj++s7ab6iM05OquG1DvffjMMutNWteyNke+Xr+5ne?=
 =?us-ascii?Q?Lcq8C0TsbnMomPRUhPaXEFrLbFKk8rVdWNQSSP044TsfvD82SPAkQa9Fj+Q/?=
 =?us-ascii?Q?yH6Hy4qPMFAVlQLyCJ8HXEsjOUnBWeKK3IDioibgKHLLFpPHwCV241kaUuVa?=
 =?us-ascii?Q?csB5v9HZew=3D=3D?=
X-Exchange-RoutingPolicyChecked: UPm4P7CQNas7+mTxm/pOTYyu0o7rNo5GdFjRSvZ74Q/g1xK6qo2ioyzNR0CyE33ujGgj52/VQhIlhGVOyzvjzvdb6YgRXmTt+bmRj1yW71OV3BQXIi7/1xH6UOO73Axa74+gkTSe6PIkW9WX1aSWH2LV4hLwhhrhIq8vXqpa3mCyl01q19vx2BAmYjhTv41aiH8ekn9BbyMmmnTGQS2fz+sVC8S+yc9AWOLhTTeiqORfUkfrjDSrXKlk2ypN3ncKhsVm3TsQo/Z+rVZcngySVm3Pl4CjLqC+5uODCCB108ztFLo0Ho/2pFHSIvZgEPUYmiuvUw8AbjqSiOgW+PNpkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bc859b-ee78-460b-02b7-08dea6014433
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:10.6128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1w+QimhWGbe8w58PGPnjuVSiMQPcRqAaNJoiF9JH40MZiNOQNpT3lfK09U9ji/+wbxLzZxBaWQm3WTVhJW5Auw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

"Lin, Shuicheng" <shuicheng.lin@intel.com> writes:

> On Thu, Apr 16, 2026 12:38 PM Matthew Roper wrote:
>> On Thu, Apr 16, 2026 at 03:17:19PM -0300, Gustavo Sousa wrote:
>> > When media GT is disabled via configfs, there is no allocation for
>> > media_gt, which is kept as NULL.  In such scenario,
>> > intel_hdcp_gsc_check_status() results in a kernel pagefault error due
>> > to &gt->uc.gsc being evaluated as an invalid memory address.
>> >
>> > Fix that by introducing a NULL check on media_gt and bailing out early
>> > if so.
>> >
>> > While at it, also drop the NULL check for gsc, since it can't be NULL
>> > if media_gt is not NULL.
>> >
>> > v2:
>> >   - Get address for gsc only after checking that gt is not NULL.
>> >     (Shuicheng)
>> >   - Drop the NULL check for gsc. (Shuicheng)
>> >
>> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> 
>> We should probably also have
>> 
>> Fixes: 4af50beb4e0f ("drm/xe: Use gsc_proxy_init_done to check proxy
>> status")
>> Cc: <stable@vger.kernel.org> # v6.10+
>> 
>> too?  Or I guess we could make the argument that there don't seem to be any
>> real devices without the media GT, so it only became possible to trigger this
>> once we added configfs support for manually disabling GTs?
>> In that case,
>> 
>> Fixes: 7abd69278bb5 ("drm/xe/configfs: Add attribute to disable GT types")
>> Cc: <stable@vger.kernel.org> # v6.19+
>> 
>> minimizes the number of kernel versions this would be backported to.
>
> Is it possible that we have future platform that does not have media gt, and be supported with old kernel?
> For that case, it should be supported with dkms, so this Fixes tag should not affect. Is it right?
> So, I prefer this Fixes tag.
>
> LGTM.
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

Yeah, I guess it is safer to use the first proposed Fixes tag.  I'll use
that one when applying.

--
Gustavo Sousa

>
>> 
>> 
>> Anyway, the change itself is
>> 
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> 
>> > ---
>> > Changes in v2:
>> > - EDITME: describe what is new in this series revision.
>> > - EDITME: use bulletpoints and terse descriptions.
>> > - Link to v1:
>> > https://patch.msgid.link/20260302-check-for-null-media_gt-in-intel_hdc
>> > p_gsc_check_status-v1-1-163d5f826b30@intel.com
>> > ---
>> >  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 12 ++++++++++--
>> >  1 file changed, 10 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> > b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> > index 29c72aa4b0d2..33494b86205d 100644
>> > --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> > +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> > @@ -37,9 +37,17 @@ static bool intel_hdcp_gsc_check_status(struct
>> drm_device *drm)
>> >  	struct xe_device *xe = to_xe_device(drm);
>> >  	struct xe_tile *tile = xe_device_get_root_tile(xe);
>> >  	struct xe_gt *gt = tile->media_gt;
>> > -	struct xe_gsc *gsc = &gt->uc.gsc;
>> > +	struct xe_gsc *gsc;
>> > +
>> > +	if (!gt) {
>> > +		drm_dbg_kms(&xe->drm,
>> > +			    "not checking GSC status for HDCP2.x: media GT not
>> present or disabled\n");
>> > +		return false;
>> > +	}
>> > +
>> > +	gsc = &gt->uc.gsc;
>> >
>> > -	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
>> > +	if (!xe_uc_fw_is_available(&gsc->fw)) {
>> >  		drm_dbg_kms(&xe->drm,
>> >  			    "GSC Components not ready for HDCP2.x\n");
>> >  		return false;
>> >
>> > ---
>> > base-commit: 9ac7dca8d82a4e6d9806ac6c991f0777338833bb
>> > change-id:
>> > 20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-
>> 071898
>> > b8a402
>> >
>> > Best regards,
>> > --
>> > Gustavo Sousa <gustavo.sousa@intel.com>
>> >
>> 
>> --
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation

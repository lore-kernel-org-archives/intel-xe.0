Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFB510FCAD2
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3443910EE46;
	Wed,  1 Apr 2026 22:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhNSD273";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C47110EE46
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775083470; x=1806619470;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lS0PC+vrz5pSRDsPAPvvHSqOAppFnFKzxtDADaByyEE=;
 b=bhNSD273nrH2bkTkTHWxuEcS/gyz/MZrqglpCJScwGCfatHHo1vXJtjy
 Dmxl0lfTCVqkOg5w4JmD3bhOjoAr3bDr9RHS6AzaSHJa1xHu5ovaCUIB/
 CHnmdDAS1pcArxP9qsZgiyI3XYQPV5FLkk9ln2swufgNAgK85DOewghXq
 a1gma7PgF0RBvtRaYgl0d/Vo/JETSOqFr8SqLJrUbAEyeOH6gJ4yQ+kzn
 vO22iOcYGvHkaAz9jFB8NgpOiB07lK7mtUDhvSu6ArJz8A/T0BgPRX1yO
 Pwevqa81tvrWdvAvaED3qVN7Uc1Xc5Q9RD8GgGiyjsziIHFkIY5epA1+i Q==;
X-CSE-ConnectionGUID: WSw46PobRRq/1DlBoL4pwA==
X-CSE-MsgGUID: Hqm3WVvVQjipBqptARRK5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63687963"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="63687963"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:44:30 -0700
X-CSE-ConnectionGUID: jk25ySFLRmqDOBeTWeJf0g==
X-CSE-MsgGUID: KnJWXYZITfOsmt7JF2wM1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="231217020"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:44:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:44:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 15:44:29 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:44:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0iRVRGAp14ECUWDYrAsoPbD6zxQ1dfa62N1tUS7japnWp/6DA/XYGU89hY4nTJWKAsXmiT2d+0s/YXE0RDj3hqwo5MwSGi1pjGccl+KwqqwIKLwVGaJ/VGJybiQtMnKld3G0w0Onwq2CEkUF0aNNBoFIXAdA2l0oS2ZbOS+y7ERjfxofy8DGDZ5AUJ0a+bhfhGH26ZMowpfYptEhOh+1Jfn8DBMUN62CjrMPknmn+Hs0N4IOwUQLA0j95fTDWZ9VEvVHGi937rSJmnGoYLAPjiCRSor1Ruwf8NGMmH2D3nOZdb7RWLYzhFj1VuD5YcfTh/t8L4dqC2sSWB7ixCcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMELrO6XfYGf0/r0HzB8OEcUDaQjAX8/rTf0OH5ecP4=;
 b=Dnt0gzdyZ45ZRPCdXS+O2ZA1sT8YRqkOxnDFRMpKQPzkxd7nCiDNNcFyDoiN++8UY8jqIgilvBNq7dZf/ReoJxCfxkX0F4Ffzgo2DaHit/hCe2v32ZL/qpr7aSQtWa91nIQoCu3PjhY/iZtNsAkCF4URbiKd79am1DrPShNkbWhlZMc9tD/ZU9jJ4MZIk6NXDfE8zY0Vw1G/U/fZRpCbo7q0dPWxzK4ozdR2UQ5FHpo7dhtsQLl5rGEP7lg9MWcL9nwUwqZi9jVEiJPFoDE6Gb1ke0j3o5gm4TksA2vx5K0wSWbfIBXu7rHMmFLLPkmiGlu06028DGRA9M7XDDT2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA3PR11MB7536.namprd11.prod.outlook.com (2603:10b6:806:320::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:44:21 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 22:44:21 +0000
Date: Wed, 1 Apr 2026 15:44:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 25/25] drm/xe: Add modparam to enable / disable ULLS
 on migrate queue
Message-ID: <ac2fwYvuiZ5r7L0C@gsse-cloud1.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-26-matthew.brost@intel.com>
 <e279c757d8f837cbbee475b4cac652a2997bff0d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e279c757d8f837cbbee475b4cac652a2997bff0d.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:303:dc::33) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA3PR11MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d500f11-dd5e-4c50-9d11-08de90403717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: VGOMrI3GHgBIjipvolhtG2qUxoEpWUlp8bihEooDGxm8uobBLMEFP5oOwMuQI8m51I3tvbl5JOuVCGok9ngF+c7h61/Z0QwBQEP0VEEBYWAxgHDaL4/ZFfMFGz29oGg0ZCwqvB5n5Z6vyK2GE+cJ8HPZQZALGtTydh241lVIISwGjiDujC+/2xel3uVWLIVL/iC1OeDRFfzfNxPl+GjhllqFu66vnCZBS1fr8AxF/tVxfBEEo/qO+LZZybIveqL582vV+Xe/YWIFNk/OJ6CgdGpJrznUvm0/4bsxJuVKR0BXB4SQmLPAqwlI1EqvyWPcRPFQHrX2+3ztfSdN1csMvrWnq6EYVxelwCAZTKRxFhMy2vR0Qr6CCuWTBcrXyvkAjr+Ng9ZcGIMYUsISq/rk7r9yb/yH4HsulB5re0u1RKYq7yMO+/S8td0rf28hbLoDNrc7gADc0ceNuvg0y1ooYjMRn6e+EDT0D/cpl704Z0TFgWsJtKBIjoWAXUskGK1LO/FALW2qrhIocVZV0S2yNZRCZQ9Kn2234efOUyvCiGvylOWRx+6STVjNJpzYIXqavdocZxS+v6nf7SDxUkMW0gJZW24JMsQ5WdecCUu5siMFhf3Ydc772aYBcD65TibS5tFG1byfxzDOUHoUQVowSBpxziuqIKo0boWWsdX1t68tW++FeuxRJRiaNRf/SxJkpq94Eu5BfBTPia9skzMd9e3jOZom6U7qfdxQ1/l6UDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fV4Zl7Ghvm8ALV8RfQz0H4aNz5UuYlt5H6W3fNZvKvb4JidjOTVIaGw2Eg?=
 =?iso-8859-1?Q?WHjBribUHu7wj8mNANWzZnLjlvpL6wXhJxbgyJIOE2gEV7QMXHwhq2DZeJ?=
 =?iso-8859-1?Q?JXLDc+Qbxt1Q7BQm019gpuKO3v6wEQrIXOLpOElQmyF0//CJUpKoqGI9ij?=
 =?iso-8859-1?Q?8E37VyjEEMugrRljNrjJt/KDlpJ1J+otYK1ftYZDhSntmI/pWv3y474KH3?=
 =?iso-8859-1?Q?CvUG33TvKNIT3exvIY1q34bDa4/VGpEr8WyS6/XKrZzGXxI2l744BJKExy?=
 =?iso-8859-1?Q?cZh2SIEfM+IRFG+c6aTxjiEDXJjpzBOynW/E+9VzyBiGekpUsfTKekOECz?=
 =?iso-8859-1?Q?XFzdUTP9BhEuIM9gA3+k0MpvtHEnitGIzOX9F82UesooTtlzGtYjr17a8W?=
 =?iso-8859-1?Q?lfDiOZ1aDVMRKSvEwHFdGFMguCYzzibxhn2DjCB9rB6jjfyNkbslSmTtGJ?=
 =?iso-8859-1?Q?olAP75t96IxUuG/y+GdmpkC3ATam6+qzTOzr0oqp1pLSgiyxrkjGt2h9hO?=
 =?iso-8859-1?Q?31auGVpwp5dRD1rICMZC9Pd8f3lr/1QzDSbsCez40y5uN4Kt3KvxwXgAj0?=
 =?iso-8859-1?Q?JbcabGQVJ+YrnBdz7HhMqSx9vUE2C3vhJi2SsecQytygFi4k+kk9Xu6VDV?=
 =?iso-8859-1?Q?+AOP5vUT1uUaS8EtuxUO3oy7bXSU9Rk/43lPF1mjk49/KZ/4YO0OjbtzGH?=
 =?iso-8859-1?Q?qnfG9xXcCL/RWX0TVRK96u8oYR/Oe5S28KMwJGBVjYx0FfApfpoqboqZXa?=
 =?iso-8859-1?Q?3ieHOp4gX4VjAEt4DPghYFBFMqKfMGPreQkC+If0REeoXw3MqbaM/p4Avq?=
 =?iso-8859-1?Q?Dlink8QaAApLQvTVu2EGwKizfTP6yiyYoanolLFCPaqnOZblv7T7iugdCo?=
 =?iso-8859-1?Q?gkiaWLH36Z35QHXAcx4L+3pgKH51UC8ikzAXRyrpjbqTLO6n3Xj6ri8t4/?=
 =?iso-8859-1?Q?aJCKeBC+wVjgGFLogTGRxLL7q6ShGSMb6SXVq9GZtRIR8qMkEFc14Raxiu?=
 =?iso-8859-1?Q?hpfjrELytAn0pQbvUgOJUspT0nSa3alUYsYdrYE83KrNAPgAEgjfsOE0gD?=
 =?iso-8859-1?Q?Q0VLEteUdo8prts4n3FiVLl4QPNFMdGkLF8owXmCMoQ+Nkw6gxrt57KHYR?=
 =?iso-8859-1?Q?ozruUKA9qh/dKahyg4Z2TZ9TSzt3wFZfS59OYM19qxhRKjU7qt/MCpcCXt?=
 =?iso-8859-1?Q?FIfhLEwwOVjzSZ8rzOmgLpN3Iu9YHzgJYMrBiwgwIu2GR2WrL/xBxc38p8?=
 =?iso-8859-1?Q?Hew4eg4J4MkLIW6MmtiHUU1leSv+NZzIPB6XqPRX/51TyTF0yHujTiZkxr?=
 =?iso-8859-1?Q?N/LZXwoFyeU+sq3uu3w9/KKCcqe0/8k78wHrarqAZqMqV0gpQWeIP4pSCE?=
 =?iso-8859-1?Q?8frBW0UZjfUMp5yuKhPOUuHHyhGLEERNpjiwme+ZKWpX49hZB1jo8SuU0y?=
 =?iso-8859-1?Q?VsaY5v+CZ4oK1alMCW095ZcOElm1rjLlVvvi9Kbp3ETTQJHU8eRpn8oWRW?=
 =?iso-8859-1?Q?4mDt2knDfCZuigpHz3HwVfpSXNc967mRC1Owb6JO0thhgYIZvyc7uWlBpp?=
 =?iso-8859-1?Q?ttVhzHEiNzfmZX1IyLmVq8r0fsf3e9v2JXCrokhz58nDOvqfAPstAUdSuB?=
 =?iso-8859-1?Q?YuD0bOOFHA2yDyBtg/6I2IW+5EmEGN0/Z7UinKXJijCWWcJ9farRVf1Res?=
 =?iso-8859-1?Q?XewZIFiElwVAXeydVAafcX4ZfpvwTO8w+cEuxHp4brFQbLqItxiBLeJktQ?=
 =?iso-8859-1?Q?VCjU3NJ4OXrok6AC2FiSEt9j8Zl0cFnQFlRyPS5VgTSemr81U6bEGVSXlt?=
 =?iso-8859-1?Q?Wjn94PWAbE7Ss8tUpTziPXAusJeHsGo=3D?=
X-Exchange-RoutingPolicyChecked: nu/gWIOxaajDrppIwgwDA3rtUafFHWHo0+0GJgjg+Eq1jNjgGwuqc1dn3qcSdU7XdlZjB5Alo3YBVIGusVbN7EORfpy5o3NuBL4FbYSqoOYnULpJb2GmThCJ27fM8Cs2SwI3rpqj8bkO3x6PWwZIAS1yUmfW+tfOv5Pl4hnsrYG9yR7Xi9Hwu8MP/LE6TZRfX32ZZq3gxv5si10XAmpWef3LoJjHjehQ9XqugxK2om613hTRkaNnQxG1w7Wo0h/9gGS5Zrz2krVFsJvdZUEbeJowLks5Qs1reYSuc3BFRQKYD5nhjqIBESJProQs5LBL5DN6f+Enaar+5YzvIZGMPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d500f11-dd5e-4c50-9d11-08de90403717
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:44:21.1937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7U0CAxWsOwha7frmIQyoASoFGAQklIRZKQxpoq+m9F2jS+sSIVGImTaRGKGmjOv3NoqM604fCNRhuPwltohz9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7536
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

On Thu, Mar 05, 2026 at 03:59:24PM -0700, Summers, Stuart wrote:
> On Fri, 2026-02-27 at 17:35 -0800, Matthew Brost wrote:
> > Having modparam to enable / disable ULLS on migrate queue will help
> > with
> > quick experiments.
> 
> Can we do this in configfs instead?
> 

We could... I don't know about the guidance rules on configfs though -
e.g., is that ABI? Modparams definitely are not... I don't really want
anything to be ABI here - I'd rather just drop this than add ABI.

Matt

> Thanks,
> Stuart
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c      |  1 +
> >  drivers/gpu/drm/xe/xe_defaults.h     |  1 +
> >  drivers/gpu/drm/xe/xe_device.c       | 12 +++++++++---
> >  drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
> >  drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
> >  drivers/gpu/drm/xe/xe_module.c       |  4 ++++
> >  drivers/gpu/drm/xe/xe_module.h       |  1 +
> >  7 files changed, 22 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 844cfafe1ec7..049389205b3f 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -85,6 +85,7 @@ static int info(struct seq_file *m, void *data)
> >         drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
> >         drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
> >         drm_printf(&p, "force_execlist %s\n", str_yes_no(xe-
> > >info.force_execlist));
> > +       drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe-
> > >info.ulls_enable));
> >         drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe-
> > >info.has_flat_ccs));
> >         drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
> >         drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe-
> > >info.skip_guc_pc));
> > diff --git a/drivers/gpu/drm/xe/xe_defaults.h
> > b/drivers/gpu/drm/xe/xe_defaults.h
> > index c8ae1d5f3d60..299360546283 100644
> > --- a/drivers/gpu/drm/xe/xe_defaults.h
> > +++ b/drivers/gpu/drm/xe/xe_defaults.h
> > @@ -14,6 +14,7 @@
> >  #endif
> >  
> >  #define
> > XE_DEFAULT_PROBE_DISPLAY               IS_ENABLED(CONFIG_DRM_XE_DISPL
> > AY)
> > +#define XE_DEFAULT_ULLS_ENABLE                 true
> >  #define XE_DEFAULT_VRAM_BAR_SIZE               0
> >  #define
> > XE_DEFAULT_FORCE_PROBE                 CONFIG_DRM_XE_FORCE_PROBE
> >  #define XE_DEFAULT_MAX_VFS                     ~0
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index b7ad7f97e68c..18af003c95c5 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -437,6 +437,14 @@ static void xe_device_destroy(struct drm_device
> > *dev, void *dummy)
> >         ttm_device_fini(&xe->ttm);
> >  }
> >  
> > +static void xe_device_parse_modparam(struct xe_device *xe)
> > +{
> > +       xe->info.force_execlist = xe_modparam.force_execlist;
> > +       xe->info.ulls_enable = xe_modparam.ulls_enable;
> > +       xe->atomic_svm_timeslice_ms = 5;
> > +       xe->min_run_period_lr_ms = 5;
> > +}
> > +
> >  struct xe_device *xe_device_create(struct pci_dev *pdev,
> >                                    const struct pci_device_id *ent)
> >  {
> > @@ -470,9 +478,7 @@ struct xe_device *xe_device_create(struct pci_dev
> > *pdev,
> >  
> >         xe->info.devid = pdev->device;
> >         xe->info.revid = pdev->revision;
> > -       xe->info.force_execlist = xe_modparam.force_execlist;
> > -       xe->atomic_svm_timeslice_ms = 5;
> > -       xe->min_run_period_lr_ms = 5;
> > +       xe_device_parse_modparam(xe);
> >  
> >         err = xe_irq_init(xe);
> >         if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index b3737dfcc45c..a20ff1707227 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -231,6 +231,11 @@ struct xe_device {
> >                 u8 skip_pcode:1;
> >                 /** @info.needs_shared_vf_gt_wq: needs shared GT WQ
> > on VF */
> >                 u8 needs_shared_vf_gt_wq:1;
> > +               /**
> > +                * @info.ulls_enable: Enable ULLS on migration queue
> > in LR VM
> > +                * open
> > +                */
> > +               u8 ulls_enable:1;
> >         } info;
> >  
> >         /** @wa_active: keep track of active workarounds */
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 62f27868f56b..9f02e238e7c6 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -447,7 +447,7 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
> >  
> >         xe_assert(xe, xe->info.has_usm);
> >  
> > -       if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> > +       if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || !xe->info.ulls_enable)
> >                 return;
> >  
> >  job_alloc:
> > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > b/drivers/gpu/drm/xe/xe_module.c
> > index 4cb578182912..bb4fb967aec9 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -22,6 +22,7 @@
> >  
> >  struct xe_modparam xe_modparam = {
> >         .probe_display =        XE_DEFAULT_PROBE_DISPLAY,
> > +       .ulls_enable =          XE_DEFAULT_ULLS_ENABLE,
> >         .guc_log_level =        XE_DEFAULT_GUC_LOG_LEVEL,
> >         .force_probe =          XE_DEFAULT_FORCE_PROBE,
> >  #ifdef CONFIG_PCI_IOV
> > @@ -45,6 +46,9 @@ MODULE_PARM_DESC(probe_display, "Probe display HW,
> > otherwise it's left untouched
> >                  "[default=" __stringify(XE_DEFAULT_PROBE_DISPLAY)
> > "])");
> >  #endif
> >  
> > +module_param_named(ulls_enable, xe_modparam.ulls_enable, bool,
> > 0444);
> > +MODULE_PARM_DESC(ulls_enable, "Enable ULLS on migration queue if LR
> > VM open (default: true)");
> > +
> >  module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size,
> > int, 0600);
> >  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB
> > (<0=disable-resize, 0=max-needed-size, >0=force-size "
> >                  "[default=" __stringify(XE_DEFAULT_VRAM_BAR_SIZE)
> > "])");
> > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > b/drivers/gpu/drm/xe/xe_module.h
> > index 79cb9639c0f3..f0220b694c40 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -12,6 +12,7 @@
> >  struct xe_modparam {
> >         bool force_execlist;
> >         bool probe_display;
> > +       bool ulls_enable;
> >         int force_vram_bar_size;
> >         int guc_log_level;
> >         char *guc_firmware_path;
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6197C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 20:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FB910E0ED;
	Fri, 12 Jul 2024 20:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgJD1uJH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1038110E0ED
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 20:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720814740; x=1752350740;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l21HIPtdZtaavwZtEKmGan7YJ4gpqcyGtMOMIhDx0f0=;
 b=fgJD1uJHinyFiTAwly4cJm2c3vireZEbivIymGOBettA8OqPl0pLTyN1
 HDEHQvlwgUSd5RO6X7uFClpLIcrl7yXT4/Oic60LWocUp00gs+3RrtcTW
 XmE3otCO4L95kGOz5h80n/6ws+AwelPDxEieu9aF31sBBglUk6LqdEHCy
 1PR/JXlcEmNzrWp9OlLMmqV02QEZ4tR1mKAqm8ti9tNr6Qpsb3LEekOb8
 0cJAj6FkVumIYpWq3u1lJHMigyhUTc84vWdmRGNtzCrPQFIPLjjH8xh2Y
 YKWrGH5xSPTgNT66ZV28PV8gGpeCRmhls5r+YOFS+X9ix1FtyD5vMM4ms g==;
X-CSE-ConnectionGUID: BN5yAzPiS1mMr0FRlTJO8Q==
X-CSE-MsgGUID: Pi/lXBzMQnKKhdKKIS7QYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28949304"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="28949304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 13:05:39 -0700
X-CSE-ConnectionGUID: rGnBtQJATB+tb5PJ/YXzCw==
X-CSE-MsgGUID: icuHT5xRSkenFMHY6VY+jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="48961869"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 13:05:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 13:05:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 13:05:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 13:05:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z95GSyyzbapuu4jScqOkY3aNtmksEJglhT2ixNoDjBducpEMSKurijlCAR4Uh4lbPr55Faw4DOsEVxHaVT8OZiI0tmJXjNF3coXJfUdhND+2F+CWIUf/UNhzKN8uUkAFR3XANSDQYMehfL+lr0ALvGzpG2Er+ri+kwjZTYRProiSAJkHyoqgisJ3D1xtWJBWRhSpr78h1WDSDOi36IeSZSBYB6Zn4drSKvydZa6wrtaIANREKyH8DXdBGJ9cv6CDC/+2DUcH2yLp8d5CqD3SmD3hpJUM/7qIKS6svhUUsMANTxTl19nTDLDVJmCeXGh3aSQU0oDEHWQFdShL3qVZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APIzWDJZYVCqoLqrR4KRwMu9UiXiwcqBzFBmbMcYESY=;
 b=FBZlVjkOabsFA38SnkHe/wzKm3vpU4zR1v4HMuyvpZCcBNqU5AtzPW8UScUIKU0cu9h03YXyBJ/BT0EBkV+RU05XZzHl2+jrhw4K4eEGjR10y0Ry4OkSKecfgw/LWV63RUltIwD0qcU+xtEz3oJQhF1EOaGiPyWoO5GkMbzh5PrPYUlrnzqa3GLroR6q/VAXnIk83I8FvGCXkB844DFYcnbVA46n94x1Ch+/SD6bAbgqHye4DpH/uooAHciVEtZ4B411I6v5F8MSDyNixsBGVgfJo+w2o5nIoc3kzzy+p/JywSLkC3y2g67aUyobAc96MZkmByOpNE4xyyAw+8+6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 20:05:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 20:05:35 +0000
Date: Fri, 12 Jul 2024 15:05:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH xe-for-ci] drm/xe/huc: Define BMG HuC
Message-ID: <kw5j3vyln5imnzj7pbog6vcw53wvcsopr63q35katnovhwksj7@oxeuzkgtijyj>
References: <20240712173604.2660566-1-daniele.ceraolospurio@intel.com>
 <cdd0b14e-689b-4866-84fa-99696bd42c06@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <cdd0b14e-689b-4866-84fa-99696bd42c06@intel.com>
X-ClientProxiedBy: MW4PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:303:b8::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ba7450-c0ba-4757-c3e8-08dca2adfda5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KCuBuZhVbHlMmqlHLM8MHhrQHdr76azc/oT8+B8GNdDVCsdnSmpgc6XGlslv?=
 =?us-ascii?Q?JGxNe3mfnzih9lEuwhE6jqgT8o1/HvPpK3IK2UN/ItZjOcPAh7M8nIbnMicI?=
 =?us-ascii?Q?nRHLZCJHY8uPK7IJrSFsbA3T3Cm7zQNqSJYD2Ymmd/350RH2S05XYYoATZ9M?=
 =?us-ascii?Q?8sFOSAqS6e7+b7izbIgAq5/OxHbeJ52iErfTMV8wVwFu++M11TdLkH5gMSSf?=
 =?us-ascii?Q?OMv8uDPCiT9HuYs2HD/TKtLDgJgE8Jn98MYrE+rceRy7JIqUV8nEo7YkBgLN?=
 =?us-ascii?Q?t4UyFqP5Cdz342KZJCh7wmhcY/B10QF+YQ7a8giBXCQ1s48pG7KApf5+hscj?=
 =?us-ascii?Q?4ucaNr7V7mXrtIzYqdaO4Os2GXdbOmBDwPJ3Y7mFSboKTjaS5ojYB22uJJE5?=
 =?us-ascii?Q?cMn1uxKiZvUfRJpApg8C2BCcP4+TLfNtg7mrzbuX34Mtp4QqVJ6bJUjrzPTS?=
 =?us-ascii?Q?asaLth6mgJ4AQevjzxSR//a4E6dh/+trD2XHMq/fAlLYdASO8VmKkHuMY9BB?=
 =?us-ascii?Q?ruCrHf6ir4Zkk1Y4aXXAns1ZPYDRxnzrbQiEe3owKhQFFnCZOTw+Oaj/gx2+?=
 =?us-ascii?Q?XAHLqtI2xD5tj8eeH2PYTodKkAGVk85v6w7P4MBLnGM9o4ochniuaJ0uT6NU?=
 =?us-ascii?Q?Rex7XmmNsmZMUbuHBSIBwXrE1KQ08P6892YCjEMikE3YRcWyKb+lbGAbq/8R?=
 =?us-ascii?Q?ZFmpnfEY24P/bphstqmbswWIpXeMM356s9pVwaWAgjwHXWwMQ6sYGLWgOhnY?=
 =?us-ascii?Q?DPu7p3gWeRSrhafODBGuxvwvHrOIOr2jVYDY2PrzYuz7dqNor6tOrn7r3WH1?=
 =?us-ascii?Q?k9kiZPjVQMwHzW5fSgps3uNQtag3uyePxH+RQ17mjMY8flI49TASg5q2JGGi?=
 =?us-ascii?Q?m85vPIFB8mwdMiEhl5METqxUumzoRW21SJN9PGb5pjD6HcPWTDyWTyE0Qec6?=
 =?us-ascii?Q?uvQsExfludl3wpdP+amwkMk672HjWYh5B8AZlsaDXjStKShzjuER7Qngk2jh?=
 =?us-ascii?Q?ZECGJFNaCMJejZvJelVEnOdw6XLQFfi92DXV5hrD3TiAJSDxVnqGL+OdlTz5?=
 =?us-ascii?Q?r8lU6YpVZLLB3nGOaJ/ShUJOykMlvevjC2cmBan8ZKXd9xEe9RhbZRYe0qcU?=
 =?us-ascii?Q?/ME4toGS9PPl0GAPiSOWim4UXqlrsmdej9ZzZsjZjIEbjU9uG26AJ1xRL1Up?=
 =?us-ascii?Q?imWNXmOVUOoZsEJBgin7VqKQkXsIBIOdbgZnC+DWEPVC3AON23Fh0ip3P7IG?=
 =?us-ascii?Q?4FYOAxQcabPTHyeSiCsZpFLT539lSWHahnkgzQH+63psxSKs3ITZsAG4z/MO?=
 =?us-ascii?Q?1iCMZBSjzpi674CB9ZAU16/E295rmC13QyZ9KPKpH9B7XA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I/KY0IS66qNp14Qp6FlRl2tOysekpFT1RyF1eBr2h8GYD8lSP+lp3GpLArsE?=
 =?us-ascii?Q?d3t0fWZ/8LTUiS8mdAJYDQsTe3X/276dnoCfb9eVYhzFOKq+tFryeh77rxZ9?=
 =?us-ascii?Q?ULrM9oMAJp6rEor0VB7P1dGCXVpKe8987q0vb+7lvflZ3r7Zv9LzXwX7HFQb?=
 =?us-ascii?Q?9Pki6SRz2GO4PbMDqUXNP5qz8jGp5xM+DfCm6+4y1SBgA1IXU3vu9kfpTwF0?=
 =?us-ascii?Q?iE/oAfqoAal6//Q0Nrbkd2ASigk2KhvGNc9hQgqjUE4EEw/t/Ku2gc+Q/Z5h?=
 =?us-ascii?Q?TwZaSS26Ny55BrfdP1KEakEkPB+NXYiKwMJJ2ufxbJ0AjkNYFF44tOZ+Po5L?=
 =?us-ascii?Q?+qRB/1GoT4ySxn0e2BYRcZUzzC0TFXDo8orXhLuxAFNHt6bdT8FHeHaHqeZG?=
 =?us-ascii?Q?Qv7Y2Pk8CQcd3srsMwLktqIpZcPE8nZb1YUJY5yy4WX4pIMK3RusgZbmW/b8?=
 =?us-ascii?Q?1CYz4uGHTOVN/DYUTIf4BFTpNbAGLKezuFoiKSkZAGA3McwGxQWRLKg/o7Jd?=
 =?us-ascii?Q?KDJ9b+xXYias+kVBLZDhLsif73un51Vp/PjH2vRdRoy7y4KKznihup0YbEyw?=
 =?us-ascii?Q?YkYTPPy4VAYIJXYn9+G/r37H3luYr9q23I97A2C+LJY6702/CA9KC9Lk4udR?=
 =?us-ascii?Q?KXiQrHxg8RGBaHkoiuYsmVyB2AsPVhvBj00gbl1LMbVQXfrzHecr2V6qdHpo?=
 =?us-ascii?Q?cG8cDmztUUQTEODy7hAncRJv2I/iWU/+HqfwTqkqi0yTX0NosnbwV+w+CRw6?=
 =?us-ascii?Q?bYBKzMyoIpwOVSX6bHVRWeyOzqIaVOJIOfIZs5R9a07SpTbC4gvvH+GdCgG1?=
 =?us-ascii?Q?jpyM4nCgs8f3gHFYcfx8t2yVo1jOjGK3nE/U7Lp7JZDGCKG94xq6NFxx+4mE?=
 =?us-ascii?Q?TX2uMFk65fJ/B+eEHW3WWg2GgFOlEQ/oZEN9tuRUtFHCX1LEYB8Xd0nfB5NC?=
 =?us-ascii?Q?LUc6tyIBLxnUN/x4etgxdQML3TcCBXr35pWXi1mYakcA8zgnXckE0Grl/pXn?=
 =?us-ascii?Q?tF2fLxwYW0Gv9SbdHMQT4iX8ZqezkUyfZVg1sufeBRrz6MgU17Hypgzdf/s8?=
 =?us-ascii?Q?USOCKmPIHub1uD4fiv7PBCb/1eJzrprrwKbvwBPmvNZOpzvTQhHYpOOY4/z/?=
 =?us-ascii?Q?MsjnjEyWAqnBuj6YQh3qQ0V8EAO643vOECyDNFTkylUsDcfx0ILXgC8uGHj5?=
 =?us-ascii?Q?/pYovKjOsCJQbgJCfpRl80rKH9zSygEfBhiKtA5npdAX2MbU3UInxEjcpQ+x?=
 =?us-ascii?Q?wSxlR6riBDEMnx8ym6MqCx9i+rYGEejlFZYZwvxPKDAt1V76Yhb+dDy5E6dD?=
 =?us-ascii?Q?2YSFuY88Tj8zwlienPjUZyj2c6DzMMHfMPiQgdbN3J4qzNzQhs+8aL2wJlO+?=
 =?us-ascii?Q?RnKAZNO1NPgmUPUWoGR8T6l/4HrfeO1gSeqmRqzePEWN2W2/ZtsLDh5Z+KTS?=
 =?us-ascii?Q?laRBbbEmYU5UfNuxzMZIp8+Ka7ofc3E+3rznI/0fbyD0LiOBAtMbQ/AiTCsM?=
 =?us-ascii?Q?HNdLbAW7h7BK3t3zEZzDs/+EPfXwkTlJ5R9meamQB2hyOG67xVAbG4wOpiaY?=
 =?us-ascii?Q?KBu20rRfNCVDLbncbm5UpqPbUXwvSRajWF3eYUTIEaASYKN5mrQ5QRIqrrRG?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ba7450-c0ba-4757-c3e8-08dca2adfda5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 20:05:35.7683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMI7cWbxe3K2pELSwazLe3eXa3RfdbZ4/+7gFbqg4ce7G2skDGTRXrNYrRrhWFIgHqgGdLycTqYR4FHqPTLbRmX8/HKPcFRqE8SEz0WzorU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
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

On Fri, Jul 12, 2024 at 10:49:37AM GMT, Daniele Ceraolo Spurio wrote:
>
>On 7/12/2024 10:36 AM, Daniele Ceraolo Spurio wrote:
>>First HuC release for BMG.
>>
>>This patch will need to stay in the xe-for-CI branch until we're
>>ready to publish the HuC firmware to linux-firmware, at which point
>>we can change it to use the unversioned file name and  move the it to
>>drm-xe-next.
>>
>>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
>Forgot to add the gitlab link
>
>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2260



Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>>---
>>  drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>>index 62ed413bf1c3..c1dcf58d25d7 100644
>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>@@ -118,6 +118,7 @@ struct fw_blobs_by_type {
>>  	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
>>  #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>>+	fw_def(BATTLEMAGE,	mmp_ver(intel-ci/xe, huc_gsc, bmg, 8, 2, 6))	\
>>  	fw_def(LUNARLAKE,	mmp_ver(intel-ci/xe, huc_gsc, lnl, 9, 4, 6))	\
>>  	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
>>  	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
>

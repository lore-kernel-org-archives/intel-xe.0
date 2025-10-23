Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92141CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 10:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F4410E3CB;
	Thu, 23 Oct 2025 10:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/WcKu/B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289CE10E3CE
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761215604; x=1792751604;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9reBOPr8PO4VtOnPtRyCwaJApg4ENA34BQLZCILSHbc=;
 b=H/WcKu/BsmwyG5iryRlrOi6NyBQEyo5ZuUe3KLtdjy4FEslgy9jmFQzd
 2jz9dDZNEeRnRE3/l6IAOJBX/tLBm9eChmKgDqUr93UN9hTaBNd0pUGBW
 RiNmRi1wjqCAhJc6e9KD67esPz01eO0dTAgnEp7Obp//KyuQ9dbM8fg7I
 rsqvo6oatnBoTV6OpWK61noqKaj1jPnQovZ7FB7++OopS3+luwwJx7sAs
 drOftzTkmASoc1IhRqTuOZQEzuNICP/hceppIZJe+d4DhzDGiIM+i10iY
 2m9eVI3RpTDN2mLakJMDc0Ie4RVfvOlGqhhx8cWiZr8Oy3Db0jw9FRqdf g==;
X-CSE-ConnectionGUID: 0c3Y9ZMlQlaOQ1swkm3Fog==
X-CSE-MsgGUID: mcrPls/mS9u01Qt0L+gulA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63418220"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63418220"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 03:33:24 -0700
X-CSE-ConnectionGUID: t8ZYEoWxRFio3JfdbmJDjw==
X-CSE-MsgGUID: U8BROh7wSAqccyEraU2taA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="207777660"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 03:33:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 03:33:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 03:33:23 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 03:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKKCLdDOne1Bs7jmSFmbd34FrObtct54WVdFK8mxAFGTmHnd4T5aZZcqZyR6yR8iveTTZ3PrXKz52FyfYXk5L1DXwLume9579yAYCL8J2ahfXrpJ2ZICC2UyFUXlYKf8ZkjDFAkfp9OpRrLYiMq5DkcgJ1yr8ZoNzAU93xNh/WBDw9IZTFG/h0iVo7skLLY7eSHhYsT+QeC8IvdAF1LpkhHoNOJPLmoLxOIKOEhSDWjGtOcP7bFJaH4PIkK4NbK1Gxx/qZZNg1EBNu0osOOL61xLXex616mWMCujMIng6qBdgkJu1OZ2e0tDnKxgb2HQy8SJba2HioEWPHl5smcSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjWXwc+YSFNKmdQwOCkxjn4tFP0ZO2HWCk/zNC4JGpE=;
 b=jkk8w2rHlzWZ6h8j1YmKTApCUA0HIEaASkDypwvoiLlcX8yG7mKMdiEjTtdfLl8sQGgrap36eDVEEMXKk9andnGfPcRibTb220jJzj+JheLcSa8h7MQG8c1gNl+YUw0CEnjHFMjHRZXti3yTrIMGOrDNE0Eb9Txu3yIt/93GvwBAM9d9jd7fwo74GIzlt56eNpgDZTSugBNjI90bDPsuae8a4d9kpIC55IFFqnriIYJsaea27h9JcOKU1fh6itdUBPvVBypv+AtvXkctHQDHhgAy1IEpkpCXPxvmhemmvmGeAJ9qSGV3Am+gBMcnvWTxwN84d1dGP/aBPg2zdsVc0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4519.namprd11.prod.outlook.com (2603:10b6:208:26c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 10:33:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 10:33:14 +0000
Date: Thu, 23 Oct 2025 05:33:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH 02/12] topic/for-xe-CI: drm/xe/cri: Define GuC firmware
 for CRI
Message-ID: <d4ikvdzglnu7gakpv4drj7ndujtfkmnhtc7fypq36wy7zuhhhc@ldxa5qktgr5k>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-2-bf11e61d9f49@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251021-cri-v1-2-bf11e61d9f49@intel.com>
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4519:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e1b5f0-e1fe-4b7f-e078-08de121f90b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1HpNPfDKewMjjoNNNbC5Evo4cq3VP9Rt3HvUY/B5z/4JTPJlW2ChTsUZzozJ?=
 =?us-ascii?Q?TbHQfhLYkvjMgw9OUyjmSa8azAC4I10ZZdg//7T2i0VI3gJS54JIVieo8lww?=
 =?us-ascii?Q?tfv94Wdzt2gDxMAkqeq1h5zB9ox8oBxcNQLo9GmZVM/dMrAXyKHpJyrrGT18?=
 =?us-ascii?Q?p69Yko+m0+g63brqrvpOb55eYjRjqzbwlsrvBWW0794K0DvUNq+fGc8+Fd4m?=
 =?us-ascii?Q?BNz1YIPKIS+/NOUXpeQvs64DFF37WI9XzP5L0vD1DuvOUU7kqHuDJrEu5mY3?=
 =?us-ascii?Q?BvE7HbPYaJuk2MwMfmY/rkVwGKI8Jv1gsLGqHyDt9fAvvwgxxHPPb/CAWXkg?=
 =?us-ascii?Q?20UTLdsG7i0zncMQb2pO57Tc+dniGbWdmvu9L4ywQv8w548Qw2ZFpBHpaSQs?=
 =?us-ascii?Q?zJNbQAAVtCgW1OhcTGJODRFzqoqJIOtjhoTYDohg8Jfk9NojD1k6nlXM3VaH?=
 =?us-ascii?Q?csxbXBEE2/7dsdZlBh40sfWw3YFcEKsiR1BZg3BLt+Y58d/zVcJyP1R1eaIi?=
 =?us-ascii?Q?H8DL05mVxQZbORN1J3B0XU4GMxc0orYy478bZ9aTEZvwY+kATBTYu1qOUshF?=
 =?us-ascii?Q?pqDzPSSmhoSNh8kxnqqWl+GScKTvMomrg3yI/a6Evtc4a1RSzBZwijE5GwVi?=
 =?us-ascii?Q?7fds+Utl1/6dSb6wlVCafpIPuMwiaZEvxfD3eW7hENjxMSooMUGXhuyNvHQQ?=
 =?us-ascii?Q?WK3rqOnJ3Z19Gbkgmo1hA2/wL2flqQfQ6UVtdLP29jdJbGpTbNUZIbGJ9w10?=
 =?us-ascii?Q?aoeLM6vgVurFskPiUNiDHboJLR94JsngFr4JaGAgRP7N9SUi7rwr0gpC3tro?=
 =?us-ascii?Q?0xZq4VRjEhFhGadoed/vBYYUGC2kov0PLt6Z56hCfk/QkhdcUNjbIH3V3iCJ?=
 =?us-ascii?Q?ybFDmQ8SxuFhgeSFqZ6pWHqHQIUg1tlorGme2uuOO1aIL+oG79Uw0v1YuiTW?=
 =?us-ascii?Q?dZo7HXYFjO5pAdqgQWemEAQNkfN/9lxt6DgnQGz2Z0Q9Gy6w3trBZucXCrU7?=
 =?us-ascii?Q?LkkJoGIGxUkSykyKVqrFCw3lp0tu9PBY5+BjyobJSK3AD4+QUnjg2Kcu2Pfu?=
 =?us-ascii?Q?TwPDNKzei94VzSEKa+ICZVrhoW8z3IduOTk20FSD+KOewTutUdG32rX8bDPh?=
 =?us-ascii?Q?fU1Qaj5h3a3W59hf/vRg5nnKBwkXUfLRnFQ2rwlvOMBS4K7guExkkrN9J3hM?=
 =?us-ascii?Q?pKm+VJDu9Ros78BTiM5o0bHLsCtjVY9LrMY1Oc5RA7pjPf2xJekuW8lzRdIe?=
 =?us-ascii?Q?0zfnHE9BbtOei/AzNhP0HVChcGz+0mXmga+MXHCCxhipzWK/ui2A+FhQDxVF?=
 =?us-ascii?Q?59SOJy4OFnfCz84jCyMBYEvOktp2AWTwkbjGbHUZYDHXRIH3OHNt5CP49bil?=
 =?us-ascii?Q?0evqhFG4OxNZcsGO6D21aA3gFvcVTJTxMsOou0fwl5cxS6av+9jt7y5VmA09?=
 =?us-ascii?Q?uwodorgKwL9KiGWDublK09fY8Qb/gVaq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KuIet4ST3vZ3uerutC6h65u1oapntWEK3hHgH6KaCRqaWO9ScpsmO9ULEub3?=
 =?us-ascii?Q?SH2R79j/ivr0UXeB9BPWM0mR9yO/TPisNzDp6GdZFakQ4jkjoE6SUcWHmEmq?=
 =?us-ascii?Q?mY7PdrcWypKYYIQdqnu+7g1z6zixH51VESTKE47WWpW5SkI29r+rx24kFuoH?=
 =?us-ascii?Q?Oe9EVhXlkVmCp53xrfbzUhtRSARBYR/XoiYhAcp/EXj5ISNoCtnyjYRDW7WV?=
 =?us-ascii?Q?EIpnyGhjJd1+dr8FCIMT5aKtwHpVF2EdXGE7Iz+fyP9pwEiLX9/7xNGO4QL1?=
 =?us-ascii?Q?th/sKKL1TwpgyjKmH5oh00jIVbhCFA3PQf49nYKIDLeO2h2KvZ5S3/uha5ca?=
 =?us-ascii?Q?LZHXRrBSlnki0UOGVr1Pk/zPrT5t2unVi9mYNkBKLsRq/Iy21vL4//nHVZdG?=
 =?us-ascii?Q?gg0uQSvAr9mcWuG4IMXTdRsvzmsWe4VtyvmjLu3Gj7WS4zxbPIO7dlJIRSic?=
 =?us-ascii?Q?4ggO5XKOQGMOZGya2qQIwvQKSb8e3rK14Jbd03xGporCxiBY7iCxn5cp9DwI?=
 =?us-ascii?Q?9+oeOYqMM5DPqlJTirRUtGXcBan4WYyJia7tG4UcyWARJlVt90DTxhwWkA8+?=
 =?us-ascii?Q?Yno15XWUPy1ishzMnmThlS8No8xsDbB0iHmqSOE1x9RQj5yvVReDkW/B+jEI?=
 =?us-ascii?Q?/gPI6TZ5+RvDkxNYN9+JQeOmR+QyecX5O0Q+z8NQ6hJSJKX1m/tdEsK/hDw1?=
 =?us-ascii?Q?yfjEBwvPgLTnUm5Z/P/fLZEx6dTGiid2vHs8kABkGU45ez/LjLJV4QzsyiMC?=
 =?us-ascii?Q?m7nx1Ze9aqIqvOh7LN08ayXFXUxNUIbesaNi50Mk2sA+UqP2VpVufsJHekRI?=
 =?us-ascii?Q?3/nInStNt0UvjTn9qDZMkWsk/zPNvPwWEa/sEW5tPzBz71nvui0R9g4hzJQf?=
 =?us-ascii?Q?rp9wEthec3WmaB7zbL9VkFD5ZVcuZL2fsFnz0fedbMv4bRJCOgwJxtMdFdFK?=
 =?us-ascii?Q?AL9+h69MmR6pmC5B/0yWkP2o9dPEeN7WG3RBIuiPe90JpN34pSNA/7szsaX6?=
 =?us-ascii?Q?Fvie7WaT56O4lQwPRL2pXaI1bmuHDVNFEyTsoJob+2E2+WztCNPz9VcD/oui?=
 =?us-ascii?Q?arT7L89aICSXOoc3jjdoQcOjClnGOogT7MLoKiER367dsePwARUFsgS6lkaw?=
 =?us-ascii?Q?5dRKsxCsDxmvUCkpQIdmy75dxrj+X0UJU79ccG0ZHrpilQtlvG/Q9+kZXYwr?=
 =?us-ascii?Q?ZJKKKrVf7aHjLOabsjR6Qf9MkrQW2XnKwkj0+Khpx6T5uJDo8TKOOuBU/CTk?=
 =?us-ascii?Q?2XGmfvVyzMMQNnVrol2em7+gcExRKELVkKqtMKr0r2vKIfOwTUfE3wSVpwsj?=
 =?us-ascii?Q?oamF9b9aPDARhq64NbOQpeA/jJnH3OZV6cYqpvZL7NbV8N+KixQGgMpLjP0p?=
 =?us-ascii?Q?Z0mB/n/SoJViXEOveyT9Vo4ihMtobjGD+sYUk7lVWIuKPVCUTFAecmUBMShg?=
 =?us-ascii?Q?Nl6BHHWHSYEXAMwbcPCPzN195RD37YM65bjDsYStWK118g7E10KwwoNzxvUF?=
 =?us-ascii?Q?a0M3jO8t6yhpm3ogCM78u3bU4MhnIafE+5aiwzGo6wxSBi726H+H/b9fWgq2?=
 =?us-ascii?Q?3Hygr+db1H7USq4C/1SUyznnrdMzV6NsMisZd6iX53TnhP+TUSFDyjLBpBnr?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e1b5f0-e1fe-4b7f-e078-08de121f90b9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 10:33:13.1177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZVrId3CVfoAQ5ZUgu+NyQwjSiSONEEuYKm+IStqY4YZQ4P25vFKH5ymZ7UYUZ2x8+rH0YiLT83DwXRZ/eX/HmcYexEV7g0E6pTB/yTRFWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4519
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

On Tue, Oct 21, 2025 at 10:17:34PM -0700, Lucas De Marchi wrote:
>From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>
>Define GuC firmware, still using the mpp version that is intended to be
>merged only to help with the platform enabling in topic/for-xe-CI.
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

This is only for the topic branch, so not much to review here.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index e589c7e38f125..b4cd6226ad31d 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
> #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
>+	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 49, 4))	\
> 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 49, 4))	\
> 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
> 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
>
>-- 
>2.51.0
>

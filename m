Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCE1C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 22:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B4E10E19A;
	Tue, 25 Jul 2023 22:05:09 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D2910E19A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690322706; x=1721858706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7R9PYkqhyIhp8x5WyPfncsFQSQlo9HL0UaKCIdmZbaQ=;
 b=gq28+fUeVuPsg6faDTPpvKF7oZwCXwnWPDl2KLozOsOfTKkvqF1UsyFp
 dwCNywuT0UNeOcHLM8b1T04dOvBsIEXT8lyi8gEiWcR4binXZFwlLNoiR
 y3S6SKHGfXZaI7zkCX63OtzhsBIEUd/jOOI1lFst/mYc8JBbzvK0HMQCN
 pi/WHrmcLmdLrFy1nXyqIdPrT/D5Mu2uAJ1tpxPbKiUhrgDd2HDOso6yy
 rhu/8XJ+iVpGJ4mlH6ZvU0RJn/mxpfGsiuxTQQPsAC4mwgzYhKOGGUUzI
 eiF+U+9/wiocdatCEYq+B+Zh6EbA7jeNLamrOPn0t+ZpinUqK/4JmCUFR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352756537"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="352756537"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="791549672"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="791549672"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 15:05:04 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:05:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:05:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:05:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4K0PIxfZ478u1lpiY6KQJ5qOTltcG+m+bJbY1oY6LJOX3K4uT7ifqUQ5Z48eukl5zUw/SIs0Z7zR4NMIOLHb0eDn26typjw49tBvreganPu8Mg0BtemF9bdokIRaSB9op7X785VMZvF+fwOsADZfKe01Mjx7G1LOtAinO3VYF1/6Qzp0MjfchTz1qo0JqqgoBZVBqGm4TOR2ji5/fTBkAssenazpkeQ4MKK8QgFKQ9orFMjALFTBYfwKS/FLAow4HhOfiqZqJmNaFZB5j66ssyPTj53BiU3azrbh7/1w0qA6QztnHmVIuvtPgGJV/JG81dCnCzdiv6hrvmkf4NEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rx2YgXxeofbskQpCE6sSmL+4BSnDHz3ONQeGxYj5VLg=;
 b=RVytWd86Qv2x3HC2kvzu24ehi53pzFek5pOIwIu/qz/tb4mVnXZ6vfblSaivD8xVGHWEC3VA7Xbxk/Mdt+J+ROMZNaZl7tmaDsWH8t9NRthl25vLLt/+GhcrIwrpM4Tw+S+SZvbPq9B5RviYAS+6n6LRb3TpwbVux/J5RYRJlRIQ14ZLWkEEvL33T7LObTpbYA2u8vzdcelU4C92qCSyHAHP6DXFhzVrjh5C/D+VhxMA799b8xK4Klgy2fTS8HstIHrDKAhsTYGZjdHdp6WzrfQ8l0IXiKyu0hySt/LovjaLFpBLlcssc4vwRrJH+094SWs+S0OZVSiBYSj07VQOkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7452.namprd11.prod.outlook.com (2603:10b6:510:27d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 22:04:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:04:59 +0000
Date: Tue, 25 Jul 2023 19:04:54 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <tq7dhd2nnmbyqxndzvcdnyvmiasazyvfvwwlbpgvyz6qetcs4m@tiuty65xnn6k>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
 <20230725202836.3854908-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230725202836.3854908-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0292b5-8d1f-4677-396b-08db8d5b3019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1dSs9VDixIO1xzG1U+4sHop0uRYWkMPC4LDVmhJPmnog0cHWEBFoS4AG1WkEJZ4cjNuG82+5jqrhs4YhHn5QpdrZQ0u2gPxP67St4RpGc1T3JWfYW+U2D9PIcE3aiCJWoy+eazcAbWztP/zRBDGhp1BE230oM5yMBMYBIaBpwCyMbdGuMP5SdGXpYYk7AoBw0GVW3JvECb8h6PbnkEpD6qm0iKqiA1F5nQVFYnlhlTj0oS7eLU6i/DzU5aejAjfyDG6cuMOupegwzYHzCWLohcU6fEnEU9rOYph3v9OQXZBcGc5PrnjDBmhlU5yd3WzxN/eoPHffNwu8YW5hN0liGuZapMENdgULr25lW99e0hGgEkFZJTRcVbA+yPAAoow+YaI2Rc4C4rM8GPPJ76n3OF0PVvjQMNXp7xZ69KKAq4ra8Cacz+XMoPfLo1PqPOXxhV7gKjAMYbSVx9aSRRzNI0nRpSxjp4BMXA1N8RQCOsIR09c9aWyMcT2R+bdyJmup8HLiW5G4j7XqqzlPvCbfYvK7cv1qI6087HCUkC/LTc7IK4F+s1PbKzqAru4ilycv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(33716001)(6486002)(54906003)(66476007)(66556008)(66946007)(83380400001)(86362001)(38100700002)(82960400001)(478600001)(107886003)(26005)(6512007)(9686003)(186003)(6506007)(6666004)(41300700001)(5660300002)(316002)(2906002)(6916009)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sbavmNHS2Ecg3UgrEsjESwyWspNcs01x7vC3SUCfctyMg8O1knIj/Mcrx/xj?=
 =?us-ascii?Q?Tu/ZrdDI9Sn4TWsjcrWS1pGp5jLNzld72QmoHDCrIt2C6ioJ7oDPT4zjFjdo?=
 =?us-ascii?Q?DX9RucoslcG1N7kB1AeYD9SwfqDNDJ2v8XvGyxzv4KhgRnk7YOekSfchzk0k?=
 =?us-ascii?Q?MqhucIChrBIbz/34q93cCtbKvu6uMFDjsPS5+uKZm3XvJmmWyNhIscrLC01c?=
 =?us-ascii?Q?Fo8UvQh9QubkfDt/0gECBtsVYPz1Fkx931RJyN8+slL94Gb3x81WCpekFpx8?=
 =?us-ascii?Q?0xffaOsEq5jwREXpZ86yKgzXZSbNoAMUVRRucWlxhOIngMn2vKXQoxf03Xbu?=
 =?us-ascii?Q?HOJGSlChZa1RuOuRrp8D/cnkn/pHWB+TkfOn4sDbeZrHX6WywqMV2OAqwCjc?=
 =?us-ascii?Q?qayTpyC49t5lVCtzxW4jI7x8xV1/5hlsC/ZGiODFVxq3CKn9yP/q7p7+V5JD?=
 =?us-ascii?Q?KIyChZvjjOAXomPCyao3RaUlLQK18lG8NmWN0j8rK9Rcd2AsNXftS/ooECN/?=
 =?us-ascii?Q?bZlKF+IrC10IfCg97qiDOdORy1fkYYx174ngekv5prnKJoYP7L5HLeijBcpy?=
 =?us-ascii?Q?9NQgBVxXTkV+VAsKzUUzKp+BuYUZWPAw8CimHrdOG2IkdyTH9iRrfAG1XHba?=
 =?us-ascii?Q?sq1n8GckIE49lhxE3JnaQpULcp+9uwZBtej8Oa0ZoBwqW3NVFfZPpJ7fcLgr?=
 =?us-ascii?Q?B1xbpXpXiMB5zDlpNjagqUu9jz1Ro5bV6jxswsPlKdqI91A2tp+7VcLLYwnd?=
 =?us-ascii?Q?g3mr5MQ3gyhRie17sOCeQUADF3vRGZOOeuYrXtnP8SGxaUPpwOQSxvd6mDWn?=
 =?us-ascii?Q?4JEKrBFl+wygwOdNdoz32bGjY3EuEcybpSwwssf3aUFujzF3GJQI72znL6XQ?=
 =?us-ascii?Q?G5jUtPl1wFTv0wwH7X0Ri9Y1u3EV2USzGmxSGruTYRwUjg7wgtYXaWddjUtb?=
 =?us-ascii?Q?S4LCqOCjNwCZYPbt/hsi13dJIVKhOypmqKs6dXFDRiyYLjUbMS+iBPmUKgI+?=
 =?us-ascii?Q?DD+0oYPmjoNdOqZcIUqgVlUR9WmyNdQMWyaK2YUy05QDtDFucKtC+VhBK5UT?=
 =?us-ascii?Q?bTXB9MCA7gXO4srJ6Huoyojsw6YItTyi3+YZU6rwso/ohl5fZYzok8vAd/Tf?=
 =?us-ascii?Q?C+bkjCZbd06SXGji6DeWdnVAMf38rvolqd/YHprb5Fpg1cruAYXZuHhVYvSn?=
 =?us-ascii?Q?JW+i8ogL+t377zcsEl6rHtSGIzm3ac0Kjz3JomHuoKkQnoN1dZTpaXjtz6jw?=
 =?us-ascii?Q?Z3pTs4+oixZPxP1LjuBXoG4fZ2UXEXc0ppLw7Gn41U5aGorsXd9iBB5Lkvfk?=
 =?us-ascii?Q?JM2rDYzUzNzaxQybp07TZM5TU4mEW55WAn2Tl8AFskhoTY3eL1ElfpANgvn+?=
 =?us-ascii?Q?ZBZDQvpz+lvBsDfgruHHgDlAhmzIrr6+YcurV4jdD53hAwJwfV47HN+lxlJn?=
 =?us-ascii?Q?xUgbcPF3uyaT2HdXHKfxCGQOiHguTAIGcuXzKIY35FyUdIPzC8CB31AUsR6y?=
 =?us-ascii?Q?Irgv8kq4fJ8ktf7sgDxMqp7YavFExJmz8uV2myRcPh9TptGUisdDjYqvZQrZ?=
 =?us-ascii?Q?RO6htWkX3GzXZgMsrKGUPex2iiNVh67F14skQcrnDS+tFh+19iqzghpYi+9m?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0292b5-8d1f-4677-396b-08db8d5b3019
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 22:04:59.5002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKJ4OBlLP4pfstOIQtl3TSQGqiaq1jb2hMsc2HpcURLe94NNBkWUku5jk6RUuJY4E9HBLKql59MpGAkZDu0aefRaIWgWnW0m5o+pEHT3zaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7452
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Carve out top of DSM as reserved
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 01:28:34PM -0700, Lucas De Marchi wrote:
>Top of DSM contains the WOPCM where kernel driver shouldn't access as
>it contains data from other HW agents. Carve it out from the stolen
>memory.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_regs.h      | 3 +++
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 +++++++-
> 2 files changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>index 8be616a1bd51..dd7568badb4e 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -101,4 +101,7 @@
> #define DSMBASE					XE_REG(0x1080C0)
> #define   BDSM_MASK				REG_GENMASK64(63, 20)
>
>+#define STOLEN_RESERVED				XE_REG(0x1082C0)
>+#define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index 271b3fba4129..3a7d7b42b43d 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -89,7 +89,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>-	u32 stolen_size;
>+	u32 stolen_size, wopcm_size;
> 	u32 ggc, gms;
>
> 	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>@@ -124,6 +124,12 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
> 		return 0;
> 	}
>
>+	/* Carve out the top of DSM as it contains the reserved WOPCM region */
>+	wopcm_size = REG_FIELD_GET64(WOPCM_SIZE_MASK,
>+				     xe_mmio_read64(xe_root_mmio_gt(xe),
>+						    STOLEN_RESERVED));
>+	stolen_size -= 1U << wopcm_size;

oops, just noticed I forgot to add the * SZ_1M. I will add in the next
version.

Lucas De Marchi

>+
> 	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
> 		return 0;
>
>-- 
>2.40.1
>

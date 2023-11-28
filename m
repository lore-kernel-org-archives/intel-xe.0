Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A5DC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 18:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CABC10E171;
	Tue, 28 Nov 2023 18:42:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA32110E171
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 18:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701196941; x=1732732941;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QQXpTPE3YDy7o9gUS2ofnMbacIYNxzNpS4+46XDSVTk=;
 b=dU67BFn4mvIcoOEVH/FAqh/wgbFIOrFHGLA7KhKi0TY4OtOJCSItNlPj
 kEjQUQg7QXmEplEt3DE34/Q/AvWuvUos3cykLApC5obaXzEcZmGDOYL6S
 wgC0Lrxdsuv+eBTiBgG8jWb7NfRV4K6B9QQeKeN3V6SboNiJx7OkpUjFs
 Em03pdLFtPttrRwsOoXeS1DciecZ+RClF2BJU4bebX2SZJ/gEsVmuJKX4
 G70oUP5SsTdo83QHWOYMZAnvK9X6ZNS9aqoRgpcU2WDHBqWZOG27xOm6x
 EPI8fMNML/TCK5FmznIZXliiCs+Ga9SFTrSZlB9S3mOJXHXJELiWs8pZ6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383381640"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="383381640"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 10:42:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="839150799"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="839150799"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 10:42:19 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:42:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:42:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 10:42:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 10:42:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY5vIiXScJRyH5Rk5e7n8QrAxvOELCQjvPY36LssF4TQQddj9D2PbM7ra4GrPsWBNe7EwoePlpnPr27QaxWVGWIidVQh3cLcn+9guT4WW765pLwDjz+vAsRX+3To8lryppuIsM36c1hiUcZBgR0aA+Jr6o0r7OODPE0N832Tjjn2/k+NqmwACIWdt/DZkxBI7b+NiQqA4ECRwTXObH475012M0nvn/BF9xGn77tVVhIbwD5+GYfCHsamvGGC0sRnPuVbYH9GpV9Tb89i1otCQ/c3OsiLz2DaOn3mvCkhhlOiSNpL3PKHwr9lFgOdWHxPtnQTvZqiZYpcBZwl86MezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIvztJm0PUnkuZe7hfH8RzMC93KtoFm7vqu3uBaXXk8=;
 b=AIC6pmC/bbkwbgLt7i36gfpcWtG1aK8XE084dMWqIwfoIx/tdt+1dQKc83uzzf2/c3nNMLYxYOLyU4WFAXOmNc75NrqQzDK9tYM2Sy7dRtJIqgmgBEruEr7oAio+SpnzshqaX0dN90qahOPl23S0p4Jh87/Ea2LDsy/QeZabn8HGhUawL/JGbXanxQvtGHZy9WQvBOn12wjoi21Lof+V4GR3KCUkbHdqb3UDlKrDFqSdzMobMt39WvoPVG4e/nYOR5h3KG9tiaddpF3AanY5tYtQ6cEmCg6tejaRTnZJ7Qgca2BQMmc9khak/Pre+fpc33iaVX1vCg40/VjBTV8crA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB8315.namprd11.prod.outlook.com (2603:10b6:610:17e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 18:42:16 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e%4]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 18:42:16 +0000
Date: Tue, 28 Nov 2023 12:42:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <2shdzih77alry6puziabqq3udglakqygq3llhh7qons6pvkaj2@nmjoug5qilke>
References: <20231124141311.3894165-1-tejas.upadhyay@intel.com>
 <20231124141311.3894165-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231124141311.3894165-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: dd628aad-fd89-415d-cbb3-08dbf041beaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KjUnxK61wcdxecXbLxCkMHNJDXBBMXpHx/0z1sFplBG6hvSJw4vI8d8Mmv525l6T3Ry+OQOFkMwU5Dq7ibf9sWHxjPx0bI8Wd7JjxP5dP7/fVeSvoMSSbrLH+akuCa/EVZh7rW0kXIAkTLsYeq0Kie7REQ3H9YQh9DvpmDXP68twQ2s6i6n9t3z0cus4wUKbWLbufAzNj+o6cEhdLK8fIGaDWqc7EUSwWAyAK28bewJyw9aXRtvYqRA4hdy4OJCpMleSMpMoPIIuB6HyALHCObiDrHanw2REH9G0f+3cHUE9be9CWMLfshf19hsXsbDVNyZV8z6+ehwPhRob9vGh+ba/WN+bQ74ARzQPgvQCFOFwmb8FLN05FMi9C9urMDeFm5qbMkTLyS5VhkiPi28f5uvy8ggzT2W5Lg3VGPVnSFlw5W1VOjWbnOEDbA6JmVXgk5UR6kW8+Kokdqob6BM4aTKQGrg9aOjo1Su1XRVGuoTxxCbo1knn37HBGVe4r+N6ypX/mP3Z9rZJ7XlyqWV0Dd1dkLa8KCNQmv+ymjnPbVFSE03M4WNLmcIljyxRykvp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6666004)(8936002)(4326008)(6862004)(8676002)(9686003)(6512007)(6506007)(66556008)(66476007)(66946007)(316002)(6636002)(478600001)(6486002)(33716001)(38100700002)(41300700001)(86362001)(26005)(2906002)(83380400001)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TyU13ckayLuC4iZKKSw8YYRiFWt7BsDl4aE9pKGKjwVEE3cbnlG5VrQKZvFh?=
 =?us-ascii?Q?xFagAPKUis2Wjc1VpLqOp7xdQd8jbsizYMnXoiUCpXIhB42b082O9L/ohS2k?=
 =?us-ascii?Q?Rqo+43m5vqXJ2jhZ2s2tbodv0CMpUEaYx+e7sWyVOFRgOWaK0P1vkU/UVNaB?=
 =?us-ascii?Q?MEFhbHddPI3/gynn+VpLtAIlvmrfLdaQnls89OS9k/v+AIYHvbSxxVnqTkCB?=
 =?us-ascii?Q?VHB0KB8K/FWAqcgJjNfZV7r5ZhoZhskpkSuTlBJYLRlo2taFvD5IUsDvjrDV?=
 =?us-ascii?Q?OA9Yv4Murx5WDl6HwoFMMzQ6cfeLgfLzxCE+k+HTWPR799C23iduzmCri8MQ?=
 =?us-ascii?Q?hLoHaF2cSppxuzb5bugeLwqNIcwgmjlM8lAbaLqh9TGykEMunU7ZDAK9vTw7?=
 =?us-ascii?Q?oiO8j63OAXeXGT7Dlmlm10bpTdBBmIbtKoQi1YoZjNwngGNWasr75LN4rEJy?=
 =?us-ascii?Q?0YCi7YOKQ0TT04mVlN46hhM57us/rvvrX/O47efvJjEOsfF04mHcH5LmsNy8?=
 =?us-ascii?Q?HN/f1BM5zpRJvkt0nL3hrSLLrqTJS2saYza1Au88+ULsxTK/EQZQLgOSBUmO?=
 =?us-ascii?Q?TCVSqrgl/ZoNzRaaWf9iiBG+F4PJy3wuop65855614MajCGpHQtHgmP7esFz?=
 =?us-ascii?Q?F0W8ShzlzQpQS+uop5cC031vfgP98pz6q7d/czY4ZkuPwEFSz1+LOJ7r9y+N?=
 =?us-ascii?Q?3vxC0qRCYpleB9jYEshelG1EJSBPlWGyXiW3cs+NOzmPmymindVmg2kWeKQa?=
 =?us-ascii?Q?gq7HxI608kkJLzt7h1Duo2TFdN/g70dH2yloc0fu8zFflkQu5TVzpkyCLovt?=
 =?us-ascii?Q?0jbi+0WItMjX28DV1v1ubNN1oD58uFlsAcW3AGz2N8hFfhvCVG95iV4yYKTM?=
 =?us-ascii?Q?6ZePsDwlt1EZxi9DZqJTasf9kDd3RZm/kbP4PiuHy6jHDEci7Jvw3R0OFbqH?=
 =?us-ascii?Q?na04cM8GYXTQO+ZoRquLkTz7mblh7j8GsIT5onf0oOp9O9t+7LWttgd8wNxJ?=
 =?us-ascii?Q?Qe0n3VHVsNe4aWlgwCgX2nj9Tm3DzxK9WFaql1x9HG8FtQUL42xUnm3Em1hm?=
 =?us-ascii?Q?9hvTakUAORRqL4ao2Kf7l4lAeRwcCnPmQDgxGyGFjulbYqCpi3IMj/SBUgFu?=
 =?us-ascii?Q?1OdvZartzsgUKYuiFxN7b6BE1omApyNFZedSfVphyhGV9WBx5KOz4AdoL1jS?=
 =?us-ascii?Q?SqgNegdhxHseA1aWvOLwjOkOVn5UwyzxUmLsILaTCfysfn13Rh1gUPynaXWQ?=
 =?us-ascii?Q?DlAY7uqO704q3Z5Ez/ePi3E2xKIKeqhjZ6iDYe3IiJ+wLUYw61q0a2QZs4eQ?=
 =?us-ascii?Q?eVrQ5Zo0T7Ykg0WKgpL2Ec+oBrecakL2WuBs2zNG1+IOCbxWMcADTw3OvfVj?=
 =?us-ascii?Q?00msBRoQW+6AHdTjUJiMzFiLdjLSX3s9BvM81cyFD5EIgzohwzu5ukeuq6+u?=
 =?us-ascii?Q?YU3cAkcaTVawf9UO0rjNdktJ0nxQWew47wUudrYHI3m44u2CAJ7eHZuknSsD?=
 =?us-ascii?Q?fWTokEOumO17z4WY+TePKl8/bmeuFJBgaKe0A+NkMhV+gkvLMuRjL8lK9srm?=
 =?us-ascii?Q?27xLBHNZN8c4XDC43bl1lwOeZqQEFxXYgg1VepAdpA/lW+ra77dwZBmAnoTl?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd628aad-fd89-415d-cbb3-08dbf041beaf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 18:42:16.7965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdXRpYnQVPKPK/HHJLVHL05RwW5eb1Wiq8eqkPIOX0d00UWBSKQHtHKmGOqT+ws1mXvZI2UUiOy+ztK7kxLbGbKujLVCfVwnjZ4XQB+2AfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8315
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 2/3] drm/xe/ats-m: Expose uid for ATS-M
 via sysfs
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 24, 2023 at 07:43:10PM +0530, Tejas Upadhyay wrote:
>On ATS-M CSC firmware calculated unique device id(uid) can be
>read from defined registers. Only ATS-M has this way of reading
>uid. Also ATS-M customer require this solution to locate and name
>their devices effectively.

s/Also ATS-M.*//

As this justification doesn't really belong to a commit message.

*This* solution can't be a requirement. *A* solution, with this being
the proposed one, maybe.  Imagine the mess if each customer with each
platform requires a different solution and each solution only works with
one of them.

>
>Consumer of csc uid is level0 sysman and end users using sysman.

so you mean that only ATS-M works with level0 sysman? That seems a very
poor abstraction to be done in the kernel. If we need a uid, let's give
a uid that can support different backends so we don't confine the
support to 1 platform for no reason.

Lucas De Marchi

>
>This patch exports uid to the userspace via sysfs.
>For example, uid can be read by:
>cat /sys/class/drm/cardX/device/csc_uid
>
>V2(Michal):
>  - Make separate patch for csc uid capability
>  - Use %#llx for 0x
>  - Dump error value when sysfs creation fails
>  - Have consistency in csc uid name
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
> drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
> drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> 4 files changed, 37 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>index ec9372aa739f..3599c7b38b61 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -71,6 +71,9 @@
> #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
> #define   SGSI_SIDECLK_DIS			REG_BIT(17)
>
>+#define DEVUID_LWORD				XE_REG(0x102008)
>+#define DEVUID_HWORD				XE_REG(0x10200C)
>+
> #define GGC					XE_REG(0x108040)
> #define   GMS_MASK				REG_GENMASK(15, 8)
> #define   GGMS_MASK				REG_GENMASK(7, 6)
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 8be765adf702..6c8a9f9d69c9 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -342,6 +342,15 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
> 		xe_gt_sanitize(gt);
> }
>
>+static void xe_read_csc_uid(struct xe_device *xe)
>+{
>+	if (xe->info.has_csc_uid) {
>+		struct xe_gt *mmio = xe_root_mmio_gt(xe);
>+
>+		xe->info.csc_uid  = xe_mmio_read64_2x32(mmio, DEVUID_LWORD);
>+	}
>+}
>+
> int xe_device_probe(struct xe_device *xe)
> {
> 	struct xe_tile *tile;
>@@ -366,6 +375,8 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+	xe_read_csc_uid(xe);
>+
> 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> 	if (err)
> 		return err;
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>index 99113a5a2b84..4fbf0275d3bf 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>@@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>
> static DEVICE_ATTR_RW(vram_d3cold_threshold);
>
>+static ssize_t csc_uid_show(struct device *dev,
>+			    struct device_attribute *attr,
>+			    char *buf)
>+{
>+	struct pci_dev *pdev = to_pci_dev(dev);
>+	struct xe_device *xe = pdev_to_xe_device(pdev);
>+
>+	return sysfs_emit(buf, "%#llx\n", xe->info.csc_uid);
>+}
>+
>+static DEVICE_ATTR_RO(csc_uid);
>+
> static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> {
> 	struct xe_device *xe = arg;
>
> 	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>+	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_uid.attr);
> }
>
> void xe_device_sysfs_init(struct xe_device *xe)
>@@ -83,6 +96,14 @@ void xe_device_sysfs_init(struct xe_device *xe)
> 		return;
> 	}
>
>+	if (xe->info.has_csc_uid) {
>+		ret = sysfs_create_file(&dev->kobj, &dev_attr_csc_uid.attr);
>+		if (ret) {
>+			drm_warn(&xe->drm, "UID sysfs setup failed err=%pe\n", ERR_PTR(ret));
>+			return;
>+		}
>+	}
>+
> 	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
> 	if (ret)
> 		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index a28257b26355..eb3897309dac 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -238,6 +238,8 @@ struct xe_device {
> 		u8 vm_max_level;
> 		/** @va_bits: Maximum bits of a virtual address */
> 		u8 va_bits;
>+		/** @csc_uid: device uid calculated by CSC FW, used for generating uuid */
>+		u64 csc_uid;
>
> 		/** @is_dgfx: is discrete device */
> 		u8 is_dgfx:1;
>-- 
>2.25.1
>

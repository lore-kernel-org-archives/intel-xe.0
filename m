Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A259CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 14:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FD610F1F8;
	Mon,  1 Apr 2024 14:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5IGXG+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9CF10F1F4
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711983318; x=1743519318;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3wtiezdOb5p3G2BrfbagLYONzTNU7rc45RdBcUq+HI4=;
 b=K5IGXG+ZjOJUER/7VBANbrMrhsCY3MVPt1tOJrFUAv9Y3gLMtLWICSxe
 lUEHuTvTiuhe47PZZbL69trncsfCxIh3QcSgVPCPwz5+DeVvj2cvmcRIK
 JxS0HiZE4A/2w7lORsOoXV46YDvbEzkL9DBX3xWE5mrl86eBU0v7Ni6XA
 U1Ey4/SOU0KIV95PCeY9fNEGJqQ6BPfbWbIvHKzp0VWf4miPEM9VSZ4UJ
 kuwxNjRik51GNHEYThrpJ5w4l8bfhC+whWPfixSk2TzUEPcKCl6OhL+UR
 D/olVGCVxNO1efphclCU+h4Om9VBvpev5/62SJLeECXCejHyT//0fuBUb Q==;
X-CSE-ConnectionGUID: ELeuYkBGRESL0yx3fYQ7HQ==
X-CSE-MsgGUID: EsesjF1rRSSxDr2jml7P6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18471848"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="18471848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 07:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="22399595"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 07:55:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 07:55:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 07:55:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 07:55:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrpwDTp83eb/vhWDziu+aICPMgydhdVMLHtdXzge1NmVKo7jGxVST3dHlO8IPXrcb7hOzeJ9aDX48kKxUOwYrAF7gTJch1yRDblqPeCF6Po76VRDd6tgHq1WdZZgVnUsWrBEyLl8ILoq+GtC067UzRu8s3b59NzLIaw+xWo57hlI1X5Kev/A2yf6rDjc3R6qZYkR6ggGIEJgVu1AkGvdUo9Di1tJD03IQ72uL0SFjYBhpnzK778sT8wxBmY/pzKJdJRH7Y/UR2B2qKA2Sh6Yqus8CUWwu/v1PicOhPA5UJotKydWkgQnTgUIIRlqNf+qSehdvyUUzaGka+4GMHSxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDWU6i80Mxl4XCbpwwCxlHVjRCIoiRk/IGUSg5VRPSE=;
 b=buU+WeSix1JghXcl6siV45X3C9YT4rpgN+xId3+DF7sarkEdJheMzMRFnzWOqwEz/KQMu0oL9vmrW7IwzhafuBIDgFpQMU4E5zggnAUvo3bi3yJkgxcIhkIb0HKN8wnQi4ApcozXc1HKgCirrT8vJKfw62Z6RRtZFtZWAMS2IVaNPqAPfd/jrlh274lZatg5qFnxoI8miF09Ybe943bb1UF0Brtv1JdHn1cXqki4OtsEREZRuN1GdMdlN/BbNNz2UmU97cQLOOiK2Y++MPptILGwkmPdK7390d3SRVHl1emIf8QY23ZhJan6v3xnJQeQYNgNzOBqho4M781ief3BHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.20; Mon, 1 Apr
 2024 14:55:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 14:55:15 +0000
Date: Mon, 1 Apr 2024 09:55:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: Update xe hwmon with couple of fixes
Message-ID: <5tritiq3f7ku6avviu43xp6idj4feiafsdwlpl3xflrfwkmbhh@bdsnsgfl5so5>
References: <20240331145340.4065125-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240331145340.4065125-1-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6405:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PN5MCUWrFhKIHzBMHks6YXdYlbeAeVmkKaV+RpFemFroWi3dfAVkrOyLtlIbjC/JW2pYR6u5eaegj6cQthBwl1R3Cz4GVJQ+bqQ+Skp301HG/3B+vN6LQ3h7r5o0or6dFKsitjPTCj9gdGV3+Vssk9SzXXauiyr3Ry+ecba1pAG7olKxW9gu+8mvkoneuUfAKt73TZGIZxjjhwnzSBSvyd7IY23HMRtpnJ2Zd35LvNqMRljkpcOfbNsuItzYIb12cpS2wg7Ffh147FmUuVjujqpYDxlwOHUWasHR5veiSsg57QH34ORKYTdT5jFNK4Wtiy6UPi+jEUUUqRiOz9dpYJBRAX6a11xkB/UqTqeTacyKLqp4PjEupZlXaRrhFgXIpu59RhaH4bORO9d2bkNY8prG4WtPV6GrwP4XRNmoosA2wpofZpcJhu3VVXltr/rW6S+eMsNT/jfaUOcfNcoNdK5VQgKNtn85mnro46go/7eSnnk02T2Rv+PMmgPSgXwonqkuB1BzyWPVt0cg0NfB1YauuEW8Fgm+CHdnFtfe8MTdFpiR2M2m3WPxYf21i/aY46SeTFNfTZguMQfw3eX4B3txuD0LAZl1KfMm1tEOjcsz9016dJzMEYC5ZdWnP2Jlq1sLAv/MwUCsradKuaOTFor517XDFdTcXdhl5iyzyU0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?si7elcttzlh+B+YjuKRj49mhbdJ0vcBN+2QgZ9trnhMBJcT+F434GD+QtyRn?=
 =?us-ascii?Q?4rqI1xz6FNqsq3ADTQqgYSK58E2QNXuSkCYy/WtxAgkdNf2dKDfnjs3m/z5b?=
 =?us-ascii?Q?T+pe+7fOA61jjPndNs+uo29El9FiPhmHREF0PEIkBVTfFro5kZjsrd8s70gE?=
 =?us-ascii?Q?hu28yRpg/8xFJwmQt2f/e1g1rF9gOEFT2JHmXpsiNJnr2mOrbPt3jOJuSvqa?=
 =?us-ascii?Q?UdSGpxUiXAq/P4V9kXbBdn35VneMEL5d6RoN97EtycM0uK/kMFLcThW6IA1T?=
 =?us-ascii?Q?E7nFI+Fs1UEt8FAMWYXWgnBxIzVJgkDfdoYlyYUvsnR3BZaGVwzEwbRLyxID?=
 =?us-ascii?Q?l7s1GyE1hoCID6nrMpG8lER1JH50iPjvP2V5J3JBZosKCNDsM/sMoL10lP1f?=
 =?us-ascii?Q?i085Hq51AWsUDJRxNRD+gtISHBhDhS4Txd7ZdHv01WOgf6qVj2Dj/IbVfgwi?=
 =?us-ascii?Q?a1EED8LH5WLZNQ1R3+uAdWASyK/NT2KTeeeqqzgg6W5f9w8wd3UTqyJvo8jB?=
 =?us-ascii?Q?8UN74ShHCINjt98MqVN3giPygddYlOxHJBAuJkfYwHT85HOK1Ropv53qSYqV?=
 =?us-ascii?Q?JdWMsbh6Tmlh9x4R0IHnpnDE4pQiIv8EGzf35puj8IvNugieJXdtfM5sg/+2?=
 =?us-ascii?Q?H9MGU+2pOMRs4llLOMXcbWVXHk4rpbvrsv9HgagvqD1EB34GFrq6xJD+Ract?=
 =?us-ascii?Q?MPAEAJB9O6Z/45wBTQn3KQiz4fbkx0Bs7hiH7cC/VUyJ41Viatf/uN7BKuEP?=
 =?us-ascii?Q?S95Z6frSw3UqWuRWDZdx9z3u3uCPGnUtAfxntyKmC5HSQwLyBmVkaewY5KUG?=
 =?us-ascii?Q?9o0+DnlHgr5dO6P2GI5IxXhhPdkGYSRLJj2HcDxQpQ+gzjUksfJpwtTa75uX?=
 =?us-ascii?Q?s6RouwuZT96W1sKBJnwVpSMZoesMCR6hPeGsU698u4vLuoBbPUJvhzV7UmRH?=
 =?us-ascii?Q?ZcQioNZ2jAFm62XicVulZRVryPMO0mq/jDG7M6u8DTTxpg5YpJ5z4nCYZtKc?=
 =?us-ascii?Q?5VDJTR6Kn/9V2Ts1HGBYyDmSiBEX3w6DR5HIrGybJfcC+5F7UbLeW1jq2jEH?=
 =?us-ascii?Q?+LM0SQr50YqvaqKHSbGCrtZLh/om0j0Mjl9Fnb6Pfmi9kBusnjGHaRvi6ASh?=
 =?us-ascii?Q?A/98vqMDWs2ZbAPmz8A1TTafYmKn2QM81RSp3+yoja6DT0zLgKLZdcL1PHu/?=
 =?us-ascii?Q?AP1kLgXztcYvTlkTxjFqlxLxiCkfsJOLAJp+zmmm+URQAyfEr8/+MQaKOUIf?=
 =?us-ascii?Q?ARG1QmM4Er4Oc1jePve+SadR4MBzuIEKAHkLkW7KbQUveV90+CNa0ORs3SQR?=
 =?us-ascii?Q?+HcRxWRuWyDxxq2oSA/rKJf5I0ho5hZi92mo0wQ9AUAUS3OS/I6xTrWDIKiN?=
 =?us-ascii?Q?TfJ5//acUb6+DmED2D2lmjHchp/N1xD5674tbzIYVIM9tJRBqdnuZ6R4TUSy?=
 =?us-ascii?Q?IwrMf9FtmuTYUQFVpP4Lg+elFm6hncZ8APbhhad+GtEqirMJgMjJXD1h1tyI?=
 =?us-ascii?Q?hiBo6WznTeJjj161PZSzKCSukOwcEIBEzgUfBxMZe7lp2dUXFCASaRwP/zJP?=
 =?us-ascii?Q?MZdXAQXMvGSIgZAG0VcpsC9Xb58fASYYCQdpbNJBtmpSZvqPK4wk4Jiwxt+P?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7177363-3038-4bb5-3d28-08dc525bbd63
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 14:55:15.4967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRmPqWKb7OTy7YTS2zPH+iHxiz+0ZY7/W/bbyMpBUWVr26ZKzs1JpNZwJ4c99GrqPRt1edpXnO4TT4VbBqbd9dnaVoVjSn13k1OajrkFreU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
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

On Sun, Mar 31, 2024 at 08:23:40PM +0530, Karthik Poosa wrote:
>Fix potential overflows with upcasting.
>Initialize variables which were being used uninitialized.
>
>v2:
> - Rebase.
> - In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
>   With this change caller function need not initialize value to 0.
>
>Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>---
> drivers/gpu/drm/xe/xe_hwmon.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>index 7e8caac838e0..bc1bc73749c1 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -129,8 +129,10 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
>
> 	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>
>-	if (!reg.raw)
>+	if (!reg.raw) {
>+		*value = 0;
> 		return;
>+	}
>
> 	switch (operation) {
> 	case REG_READ32:
>@@ -143,6 +145,7 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
> 		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
> 		break;
> 	default:
>+		*value = 0;
> 		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
> 			 operation);
> 		break;
>@@ -298,7 +301,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
> 	 * As y can be < 2, we compute tau4 = (4 | x) << y
> 	 * and then add 2 when doing the final right shift to account for units
> 	 */
>-	tau4 = ((1 << x_w) | x) << y;
>+	tau4 = (u64)((1 << x_w) | x) << y;
>
> 	/* val in hwmon interface units (millisec) */
> 	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>@@ -339,7 +342,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
> 	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> 	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
> 	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
>-	tau4 = ((1 << x_w) | x) << y;
>+	tau4 = (u64)((1 << x_w) | x) << y;

these last two hunks are justifiable as y max is 31 and x max is 3.
Casting one of them to u64 ensures the result doesn't overflow.

Lucas De Marchi

> 	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>
> 	if (val > max_win)
>-- 
>2.25.1
>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC6FCA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 14:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D61510E295;
	Thu,  1 Oct 2026 14:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKE+8UpI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7EF10E295
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790864070; x=1822400070;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=92RHdGViI6znzcWOsi+QnGaer8R0zqM+xcpi3PdgWoQ=;
 b=fKE+8UpIUL/fgM+LWct5nWva7bBVotIQLFU9NYL/m4AtRqXu2jGLjrGu
 MToBNy2RZRyRTbnEW1Tan4X6BPu+9demSxn1YW70ySXynLHLARGZnKfyG
 Yy59VAeBPuNIG09Dk8onSC7TuTCjwAfZa+fF5ZMd6s+pX92kNmbYZxdDl
 omjjx+KRO+3HfQrIR4Df4OTo3mjo4eax7+Av8Df5JjSsZRUU+MFjSAYaw
 A9dvVrn08z715ZPQSMunT5TSOABTgcgE63clhms3vD56a6con7Ou89ddk
 bjqBPZGCzwO0ckPAXt5rwm9GxH/b20KYg95BtZEy3g9Ymuga9DeQTndWn w==;
X-CSE-ConnectionGUID: DUwRRnBTQXGEw1nhvRjGFA==
X-CSE-MsgGUID: 4RJGMm0NQRyyDYEm0jXZpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94334740"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="94334740"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 07:14:29 -0700
X-CSE-ConnectionGUID: 2EJs1k2nTpGpLmAMToo+EQ==
X-CSE-MsgGUID: FiZtb0JTT7OZerddLXUYpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="276050774"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 07:14:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 07:14:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 07:14:28 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 07:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzTWJXGSzb1NbgYemPOUeltyxlP6rdGwT78bvEUAjV8YrY/zgan323g3+fiXpOlA+CEcdFSb3SwMy7FyOj8BXTMY3OLrJOb/WOvWEFyB/DoX9a2ev0HJF/ZE+FIODD+ho4WaBoZlorI0KogqXw0zwh7SXtNYBGCMI+meZDr9bpoy30RcqmBFuAaiqaZdFKR85zJX8okGIBzAEQQxzm5TYb1z0BDVocJ7Y8DbMphTkRpx/FJn4Ow2KMHYOP9GGdQdcwwdvwVviTyJAFRUifXbJNBXs1og+4X/R9WsPErAlr3SrO2Uw4pkmUywZPcSN6PmW77s7xV8uMlsh8Vj2/VMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYYDnw4ikRQZ0cJmjPTXu2dBiWReFPq7HVeHJ8Clj3E=;
 b=nZEPtO+ASPd/ArIm6qG6bEc3jD+oTUR63fRIrSb8hjVybz7Fj7fDbBcvoz35359mkLNDFB/Yzk/NPpcrjgw0h0NIohfkyHJsc//taLN5Ujouc5rGcV12v4CfHSh4mg6hQy0t2Bjnrk7mXKQNrp5M5v4eP5ayn6C3Xyy7cRLF5HHsJRbxU9AgUvv5EIoMKkwMSqCSKM8ktFJlyzdxLG9Zq8qrWN63GB16nmLv8oRwmv76vgZSZD9U09qdDKIGDuqQJFHCmoY2LbhwxEcWi9f64UjdQz7V8kJcduU6adgRR2qEyGD4vhaN/ZsXhhnRxF6U0sgKQG7jTiSjEVQ+/duqtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 14:14:21 +0000
Received: from SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67]) by SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67%6]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 14:14:21 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/xe/cri: Add new PCI ID
In-Reply-To: <20261001135515.74225-2-balasubramani.vivekanandan@intel.com>
References: <20261001135515.74225-2-balasubramani.vivekanandan@intel.com>
Date: Thu, 1 Oct 2026 11:14:13 -0300
Message-ID: <87tsn5bj9m.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::15) To SA2PR11MB5100.namprd11.prod.outlook.com
 (2603:10b6:806:119::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5100:EE_|SJ0PR11MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ffe6f8-d006-4d50-9afb-08df1fc64991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|11063799006|10067099003|260925021311599003|260925022911599003|260925021911599003|56012099006;
X-Microsoft-Antispam-Message-Info: JYaojDziFMyVquf8i8UobfDukd44pf7+QY3adTzL+X28sUzd/SHOHIj6O/lg4zxL8okwguAFb5w/eRDywV0LJAnVlu96xQ87SdpNcc2dHKutn5wRAsFGF4CD1q4uHkEklTNLGWGBLO1hoJSgA6CzCb+2lgPWt4CXiUQDN5IxRRHLegmh7jyaa5RY/vrlQHzbSNR53pj0suuu1BPbRrzAthuCtLlebfRZFiAfos+dqiwLAZWAsUknq4e5cgUnmYfcqcoWqNC4q4YDE2/RR1q8QUoUZwWyeRy4vbfh1w1L85x1+ikYxk69wvVJhwPL2/xCLmG47UAVTmkRNu1nV5mnfeL4YigljA0BKfr32B+DmPEhhfYOrDFkYnnM247lc8A84p8tF8eeFd6OaTHrTSuIrgNU3Ic93D29/ql4UNHHvwIcQLqh+PxDZQcH0y0U4zr1HkAz47mm/qJFIFizh+ZGdjazXtlEmPw6LCHG0UNbPyFRbjg2PLJzyB3EgOwy38HTvwTye3CF01fFBfYExP9koJtBKG7Hx2xunT+LhIOhdNqvbeup0CU+7Fxow0SifupYCAnczrp7aX45eUPVuM1UfBg6MuxXCNBKfXtlKAy2WkS03TZJGGuupzmXKPUXlvnPxSfl01GJ0uzIs14VJyfil9zG3Usz/DM+sYzo/NMrkrA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5100.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8VLQDIKyEgkRMwA2y6z/DMPmfVtYvmcGP6qc+JMcBjDOpAjfbApvzyFeoy3G?=
 =?us-ascii?Q?wjXEuZ+0T/RZ33AiXunCc2/sq8M10Xftuta+tTmM9R+32/LhZqIUgE3w4ADf?=
 =?us-ascii?Q?zaKNaYONANBePg9Pg665owkZqO/a0Ida5Wn5f2osBifbhDCO/wvDcVPrn77A?=
 =?us-ascii?Q?xmhC6D4bMtWc+7iCvS5rGH8Yo4EKzDXmHsSX2yVs7OgZjVFZ7Xt0gUAmpyIi?=
 =?us-ascii?Q?YoQN62SLKwbsYZEBCZuoPaQY/b67uO2nEBTm92QHhzBC3KtEnUE80MSOAR04?=
 =?us-ascii?Q?LqjsxYjZjvqjPvZupkvwJzItovASECkLE8Gzqbtue4BEbtQFMQ/3D1ykWZ9w?=
 =?us-ascii?Q?DKcIX2ZJgZxfRpuz86gN/fQhGNthpachgjmFWvDGQ8gxIPudeBYtK1dcBBSk?=
 =?us-ascii?Q?bUYiAISNhlEZhvAfIufKYWobk1cF2MCw72UTurNpjYQKBovywdd2ScDknnZL?=
 =?us-ascii?Q?nc8MjN8k1L0VKwdyDeDdYCPOuLsr8jS/6GJWiOaAXsWqmo2x7NN8T2i3jMDC?=
 =?us-ascii?Q?Jh/Pl7uwY7T+I0q4RKDTuUgd2D2e0Nw9IUcQsnyZXb0ZqhPFzW3mFOBFp5w9?=
 =?us-ascii?Q?7KmajENMV3ikayZBX7Qkj6+Q9msmspo7D8i513AK8lTiLvhwyvdZ54inyS1f?=
 =?us-ascii?Q?R6248aZYcEp02PzTUP3XdQY7yzDU+MZGw0HUmU9eb4zC5fu0tFpCvIxdbgC1?=
 =?us-ascii?Q?tQrEnt4G88CMc5MsV98+GyJHvfJQJEWdosX5cj/SmX7pOwUmm7dYzYvc4VGI?=
 =?us-ascii?Q?9x3OubYaHdB2/HmYYfbYEglkobAXvw7/I2+JnN6ipeKFtIps5wiFW9CYI/EZ?=
 =?us-ascii?Q?qznww80tobqfKKVO2YolpVoBDmVP+2vd4Tw4LbvF6yPY5APD6f+juNl4Gc+h?=
 =?us-ascii?Q?4NtYmE2vjSFGKOF8cEi+HY6XtzGV5krGo+k3Y+aCOV78ED2TJ1oJDb4RSMnj?=
 =?us-ascii?Q?AmmAcYV0EKH0PyuhRikgOdPZ/0dn6GAA80GAJNSRRGG71ltd4w2EeCuy4wHV?=
 =?us-ascii?Q?gRW83I1OVuIkIuqRWQrqqc8EgN378wkwLZcZkmzhPYEZRnQQKa8bJ/0m4c8X?=
 =?us-ascii?Q?TW9gZ+kxjPAklasjvQnQmk6/egn9OAtg9sjyS7uXhCvjqed0JSHB+j1bS5RP?=
 =?us-ascii?Q?tfJHOLgI+V45wQATkt+rI7JvxXWqdFxSg0uXVsuTtV3cUZDubJZ6koXOtPI/?=
 =?us-ascii?Q?bjKgBym6H+IxBzhG/CgJ5MbA5WST4isArI6NtuXHTIfBKXbR6WEDT4zvVl6Y?=
 =?us-ascii?Q?KdhzUqT8x0PYIS70EAnDCpEWPSNMfmoWYnqG6Gsg1BtQ0yS+mf4Ic3LJ/syv?=
 =?us-ascii?Q?tFQma9ab4ZnzYdHtP/+2p7myQslRawZjb+PBFd1zBWIxSlnFkYD8ShwaYOvl?=
 =?us-ascii?Q?Xu5m7fYbiZbr1y30cUNUNUvf36hOvBroT7JYVKoOQDzzgr1QDNolIc5wr7lO?=
 =?us-ascii?Q?57MVxiTDOkAzR38fijxsNhvY2TF0B+/5sM4Z9JdNlP+klLlHNVI92aI8Xh/7?=
 =?us-ascii?Q?NJMc9mTFneHUF0jfrn/Cn2mrpMl2PD8lgHgwEQ38IGeKfW82FeI/lb9WNQw6?=
 =?us-ascii?Q?zXsEWh0U7XoFWO72TBt2ElN8dKHAlVqy/OfFml6b1TLTDo2/WVoSkvQaUiul?=
 =?us-ascii?Q?sgImokjhOzAIwryo0nXN1HNI+Grp6gnWWBbFL+oaU4Ld15ecLAIFawRRtvwt?=
 =?us-ascii?Q?eLw+YoULlRzp3E0gZFE0WgMXqk5rC/PydrSTqTY1N3SXmLr7aZumEhXTS27t?=
 =?us-ascii?Q?+Qn6MCphgQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: l0pxToCTZF9OEWV1Q0zJ487CdNMrLIzPYpKtMLMJKn1NBbB0V585fIz4dsVgS5RYjVZMc12RHzfEjQw+pTTu83lKz8kG/IqbjB29RViFfMcEkTga40hUF6of7qcBDr3erYqHHc+tFVyMjxH16GLlLTRq9vurpiNfxnW1Iw4oaqD056+5iquEtbl/BzOA61911zH54F4rO/4Ksq2UTlvNMOzuYlE7Di2coGq011AK6+n7WCySGsY2px0s1Pdpv0p93A+F5e9pCiVZmb3UsoutglEkIVCQFoXPYKBsdG3eel4NSDrbVNlhuq4D+7SOW2WuNa4XEAUpCf2HFHkiPbDe1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ffe6f8-d006-4d50-9afb-08df1fc64991
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5100.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:14:21.6238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVnWEcCBOXT+aN6szkNYAVAwbN+2TVQ8scasBvgE/r181jtoNvjwz8hGNtHmOeuH7jeySYtIMFD3LWlhAFr//A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
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

Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
writes:

> New PCI ID added for CRI.
>
> Bspec: 77979
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>  include/drm/intel/pciids.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index 32c88a690ad82..a2160920781d4 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -904,7 +904,8 @@
>  	MACRO__(0x674D, ## __VA_ARGS__), \
>  	MACRO__(0x674E, ## __VA_ARGS__), \
>  	MACRO__(0x674F, ## __VA_ARGS__), \
> -	MACRO__(0x6750, ## __VA_ARGS__)
> +	MACRO__(0x6750, ## __VA_ARGS__), \
> +	MACRO__(0x6751, ## __VA_ARGS__)
>  
>  /* NVL-P */
>  #define INTEL_NVLP_IDS(MACRO__, ...) \
> -- 
> 2.43.0

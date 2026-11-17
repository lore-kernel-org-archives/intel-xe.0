Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C732606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IWImwhQx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jG2L+Pxh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C7D10E07B;
	Tue, 17 Nov 2026 15:27:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AA910E07B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794929243; x=1826465243;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vWIjYSmqFFN5oyQZwF/fvNs2U9rVfztH1rMNa0J7qsA=;
 b=IWImwhQxqFMLFLFt97krtU3Ktsjt0UUUhCw0Pvf05ss9fEVuw01aNTq0
 Xig5YDFttJ+l4Zjj2CgdTYh9UQXTBi3aXA4c3eJGXqoZq/+LjzmC1kJTM
 y1vFvUqw4ooP9hjgz7pCZnyqEGJlc7CigoxkOZhFQyQ6vre8p5vpuiId5
 bjBOow+1V4x7sMG1/IoFVw8yUdl6tt6CWzB2OH3PLsEvzyjB8gf0DmAjx
 F+7B4QOVQ4sZ0uqdOAzBndUtDqDtQzcgPf7go/4Ok7OvAGHjZgm75Gxxi
 hmDByYyi874nEuSPS35X7BQxBIqNHyrV+jRe3taqQTFSM2L8TphUFM106 A==;
X-CSE-ConnectionGUID: z3NRM+U6TS+975eITuNUMA==
X-CSE-MsgGUID: FTsPcUH2SBa9LiR/I5/Cag==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3602243"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3602243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:27:22 -0800
X-CSE-ConnectionGUID: uBASZmwrQuCucgY3QBkhwA==
X-CSE-MsgGUID: QT+4vTj0Sm6UzpXn4apNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9999184"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:27:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 07:27:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 07:27:21 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 07:27:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOfyXGNCSAPC4YejqB+XDcm83aKlm5laAfosJVvDeM1u4iuVzf7jVrjelN66L0uNzq+lCNyqEO/BN+yp8chzkTd61l8o6s3FxMnZS24R6RljITM9pvDjavELq63Z98rNxymV1WOFj/RbVAW83Jh0mx2GDT5xfeqeUgViKeDJjCWrc7c9MZs2H3hH0h5TBtkIrsnd0gA9ZPWHPNIhvenq3deJnX1AlfdJ7t7cOlMmzIyWuNt++IW2JJ/kNElvGs7l6x2whKDN7e7EDtMelJBD386YXNUAtv/UU6fhiKXf8Sq/JsATcFdZdSpJee4n6QfgBttJdsDSoEGwilxVkO1LKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2/vaBVKDLP3qhsLKFZZCIWDxBCr31II82DAJFtU5RI=;
 b=HV/4K64hS60ASATz06vGTtT/Mnj+gjwl8FY3qFmSnNXkGQ/2CK1gbpQOVhiWSYCYKbceUVilS3HpSb8mTQdlJPGMDWO9SaKFh6XedbsQ4zneWkrcAEYRRDYp4Mq83xT9BfTLbyezJPBK8603bA8zE2//8xsZv+SlLNIv9L91mNQNjt3W1EBtskY1napAa62b+GEXDMhafRzDarbSyzagxJzj62TJppeLVdbVnVR9yOd4RaK79UlhW5G5qphk7wrfUbkRpTYPjPinMusr96FEKoSo0zMNDKBCXIAFv8qQG8KYfTXB8PbVWHPpeYv4x4f15RjCMTMoQNeSYs1AmiRnTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2/vaBVKDLP3qhsLKFZZCIWDxBCr31II82DAJFtU5RI=;
 b=jG2L+PxhwL3p0oq2NMV+ed7/vjpga1qkmsPACcfPdOkQB9TtIrVZbA1Q+2iB1yekxsqOJ5SZMRQ/qY+4RmPpBhYHuKqeTE3Nq2lAeXdqXTAeL6y8WXP8CkemRU0/9GuWDGqeZBsDpBDQ/vhiu2/lfscphQQkVsRLAhJg6ejbaI0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CYYPR11MB8387.namprd11.prod.outlook.com (2603:10b6:930:c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 15:27:18 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 15:27:18 +0000
Date: Tue, 17 Nov 2026 10:27:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Skip OCODE late bind if same
 version is already running
Message-ID: <avxyUc1VLSYm7DbG@intel.com>
References: <20261117125904.2877468-2-sk.anirban@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117125904.2877468-2-sk.anirban@intel.com>
X-ClientProxiedBy: BY3PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:217::10) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CYYPR11MB8387:EE_
X-MS-Office365-Filtering-Correlation-Id: d0463360-0a61-4c30-2d23-08df44bf4416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|261009223027099003|261009221227099003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: DTM4W7SFBEp2jqym28NFPf60lUFw+2FsPg+aGYMj/93TSu0msGiQ8dAroztgc/4BBtaYW2gReM+TqSRpvm/10LLBLWMPoy89/GG5nO9QQL9D/w03usw0WlBqK3BkBZW4e9X9ryLarh4ieDaf5oudkbTkfHwvbmCdYrx98qUp9gXXW4mLUqCxYoFeSUV38/m3B7abDgkjF1LOph19yn7DBI9+FQXBnQaKv5xBBpsaWjHAxvqRTBLpWI2OTQO+1vG7Rqbb8OZxIR+nh75rOfAkL2KJV1L8VmalM6lPS8jH1mNBDmLdFTK61GvXDdVotTTLgc4xzvPLMJ/7WrGv33J8ibprNi4soSnPZgvMkaYflEnJ42+UqvD+xUTDDPai6Qh5KaKPmBk8kjLZkTgV2eryq6QwzTUD0H7dxreHvB3MiEG9EsL6atiZqBvgBo/KxABlwvOQb+GW07qmtz9yArQ0XcapBG6RWHhdqCvsea3AMSEcnFhIcCpGWvqI0s5ILAJP87h66tF5c4ANBIC3o6I9WFpS44Jx/Glwwu2MXnKLAQScTzjTxSJvlbbeXqiTSG2/ZYOz7HO9iHVzPFfoXam7ysPGlmrRbukzmZaUmmawCL8U3/YQ8SwYoq3oTLJOdXXNaHixOZ7bQp1fWu1sKSjaT9SdN9761MqB7pagKZVfOEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(261009223027099003)(261009221227099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jg00gUFzX80lkqaAlmRJ90FyEeYjzqO9IWKNuaW/2jxB67q47TbDxI3gn6YK?=
 =?us-ascii?Q?HGbP/0BGKXrm3r2uNrTzgDG4CLiBdush128UlsNUlbVXaYJ4iycK+2J3WQHh?=
 =?us-ascii?Q?0lg2P42BadHyonH49Sv+7vJkRNtZw1YQRyhR9BAMAPLQsUWwXF6EN4eZhMgJ?=
 =?us-ascii?Q?F73p3USEfqV6UnF2L+RRzJBXlc8HLFwR4PO5vWmwLSn+6JmNOsWa96qO8MjJ?=
 =?us-ascii?Q?QY66WQuEoArIib58EbJxreeI34TjJ+xyHtltIzwAGYJWJfB+FOxi3e5sSjNN?=
 =?us-ascii?Q?HT+lnt+0DLpwosY+ekmLTu7uNaYR8yJGTRiAK8ICqaByOW64X1sJgaVeUHLk?=
 =?us-ascii?Q?dcXNh4UAvkKws4dQSay95vk39cN/rxkobs/Dw8Zo7Krml6qt+yKM5wgFkXcM?=
 =?us-ascii?Q?W+4gcLLIMotrq/k3aUpf81qD054meuZxv15Ly2HVOHTO2k5z5vxYfade9uLh?=
 =?us-ascii?Q?cNQImExBSIRvQMKyX4/ZVnqtX20kNm29O6OYYY4U0sT4fkxtTj3Jm/Utp48Z?=
 =?us-ascii?Q?BFTNkNQ/bMMQoOL/PGk1K/c8RHG4NnXgXwClwqp//04FFYVc0USW8tRBEkct?=
 =?us-ascii?Q?3hQcg0wOSa5f6RnlywPZ1PeEL+WyroPa++rwVyPdsiWMBZXZD+Wt8sB69YQ7?=
 =?us-ascii?Q?wzeBow+kp/0uGeidFLvI8DkpisQ0F3WpWtc459XpWU6HUL9F1K0dmjZG8+BL?=
 =?us-ascii?Q?+nROqHIbg+iUBSNBiReYVs1mzpowuAuvtdIF3ybce3pM8dW6gW5BL3M+NbN8?=
 =?us-ascii?Q?tPXHZbKy+vg2pdkJ8xAZB1ytuo4lvL/oNCx4adLAjYpm9cgIiE5zShTMqovz?=
 =?us-ascii?Q?7yyYxXi9JmQg4ClzbtdLbo1FELzsb3mjbcq26zg3rxPVE0QAE/Wl4tFWUVc2?=
 =?us-ascii?Q?Yqxeb392+8+mo57uxPC7rZbAAyDZAITT6fmVPZub5qg6iURd6AtVqPx8vfNR?=
 =?us-ascii?Q?/X1UxUrWg70qcogt4PH93IOjNwMooh82lxgiVNgy/Hh3K5uQ0uTAYHbX8dl9?=
 =?us-ascii?Q?gueNpFlOhCqY3YWNgLFUheKGllaO+rexVYMV7Z8oq5Be87AcV17tylQRaGQx?=
 =?us-ascii?Q?L+l/iLUNAjGxPkwyCaTlgnNpm9GvkHN9t8Q+fxEQB9wu9+7H+LQPyJtKnt2s?=
 =?us-ascii?Q?QZhPeX5H2O5UEdkj4UPwEbQiAr3WBFIizPtBO3xu0sB9J4o//C4tJzzk7Muk?=
 =?us-ascii?Q?dAfCBNAy9YN4A0OL32vZprqOYtD/7/21PX8KGbz+p8E6idOFIOuVAlgjnioZ?=
 =?us-ascii?Q?hkhIoguUuTUdqglnuqPMAgfDrei/YZN97bpFJPHiIXqpDR8CoE/3TcI8Sp61?=
 =?us-ascii?Q?ftRkdAGbHjWlvycXi7OTX7EqZge6ea1HZjxI6utCXC2p8uifHPwryKsGT05B?=
 =?us-ascii?Q?2bS6LE57v0cxCeILxIyNI7//LIHD5cZLwfrHk3w/LIcAs1g8HNP6XBNMP2tO?=
 =?us-ascii?Q?scXp3B7WuaYDxf+/1cVbeCM3xN/4Vj6dKn46MAVtUn0p0zcWU/BwLBkBppLZ?=
 =?us-ascii?Q?t/bJ0ecuqV/o2cp+H5cxi2RIKCzgNvhuOx9+01uZa4VO0flB5s7k0TqgAiPZ?=
 =?us-ascii?Q?GVFAvOVriSF2DbZK+WgZfjlFCMm4GTK5pziBkC2Xi6AxGuJ9HkRyB7Wcr9gy?=
 =?us-ascii?Q?tzFqTtaWviNjJJEOPUeNUK4J1srgjitiwRtAnyDdGUupQNTHAIl/zs04cZGF?=
 =?us-ascii?Q?O+2TL2p22FG0v+9gd7vFFWvoc5xm2O6k5zoYmxiOA17q8rqFdCPmtSOf+3NU?=
 =?us-ascii?Q?WmSuTe2TKA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Xy7O7Eb2MzcFa6RA8PeIl101a/5873loaq87oTkfLDnAAu2VYskxgKfeiHXVoluQQ9l3GBgyHwHlU4UyK0h8UNKeg1Av67CUiRCl0wrLc1TwvTByJoqvAyUfkpCdZhKpduLSc2RycSN5Xq786Y69Kc0DDYemJf+DaK42blX2MmWBTR5r4PbJIzB5dvo+UsYLugtDDVm3kKV0kGXgdHlfoPGEdBZ+PmxDzJsyAFFCkCbw3G+yS8yTwXlqmojmj3NKgEeQKQOxKiEGuTojd7Q1c1atvFH/LNnvPPNBF24LkJ80Soj4D373ZyySPyreW4N5P7YLI0xYv+jJgZHwNT5QJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0463360-0a61-4c30-2d23-08df44bf4416
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:27:18.4108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fq9e1G0Sx3MJ1i0ujCXYnbpltqsOKN2fxN+gXMqi4BLIo5t6pkw4nQtLm0neOfIU9rX0Haz7MLgbJqMWjBeP9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8387
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 06:29:05PM +0530, Sk Anirban wrote:
> Late binding currently uploads OCODE without checking what is already
> running. Before the upload, check whether OCODE is initialized and
> compare its version with the payload's. Skip the push when they
> match.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_late_bind_fw.c | 31 ++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 355d7c841871..4b8c48871d8c 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -246,6 +246,31 @@ static void wait_for_worker_completion(struct xe_late_bind *late_bind)
>  	}
>  }
>  
> +static bool xe_late_bind_ocode_is_current(struct xe_late_bind_fw *lbfw)
> +{
> +	struct xe_device *xe = late_bind_fw_to_xe(lbfw);
> +	u16 running_ver;
> +	int ret;
> +
> +	if (lbfw->type != INTEL_LB_TYPE_OCODE || !xe->info.has_sysctrl)
> +		return false;
> +
> +	if (!xe_sysctrl_is_oobmsm_fw_ready(xe))
> +		return false;
> +
> +	ret = xe_sysctrl_sdk_api_version(xe, &running_ver);
> +	if (ret) {
> +		drm_dbg(&xe->drm, "Failed to get running OCODE SDK API version: %pe\n",
> +			ERR_PTR(ret));
> +		return false;
> +	}
> +
> +	drm_dbg(&xe->drm, "OCODE SDK API version running %u, payload %u\n",
> +		running_ver, lbfw->sdk_api_version);
> +
> +	return running_ver == lbfw->sdk_api_version;

This is always true: __xe_late_bind_fw_init() already drops blobs with a
different SDK API version. It isn't the oCode version either.

Overall we need this behavior, but it needs some changes. Please:

- Drop the sdk_api_version check (it also saves a mailbox call). Just check
  xe_sysctrl_is_oobmsm_fw_ready().
- Subject: "Skip OCODE late bind if already running".
- Adjust the commit message to match: if oCode is already running, keep it;
  a new blob takes effect at the next device reset.

Thanks,
Rodrigo

> +}
> +
>  static void xe_late_bind_work(struct work_struct *work)
>  {
>  	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
> @@ -258,6 +283,12 @@ static void xe_late_bind_work(struct work_struct *work)
>  
>  	xe_device_assert_mem_access(xe);
>  
> +	if (xe_late_bind_ocode_is_current(lbfw)) {
> +		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
> +			fw_id_to_name[lbfw->id]);
> +		goto out;
> +	}
> +
>  	/* we can queue this before the component is bound */
>  	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>  		if (late_bind->component.ops)
> -- 
> 2.43.0
> 

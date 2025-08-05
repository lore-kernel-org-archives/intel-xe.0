Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FBBC87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 13:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC85010E472;
	Tue,  5 Aug 2025 13:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYQqVM9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E7610E472
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754400527; x=1785936527;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ONofR90FxC7czulMnvYSEoHtB/Qs3ZnHkRmLDN0PGlA=;
 b=JYQqVM9ZBXz+UI6qju6B1Zxf5SgpJCFwCjZfpjvdS1gRFs2+M632+Vro
 kgqWiDlRX5wkgMIKPkTfiedSyOZgOriQbyqOJ7UD2yvwfT8KBJWOHmwA2
 F9fufNtTxj3UF2YDNwTTsp+/6BBsTFR12ed0ZEorKFltTqRyAOKr932hC
 K9Jt7aRiQrV9kNkJ16e1iGj9zVroCmXxekUf0t6Q43B7UeLc86sfRrb0t
 NDEdnXdPUinqc4LwSJOsO3IY5Uk3TKvoh7EIzD3Z/9jpS2CNSDOU0XYGA
 /XcyKOC4OAljHv4iKfDUaEbODOF2c22G+fu48yUb/UqikChTWBrw6CgOj A==;
X-CSE-ConnectionGUID: haTvCOLKQwKNnbLH2n7ctw==
X-CSE-MsgGUID: eZpd/PwBS/K50kNJFUJ3cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="67768456"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="67768456"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 06:28:46 -0700
X-CSE-ConnectionGUID: 8BwNbCadT9qgJ13Nw+B7Pg==
X-CSE-MsgGUID: 9oGWFyisTKyszufu5cYkjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164913362"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 06:28:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 06:28:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 06:28:44 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 06:28:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4yI/zUr6qTuN02WzBzekrGZetuRLHikG5sd/TSR99A1KvZHFXLCRN1BuHLoFI0sb8tnLI3W39tGVUfjrdhWihZOrL4hTSRpLivhPIScelqvCVel1YTnbw9nCDX+dJOvrayjuA9AngaEkrKiEUZ3vSBgk65hCLEmnJb5Xz29517sMsNrxV57khGe6VsKr1Ry0enJ6aoOoebdYzvmg4RLsdK/0yLOlIxglvolkHJseJIAm+xcsS5vtbWo6C5eYQPaL8wiMxxo+ICjMpHMNdDY3F4f7f71W6oWBj4wWd/bE71KYLGpN5IPicordIokYbTi2vLHvf/3ega/gd+Etci8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHCyb/apWTbfsV9CVOw9/fWfUHKfAi2mvYunFtSsIvQ=;
 b=uEDhT2XnW+nCM+7Xq1CqYc83MWa0FaPF57Ro+a7kRcSQ/q5QImeKJPsz6FNr1V0XCYLtlzsJx9BmIB0Um2J1HlavSV2HgOb42ojzCuc0w/sjaK5sIcNKggde3EujQcL96D88r62Sy7CHoB8iKNYz/p4wM+4Yc5yWQtVmlbEpZw/Mi1QsNEgqChOm6uyrBse0THIgT8OUm7XIFxPAMxm7xpKFJDN8EJlS446y30im0xvvunkcf0k5wQyTlYVemQFMObyYMjaZHrzktqzlMc+0S37jkS6kEFP9bxfdgghjQTEPGZE6XSR2GLnGfkcfSCk9Q1K9UlYqzRPpqRb3JtYdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 13:28:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 13:28:28 +0000
Date: Tue, 5 Aug 2025 10:28:23 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH v6 08/11] drm/xe/configfs: Keep default device config
 settings together
Message-ID: <pk56daxs2snzdqbnaaq3cqysy5rhpeioc5xd2h4cgxbdbrmh46@q6iqxhuifmgw>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
 <20250731193339.179829-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250731193339.179829-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4775:EE_
X-MS-Office365-Filtering-Correlation-Id: c32cf09f-84ad-433b-1562-08ddd423f68f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JEOYWt5W2Pi5lXF+Xp7JY9njFtJuHEiPj56h9nluXSWA53irHHbGiBPxYpAW?=
 =?us-ascii?Q?leL7r8XvPNiODheOpDOeL5aG0PzLWwXQI9jk6qIVSUOiHjBZX2AwQT/KVvRw?=
 =?us-ascii?Q?BN2qc4NsdIW+7hAKeUOln1eLFa/ZPku7+3rfJmRGVdM6fGAQ7NLBhqs/XtoA?=
 =?us-ascii?Q?xgQSmts9kbcS4gTQrJf0M/L8RaSWACCvGysYyLvnlrqNsShtPnOclrjtOn4v?=
 =?us-ascii?Q?kUSPB8yejdKNX2u6IrChLkHSTifGPlEoVvhrGVne2je7iyqJ0kPiTUY6O1YF?=
 =?us-ascii?Q?BRFnZNg9Wv6d9qqOgaILsFKpRV9kmRAPI0sIEvCT3N4xeiY57Eq+XHigBL3o?=
 =?us-ascii?Q?NR6NG0Ej/mKuUPOS5Ldx4ejzxXzp4y57pCEp3Lyb+3Xt525bwTYpm/BBQGqF?=
 =?us-ascii?Q?gEBalruap5b8qr/ZfVoTWWDU6D1sFJxI8BLzNHxfQHRkwWg4r1oHWHPPVLh1?=
 =?us-ascii?Q?HzW4lRyVWO6U7o9zseyBUbp21CsmV/BTbGiomVGdTqjVTbXJ83N93bS3/yWa?=
 =?us-ascii?Q?6SaUPHoRgiZRnblzQGXfpMlKjBjlvGKSfVEYUdBS0fYvdJAQ0V5MeTt1Yoqy?=
 =?us-ascii?Q?S1ZIhhpoNHrk7hiiNpnibJvCQl2Vbp01/WPmZoYHdsLfWKiXo6tEF3hjufgd?=
 =?us-ascii?Q?5iQVPGNgs8ez5iUREYRP9zw0ufwzUcz173Al43j/URo8pnodclNK1rsme9BX?=
 =?us-ascii?Q?LEGcKgbR9KpfLbZT9WEdkzU4DCOLaLH3ibYDgj8xbsBhn2bnfWRF9+GPMKDS?=
 =?us-ascii?Q?KQeEWRmZMTU8JNq+sTFg4GU4DHi0QCdzO64hbUFLKWap1DqS95Z0dha8Lg8G?=
 =?us-ascii?Q?Z0ELSJjfeCs/7CRAqORtlh0N8QXPNIElljDOn1I0cBbh1UeCvEenLzhthAhA?=
 =?us-ascii?Q?KeH1vuBcQ6a96VOW6bqptENwXhMv+kIm9vA89pJ8ehaaHp4nqHh2G/jSN7Y4?=
 =?us-ascii?Q?GqMqWbcZgbQAophTJTtWoBWLWd2JKeRDTqf19aNbTciXAFB+kiJYPWjrNq5S?=
 =?us-ascii?Q?0IOIKnliREaz+dVSB+qLQ42+9V7BdjsgKcBPgBPkxrfy/5Oy6Nf9X3FGKdOP?=
 =?us-ascii?Q?a0xKtMEnU5+2gbq0oN301+dNYyioobcg6opCOMD2+btQz72rg+Ly76D9bm4E?=
 =?us-ascii?Q?Ly9pMrMPF+MYG+/Xkre40S6TAgiSRpxKJe7+OiClPzJkaFE8OC6Q4cWs1/Q0?=
 =?us-ascii?Q?xCbDic1mILhporQBHSIEfYM//rfjQpKLIavtF17Ol46LFTZ1r/FEkwkSKSZ4?=
 =?us-ascii?Q?RN9b6uhVm5OV+qC8yc/JrgyJhudklrn198PELOJMTd3Y6MZwq3D9YymGNSri?=
 =?us-ascii?Q?3ig+2ZMJp/dBGNUmVUsjKcPyYUHc+rS3wrHRFsfeJZXMToNuu1mKTG2gL8VM?=
 =?us-ascii?Q?efuTCeQOGGdd6XO+ctlXRa5VK256laMeXS3CCQNr3dxaKNoXZ4CdujAfjcY4?=
 =?us-ascii?Q?5rma1tynzP8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HaHBLbnEwMP4LvRCUBGfCPRvqi9CQaNeBTbVYwCu7hQYMH7XKTWR3o4XgtCA?=
 =?us-ascii?Q?aacXInSdLTBon1okWDWJLyPTjkWtMMIKaF1XPHluNOcWGkG/j5Bwrw5KYUe5?=
 =?us-ascii?Q?Xdt2CfeET4J6dNzl6JWqWGOJ7IyoHTBEm0U3JZUfP5XQ2Rl0XozhNJq/S0z0?=
 =?us-ascii?Q?gW7diYfGel/ap7zALnXeqMbJ/tAd4znONuFaXY5Fud0mJ7uXR29Fv4h8ohgm?=
 =?us-ascii?Q?ZX0CUXw+wwg+/gDcCBk2VHdUu9Bna7zmRF49CKROqFztrU+cSxiMsS7VgKWB?=
 =?us-ascii?Q?Wb92z4O1ASvEZl2j3GvceQadA4u/kDI5LhiS3XogPoVxoW1aSEboINK+KlVa?=
 =?us-ascii?Q?3zNGxhrVtGhMJMcJbh40fzGWKm4GsErNycEBzOAO7CdomIb1+Ztjay99StL1?=
 =?us-ascii?Q?kCxkw54iTjagurgd85Qx9WnXAsKuOK9QVLyhHRA91ZeaMvfQ/IlkVt943zGF?=
 =?us-ascii?Q?OnSw0tIUQchCJZ+bqLwOr1q0dQ/VnFqTj897+HH2E1ugCIuwxpsDXyiJEITk?=
 =?us-ascii?Q?OsvBAuWdJ3LYZeC9+zspLt0kwWxkuPT9Eio1a8ocSJFfCrGbHmbpCG6GzuTa?=
 =?us-ascii?Q?KI19paPT5934u/v4cwS55KeCeikcgaaxZDP3O05nYr2CWJBaCTZ+DX6Sh5Ed?=
 =?us-ascii?Q?0/0f8uHMY/Lw7ldVTxzvDFAo8rTAzK9PBj4LC/i7Wctmrtvl0R3zhrUqY4SE?=
 =?us-ascii?Q?ajT1nUf0x5BvPPTDjLQxios6EFs2bFvL6g8iI39olVD7765l55xmI3KILEPv?=
 =?us-ascii?Q?K2/8wbw5XTZcgDVtPkFYPI+Vh8/NaFY5IOuJN/E8UbhxzwC9uBipviNYMyrZ?=
 =?us-ascii?Q?9zl+jBHNzmd5F+D1nnTmJMMVsu/7U+fLAxi3UoSdlxu9tTaGnyGJs4UpOxNQ?=
 =?us-ascii?Q?YWEPnZyQtDhCukxxEEAFxw+7UvPFe8s7e36UPc0NP/ftvSnctpWQOiQ+bmJU?=
 =?us-ascii?Q?fHbPyJS4/QI7FXCiDJoT8d4EOFuH6pkt7RRkBjIqdpY4c0SleYjYk0dPKGLG?=
 =?us-ascii?Q?RkiwQY11vcDWro4Iz2zULCCzi+7XTY6ykCOtD4uh9IV867bh3qQywmAt1D0B?=
 =?us-ascii?Q?UjnPyFCSh1mLV5whLDSIeO3LMZTzyR67/Lj1TkeTEwQ3kkzUaeTX4nGT2YEe?=
 =?us-ascii?Q?fuySMNR2mIqSTgjRrn5ygpk1DgQ+c+G4zCmw87zvOinTIjatEdrzuIDi3ix2?=
 =?us-ascii?Q?9HlW2JyjLgUB6VGSvcdt1Q95+AoCiUghl1X6TJz21ORG3z5RYvoqXe01a+Pc?=
 =?us-ascii?Q?BKoMnpAPGYvIfCtZSqr8DywpIc+4mrE4CBza+UDONgxalAdDznvnbKtkPnDz?=
 =?us-ascii?Q?TyB3O1B6fD6BVJ+FMYOCEZ0QXjFUYsALYZwhyGpe4ktJFZ8S9KGxdXkQmYC8?=
 =?us-ascii?Q?83cLMfWqnIQgen537VndxP+WSdpqjxrtuuGOW8jFdJJahM8RnNmkhBzcyFot?=
 =?us-ascii?Q?SYA07c4H3RjtquVqgCJ+5waa8I8JWpvWLi94+q571RFAzuf+tWI7OR2UU6b/?=
 =?us-ascii?Q?0UdAvpz0mFyAVULk9Ev5QaWji+TLJ+L1CzLfxHJY2qnrdIAL/8ojs30IrjhL?=
 =?us-ascii?Q?SogHUtju1exp4gwH9NsosvyN+w9kPNbDJB6kzy/b4RmUZ0g+/SElKMZj4pFM?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c32cf09f-84ad-433b-1562-08ddd423f68f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 13:28:28.4899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehbLmRWDKlCG8AaWQRtb5gCdQgkv5CuBBMWyMsJJbi6uXNoeb3Z64ZjYd2HYOgVTJypWKRMipmHk1uANPFcpH9/Mq6pVw7HgBUbjZBGqoFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
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

On Thu, Jul 31, 2025 at 09:33:36PM +0200, Michal Wajdeczko wrote:
>For easier maintenance add a placeholder where we can keep all
>default device configuration settings in one place.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++----
> 1 file changed, 13 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 7ad9fc65e21d..150e7f2becc8 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -97,6 +97,16 @@ struct xe_config_group_device {
> 	struct mutex lock;
> };
>
>+static struct xe_config_device device_defaults = {

any reason why this would not be const?

Lucas De Marchi

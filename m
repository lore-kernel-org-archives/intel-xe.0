Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A0EEDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFE310E8DC;
	Tue, 10 Sep 2024 18:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VA8LAmjj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1110E8DC
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725992135; x=1757528135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WQAKBTqJEn7zByNCIyfzUALEzbpTVlk9clqDQ0oqusE=;
 b=VA8LAmjjXb9uJ2k1lE9rDP6MELt/knaJnAdd/DDr1XcyuU9wCmQz33L9
 dLtTJHbPFEK/8cymQul017smvP8lLtUaPEGZ6RRGIL7l3S9LRaYEkMyhd
 05aSmtpmerDcDSWYkr1kLgJUn02rlu74R7s1dfqb5vd79ySoIa9SuhfTu
 N6TcJZhM6KQoctnA9i3vhmBbY3NrxOBoRGd2Mlj+y8Bgz/U642cr31Vmf
 gXHf0dF75bVCwtH8LTaR3aVuHFUo3+DVIrS9Ner/21vMBo9TVNUn5Xe3e
 OI/w6Bd+589FhxRI3FlgENTsvxvCVqCvNgHmhvyJGVAuQ5gBtlpuOmEj9 Q==;
X-CSE-ConnectionGUID: hrn7hxPARbKSggQHWTKfPA==
X-CSE-MsgGUID: YCUTXM58RDCDiMwW06gSqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28540098"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="28540098"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:15:34 -0700
X-CSE-ConnectionGUID: ALh+WYAoRPSqCIwNLLX/fg==
X-CSE-MsgGUID: XwO6x6G4TgS7CKHXaMIZLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="97945126"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:15:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:15:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:15:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:15:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pW+21HhArSaqtu7UrSA3VQJiY72rxE9JhfRZpWGLmAGRcTH/1vg4cCAiDMX2iFB5iq4ZoX0pIITCw4AramvLyoDi9TKW+6+g+7HZrurfn5HyavxG1OHMJHBW25HcJN4r9yZbw8QFQsciO6lt4hAbRWLukY/B1jc91lZ1yFlhhUS0ntpKaUwLI7Ono9Bqv89CQ5lBea+FMh7zLtMRLAwl61kIsW9J3VurKoXTekquZmmNG2QAyqwCteStMW+HXW+NXf4iNc9hEGzHDeITuhtyncr49CJbRuO3bhvilLI6gt7yX3jnqumrLKxIAMBYPEJ7M395vFEYYOd/xCKYELFgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdDvL5fxpTkxr85lgECnAmJ3KCU+ufVgS09HKI2WqvI=;
 b=K9jOBWz1c8faoAXgmqSRihUGFI+ESqINTkwJjHOYFvfBqFWqaGpFplng5GTWjWroK06mYE8iRZFh51U5LaCoeX/SggFbb8xtElFwqUYvOTp6ve2uQljNdK6y4DlbH6kHYaHc34fayJn0iULci/Ov2GkF+nvPg+s5ZDrH89no0elifaA4xptA8RAD9QyOQFrNhCNI41D4IfdTghp1Um+AwfR30G5zNO79hmodKBUsN6+/bcdpk2jksoINYA+vrCtvUrGauTlnNkk0gyNcfILIfc0QHg7MLJsoGAEK2zxTDLmIScu+YIkf+hdNcPeRqfOh393fsWJcxxZ+xM0BYFv7WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB7279.namprd11.prod.outlook.com (2603:10b6:8:109::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 18:15:25 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:15:25 +0000
Date: Tue, 10 Sep 2024 14:15:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 35/43] drm/xe/reg_sr: Convert register access to use
 xe_mmio
Message-ID: <ZuCMugwYfc947FX1@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-80-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-80-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:303:b6::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4d76c1-db8e-49bf-811a-08dcd1c48a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cELA2GBn51PxXlPHtu/W7GO6k/ybYxTPLcd9ioH6JjxFCPVC3R2TTfpk0ujg?=
 =?us-ascii?Q?236cDE6u/owUvzqnchjmEG2VpQxGBbC67ZTve0tWolFe1XElHVn16yUKPkRW?=
 =?us-ascii?Q?hHttHgn43aLg1y+1GQYwuzmx/TALo4iMDQ4DDmauo1xEzuIOAn1BmydBT7mt?=
 =?us-ascii?Q?ICS43VJXQsAI39kQp1isrVonNUbA+D/3D2qBMIOwzURCPBFDZL939pJi69T6?=
 =?us-ascii?Q?KEVPkq303Ve+dfKNf+kCD1SGpm75QhKwx7IRMIXzsToFvr67bRYj206AG9Va?=
 =?us-ascii?Q?HugfVLsHzAGjOx5sJvUmVhmOhygl4KA/WxamSjBv7uc0owu2WVGFwF6qHXHB?=
 =?us-ascii?Q?aHeaSoxoYLbAwhotV7E5TH71b8Ggh0tsIMnj9eZwqM3yd54ublzWJKvbxtJR?=
 =?us-ascii?Q?QTeUdmF8WwUmXAaxhh+08kv/EVHry70y1Av3aZfDK5JWBetAXkY+l3C/Y1xV?=
 =?us-ascii?Q?cMqld9Din69HRFspXb5HhNpRHA8nITR3uHo+t+z/KYVCBB5Z2t9k9UkSdIsd?=
 =?us-ascii?Q?L8dKuqZCmbeTDsidZSY6K06oyo8EMBduifcYBFjGB4A8J5ySxcrdAg0I9t+e?=
 =?us-ascii?Q?mu0+4P22ZI599ZsEBmMFul0dws7AeLPx5TxIkubsw62Bepy2qMdos9JJe+tQ?=
 =?us-ascii?Q?pDbOxF4ACgpy1g1mJkxVPl/TJEM6iydEAu5t/MP1rLyL7aAagXxg5qktKslf?=
 =?us-ascii?Q?SUCeG5n7boPfDbHxcpZOoJsLJeFH4SHhrXbdNX7UmKwDlDpzYQnEWkxJkiYf?=
 =?us-ascii?Q?QAAmbwGmQAFY5cy0QluIJ7aQhAm/nZNQB4YxJZk5rhrtkp8cfSMfw7a8KRsW?=
 =?us-ascii?Q?dUqjyTP62qsn+MEGKYhE5LjddNc2VVtzSijrKXNO8Haxj6CXzKrwAaOCda3m?=
 =?us-ascii?Q?iVdbxX/vPPS3C7u+IzmV1bh5yfxs3KF1gAlGtbXsvd93duaIxWf4v+OuqJgM?=
 =?us-ascii?Q?+Eh0e10U8+BzDsFdXTysM5onVIdyycXy3z4MqwKcvysiTr5i0E+djcGHZVVu?=
 =?us-ascii?Q?PuHf0V/O2hjif7t5ZCXesgQ6MLSDrwoOosMOMr1KTD92Nd6ce7vQqIVTynYY?=
 =?us-ascii?Q?D3UwAQfkRJwqVZyma0RXt1r/LC9Frbj2oG/95T4qig70xpbQZpzalKBgZpLN?=
 =?us-ascii?Q?XQcHWr0lB0bIhe2SpBtvvZw0BXtEORpn68CVc0ccAF83hIPxQ+d1a/suP2C5?=
 =?us-ascii?Q?i2ku4vCFcbabhBOMwUZ3LzQRrV3B1C1tI+bfPYl8h/h709XgFiMVfD699Td7?=
 =?us-ascii?Q?o4DO519EthfvHZjuQCiXKGkT1F3jkIhhYXg0sWWKgKEITLK4IxYow9Y6CINC?=
 =?us-ascii?Q?Ep+kiMOzPacQfJTsQ6kGWykTzSZDKeWGsMY0adS98pMY4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G6AgV/IiGwJFy44zeSzue5kGyzc5DgrTkWBr07hQ4QDRH/MX22Y0xTYTKdSw?=
 =?us-ascii?Q?8mgAUw2M2/I8wXtais+GPFA82UGjKZxdlUCfWl6F5inCjk24NSmCs1YRqz8m?=
 =?us-ascii?Q?CKnO9+A/wW2J3dP2EyHyjU1uQXlNuuaex1tpk5Ib2IKTUZUbI3ppVX0ICwai?=
 =?us-ascii?Q?LmL37tFmAkEF6oulR8k192XkEI628ewTrKV+MojUxuu7IVu4Na7u5mdwTULx?=
 =?us-ascii?Q?fHxboboSVJ+wjBvGHuu6WjGhFlq46aePHb5czzABes1FToIl6DiobWJUJkCV?=
 =?us-ascii?Q?cOJCSCHAhvr3859VV5zO9SDS8DVMtdGysuP9d6zUa4ob2EF/8XCZvk05GN6o?=
 =?us-ascii?Q?mrUGjv9ygC+ptcN6KWgYSq6AAB+l47pZ3lHs0ogsaxGEXXxMWqqM4o3pb2iN?=
 =?us-ascii?Q?IMzSCe/JHmIMthOA/CHR5aGrd5CN03BmgMGIDfy33Mr+UJCnXVc0qY9LqVaW?=
 =?us-ascii?Q?TI20jWO650tImoq/Y2xf6qEhVCMlEDl5dNXvKrYLtlaEcYDnHmZt4z9erChz?=
 =?us-ascii?Q?FOkitcvNOsAceTQEAg2E5TVVFoS+PPuJK/tZtTeG9vq3Y3LBxENoY27J5y02?=
 =?us-ascii?Q?26XKWrSLUrfqg8IkDwzgHcBoiSFqBWWawIlGfQHb1m0JbKEBFxeAwd6mqpyB?=
 =?us-ascii?Q?aX8Mu8VEK/wwBwMZdf37J/je4S5550CR/z5wQY/jAf+PEGyKn+42CpzzpyXc?=
 =?us-ascii?Q?YOIEPyzrbaotMXkkf4+3uHjWecvDZ+AtQZLswTb/eCqAQuJktgIhPjpRIUqZ?=
 =?us-ascii?Q?aIJdXKEMD19Y+W00M0z4yKzxjT8tUVfxtGC8ctBYJUUsmq9JDkNOkmHSbXyX?=
 =?us-ascii?Q?e0kaJFxE4RYFlaZc/KIjOMKWnWML3q+PkNLxyiauybGKUfsIpj35tJ8t50DX?=
 =?us-ascii?Q?W4j525HPfLJmV2IoOzqH2OAiujkYXnRqcolgbcNbFba8ECXT3K3yeDHIpCeY?=
 =?us-ascii?Q?UErnF08OR7RQmx1E9VOvWOxlPG86vKimJJp7TSAYawV8l+V6b3x8fEaQMgfe?=
 =?us-ascii?Q?WZJeeA0QrA4TXQP56Xhugsr7Jq5EALPle5xv2Fc54HstoVAgaUChz8bOewND?=
 =?us-ascii?Q?jy41jlD7crj6wEm4TdHuDF8IHYbcfRPeAf6Ydt7a9DKb8jDHdbEjgJgtAQET?=
 =?us-ascii?Q?00pLOnfxn4LxNiHFHcs0PcQd85mi36i+i0m/U+Hcx1P87YtsfsjChOfC766w?=
 =?us-ascii?Q?m7zTQUnEKLKLtTXOTIAMJmrHvKjzmw0aPx+m/sQKmLu/hYMZ/9qp3ZRGqVWC?=
 =?us-ascii?Q?ntqGveYPWtEjPUiaXdSkpJTw4VGLPaVc+3IuOndmmh6sQdPNIBBc2TLyE3ZQ?=
 =?us-ascii?Q?AhnZ5V/7526NgP2KUIGsPTX3MlUABJj32OItf+EDExTXwbgSbTTQz08QvPoA?=
 =?us-ascii?Q?7eVG/g7iCEoAMGsBhXJ1vfHixP+X6KCOCZ4z8+MOHqB5fMU0GkYltHbn7fZ/?=
 =?us-ascii?Q?hvmUmMdD3VSsl8iSER/5XV9/8T7VvDDigtWIOe3mbR6aMF99AQ5QEUFl37Ba?=
 =?us-ascii?Q?CNo4ycspRSna39tzv/K78NDYDyGjMRTwKZq0foeb3U3ZiU/GzKMwBMfEiJQs?=
 =?us-ascii?Q?wnD8+5zl7dbqvEoHipOOZTcfmQ0pWPXljgkr8+Gi8nq8Vy5H0Xm/oIMxZ3p3?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4d76c1-db8e-49bf-811a-08dcd1c48a9f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:15:25.4242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4E9WW+loToB2S9a0i/BfwsbYgmhUsKXtX5gcNtwkByj/t1DJrsaglJYMYI2HS5BGNVZzjc6OFwgnK6LAnYe9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7279
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

On Fri, Sep 06, 2024 at 05:08:24PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index fb209f1e0f1e..191cb4121acd 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -165,7 +165,7 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>  	else if (entry->clr_bits + 1)
>  		val = (reg.mcr ?
>  		       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
> -		       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);
> +		       xe_mmio_read32(&gt->mmio, reg)) & (~entry->clr_bits);
>  	else
>  		val = 0;
>  
> @@ -181,7 +181,7 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>  	if (entry->reg.mcr)
>  		xe_gt_mcr_multicast_write(gt, reg_mcr, val);
>  	else
> -		xe_mmio_write32(gt, reg, val);
> +		xe_mmio_write32(&gt->mmio, reg, val);
>  }
>  
>  void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
> @@ -242,7 +242,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  		}
>  
>  		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
> -		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot),
> +		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot),
>  				reg | entry->set_bits);
>  		slot++;
>  	}
> @@ -251,7 +251,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
>  		u32 addr = RING_NOPID(mmio_base).addr;
>  
> -		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
> +		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>  	}
>  
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -- 
> 2.45.2
> 

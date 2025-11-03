Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C93CCFA06
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 15:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1736710E420;
	Mon,  3 Nov 2025 15:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUz3Aly/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC38E10E41E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762183032; x=1793719032;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eS1v2bVq4jzcAgwnmBUAu3eHxwmUXSyCkFpor5pFfMw=;
 b=PUz3Aly/2T1pae3+UgCirNgv6AnzCv6t0/JjAE47/lzyL9W68XEVb0sn
 NEsZPFIZwvUgF5PC2J/cJephZw0VcJabIUWG0uMZ7dTffwLs2+DCkIGeW
 ohxtIAAN1IPHEKUrNNx7BFiPkxaUEVSRLv2UXcBE5EdnmR0xzaAVYBzZQ
 estvK3yJy2se79ZjJEjg9p43mjaeKSWG8FXSQrQ0V1bWnkvgJOdmH4xvb
 1bN9HafMnZenj6XzbmMZSqMDime0CLY7X9qEadt6iSi6At+68gtdi6nll
 Ks2UcYFkCcfrYWYYi0A7OqAYvqiEwhXcSRGW77AvkOOSHwDZG5mFZPUcf A==;
X-CSE-ConnectionGUID: Qr9aBJZtRaOfbHruHH6CNQ==
X-CSE-MsgGUID: zHbsPl2hR/G72oGNo7+amg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63956523"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="63956523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:17:11 -0800
X-CSE-ConnectionGUID: EU+4DU+BQ0qu3eJTOU3URw==
X-CSE-MsgGUID: zpgA+6SOR9ijNzAZbI1u7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="186758917"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:17:11 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 07:17:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 07:17:11 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 07:17:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1A8gU4qRjV+lW9Jl8y+Ju+vzK4nfx/uGmffy57Url3Muxzuo3IX8JDGrPYIHZi/X9N65mr02AzbuL1oa+YrlKyygs2S1hg0QKJ9qy2TnOwqGV57CDd/sm3gcJvRaJjOypGeBA99UVNoX/kAE5vynG3RhsNrNDQMNQQuLgQqM3wkLjGBMn3vCCZtEUdh6qdQYD2gUKNbKszJjGIhLOly8jljjJ5ks8qP5ZxJQ+ZdsQKNlL1P3QFXGDDgdY//BtpAJr58ACYL0MhzISnPCGpv498UdT9WHnamWG7CjF80PM23C32SnicrOhOwtEiA3q487cWxq85JRMn97NGHm551OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eS1v2bVq4jzcAgwnmBUAu3eHxwmUXSyCkFpor5pFfMw=;
 b=X7W/3cNZMwnWhbZFHcKa3wGamRca2jvf9Nri5IL2rhD4dA72KXeFPqOhQP1LN7M7nfquW6QCV6iLz1W4IVyrDNMzS2tLGUZDN6V1SWuZAPzTswkvZLpQUP2bsvUSavvuWm8fh/Nh2R+OoYvO++P6OLbOLDXykLv4HbAUKU1FnpK3PkVQHh1Irh954qu/GZYHFECDv2X/10Y5iS0VJyBXzWiyvdqQUK1mbS6530E7pVxS7xsKyHaLC1akSWX3a29NOX9PUywHxPfzGrufeblucoDaWEd737pcYIcN5Wvx9bankeEsP3JfYxu40BQPtXW2WGjXkOqvx7CDAshvpDda2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB8168.namprd11.prod.outlook.com (2603:10b6:610:186::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:17:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 15:17:09 +0000
Date: Mon, 3 Nov 2025 09:17:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [CI] drm/xe: Inline gt_reset in the worker
Message-ID: <apse4bcfwffy6rddzomtfbw76rtgsy6o5hy6373ygvu7tamjkb@nndlf2drfbdr>
References: <20251031222244.37735-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251031222244.37735-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a79485-e7f2-4002-0b66-08de1aec0e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VUmvr21/kRKDC+niKoBQ7zlD+uSIqu12Rx0KFdivdn2G+VvAIcfwdWLL/9t6?=
 =?us-ascii?Q?Lxy6+hNZo9Jyk1/kq+Y+lBBfeq5B7+XbtFRU+NWdLnEp8D4umwKVI4NXJIth?=
 =?us-ascii?Q?EqxmDXWiP/JSueFcokRC8BxlazFE7x3nnqb+bJLK8zuoUCUtbwDmITh4nxkx?=
 =?us-ascii?Q?u8bjg2b3FEoAVJtgAqVJw+OiQcOr8CANpB7IGEW8JhnbH3B6RHbSDxPWxFG0?=
 =?us-ascii?Q?NVa9+F0827rX/Ne3ZOwtcXIkeSNnmkmFDFa+CqqzzSO52bjJH81xaWm5YfsA?=
 =?us-ascii?Q?B+sjkoWAkeRulKc4u8zhpWjh0MEW/pvDSJD5+9VLz0zmlhgbq4kcI9Qgdwrd?=
 =?us-ascii?Q?ll0BZTVjVmaWtdTrX6yrfoNkWpIauEsxpYa7OQG7B9Za/T1X3GvBP5nRTufz?=
 =?us-ascii?Q?AB5TxnAFcDVxpOpJNH8mGg8cXl00eMZ+9NLCeXPOp7Y2zilPUAsM0dsMQDBZ?=
 =?us-ascii?Q?LvDSfyI6Tlj/Bifk5hmIHBudZRX09AiObNTiAkdoZ5m0W8Qv9Cn4Jx8Qevb5?=
 =?us-ascii?Q?q+bgpf3arA3ghwXzhLETiHrwGblLxinBQ5dXBAfx923IdLMPlfeEV8SBFeOZ?=
 =?us-ascii?Q?rDS9MiJZbiYW2scNkePfjNLty+Ul9+CLSjmhDbCYlzWKyWcn1+M/d11y3FcA?=
 =?us-ascii?Q?MaIAiDFEjM/V5QOpxKjabP9izRL1VCLUhm0/+fu2Hv/ixFrIQjnlu/loI4BY?=
 =?us-ascii?Q?/Lz97MOc56dv4X8x01P91S3S38DYQg+82KtDg/LsuhgTmgoSiFQ3uuJLRXlz?=
 =?us-ascii?Q?wxV4Jy6T1crK0Xxq0uE+Yj1VMpyjtklaOxkX6Y7GuHne9UHS20MY/eBL/tqx?=
 =?us-ascii?Q?kc9sz5r72OAHcNtxhZO8yPxSpXc5xYlNzs+u2UUkOhGV/pcTpMN4meWDkrMf?=
 =?us-ascii?Q?/M1jJATRk7NUAtbzqCVocyNAxf/attpMargVEnFnqQksoGZDrlOJJQbsfQv7?=
 =?us-ascii?Q?bi+5DU8JxIVdiLThxoKImVdLpz8pGHRuU/NQiPKD4zTaoxc+SvqF90Z8P39O?=
 =?us-ascii?Q?4NAc39IFM4nc2z4Fm1S6WfAJaWQ5a4POAa0e9uwdnKn1VE0Ay75V5ES1RpH1?=
 =?us-ascii?Q?OXy4V3WXqbfT4kWlbKJfDdDwQqSlLCVRXE+H8MbY/CVPq4dVxHvKsNrCzfGR?=
 =?us-ascii?Q?ZxBI3SIppS6ii70ZRl8VsZ/OyIj4EajSvc6Je0sSijYu9AODtXMNCzEz1u2a?=
 =?us-ascii?Q?FJj8kmgtnFAgMFg8m/IstyLR/CiwhLYHXC5PLbvwM0VdH9aKvedkEZLf6Uyj?=
 =?us-ascii?Q?+3s52rbodqSeFYWQEVXz/f4u7ldZWtQ2VMplINnORslJie1HLS3n6HwU7drU?=
 =?us-ascii?Q?k+hofBCYmjqhdLTtSS9gKt86898t8DSYdQTTrP5nDrvVR7Wuv6ZQdpjwXAhI?=
 =?us-ascii?Q?TPdUb6TF/KAYWAM0sf0s9JvIiM+jIwIUp7At5I9SEKyYvMSFHapLFHwDDD1r?=
 =?us-ascii?Q?OzO7IaciirNqEu2ECVPyBIHGjR1VN3HX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zKhHOAiNdPftp6lVTu7C1/P+NHzCRXKc0WMMdfx+/rW+obaKEoivTd25OJ3i?=
 =?us-ascii?Q?RxYR57cz1kjPbXhwFpMt9zsx451NZE5tqYDwglB3eJoWKNvGjYRGOiPBh/Rf?=
 =?us-ascii?Q?4olRarDSPhR6g+2S9sCWKZJkP1NAC8qSibSp0oNAkpO4rDcr3tCX1lk4dFFo?=
 =?us-ascii?Q?zqCEItiGr246NVkpn/r4+LbUbM52/sAzHoCoI4Jlz0lR9Ou1zdjAgz1goXn2?=
 =?us-ascii?Q?fhJtO8ADk3N7EMn+kw/Z+P2ydtPzqvXjKkbk2jov0NVTqVCwOOHuNMW+N2Bf?=
 =?us-ascii?Q?HddRp6D6dU3lc3+yTJPwfFtIDW9WeF5O5uPm1OxLv6lSQ176YR9C08uD5cX3?=
 =?us-ascii?Q?4QgCaFpU+JgfFoBCeBgAXgh6WaMB2OK2Spv0qL0XuxEhPBjFQhpfxgZ6Gt47?=
 =?us-ascii?Q?Hw67fML5mffjfSpq8Z8hmRSO5XAhe3wIkt90ttWzAq7Of30qUxjmli3LFRab?=
 =?us-ascii?Q?REbM3dbHytOd8WZVOny0Z0cyI4Q9vhxWxG2VV+WhbyDFEcOZnMtbEFM+3b9+?=
 =?us-ascii?Q?UmWdmzED6R5iAT7LLZfBII4RQcVNMnNmYoUojrRdZBx6LOsQN7h2gRQQ3V+y?=
 =?us-ascii?Q?+Ka0NoA+E0ckZixzrEbSp7WXoDWAFs8VD8ITCsVbEb5eYHNJAkk6MfMov2pW?=
 =?us-ascii?Q?awrrpl5Jh1JbNblIgMP4cfpAnwfbMbFlVmwum77ZBVM+exQq2z3sClEL3b/w?=
 =?us-ascii?Q?CxMbphYS3hOuqJaFxJNFu8P6Hm9WkDJCaTAYXCtIqxzSH03ObTEdZCCBYIzj?=
 =?us-ascii?Q?arQdqKSaXFe7aEWCyK8MBbAHKaDjTbFzHrn91e81kWEBqlsy04tprWxpHsDw?=
 =?us-ascii?Q?MdaP4GNKWm6XO+v4dRzkvizX6/SCsCmNVJduERRtPy7mwwp7PvP9sxBCpTmV?=
 =?us-ascii?Q?b5Ita8u43Gaai30DW4I2x5N+o7VoKcNKs0j16/9/7/0QuPQ8RO7z82DKsf/v?=
 =?us-ascii?Q?a2RS6Pd3r3qVN1HBvkn5m2sCLmnlnl88G/kfKTky74NYQI2CC6hW/21dT1hM?=
 =?us-ascii?Q?YmGbyBTxPzsVAKMELX+4wjl1wkm6x9VdjU2pNYMPDDAkbA3srWtK3vxDuC01?=
 =?us-ascii?Q?GkEawcpvwH/Lsl8NqyUvvDHa/d15uAgoFo7TNNExU6YOb8ne8kXmBXpdXB1b?=
 =?us-ascii?Q?o9JeHIxZyoxTgrIFFXaWrYMDAzobW0IYoL8yj/X8S/R3ttkhK93mKrAng578?=
 =?us-ascii?Q?ysve7nohgVz5vTVax6K+GGBwwd+kW0g49ccYBB8O+aYzbpmeREnS8soD4Cv/?=
 =?us-ascii?Q?178PXZKbN70d1hQ8iKxGe+ABSP8unGJWvZ2Dk9tTj2hotT1r8vPAuXtIiIXZ?=
 =?us-ascii?Q?S+MMmj5bqU052yEDB5y5bGAwRcGcRprFRlPtDY8Od42ZQzo/zaau4KEqLszv?=
 =?us-ascii?Q?NzHENCK9z5aSfhNYdzlzoUweKAZxik1nwI7EeYfH15dus+Xppv1qb7MS4+vC?=
 =?us-ascii?Q?lXhiJWNMkeBNM76tyIvTELVovb07qcA6YKNbLbPIFkNVP2kiGqlbWu/UOKYU?=
 =?us-ascii?Q?GD7IWjiA+0pYGMNxb7X+T29QMwXMbHj69vqqlOvWVmPFhXA0umBHHCQ5GLeo?=
 =?us-ascii?Q?HWrW9rDUoGgax2BgYl8Mjop981SPiA/Lsu+BiM1J78ZnPu2lPWq2+ojVJa6t?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a79485-e7f2-4002-0b66-08de1aec0e54
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:17:09.0113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IA3f2EIeoVl9nFkjU1Phe/JRFkrYvPYkXWXhi0pUfg+zVrEpl0+hUrmZzmwLCcGHp+oNxX90DDqkPfUrVqqQM4rqzzdw6GHxvTIJy8vS+OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8168
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

On Fri, Oct 31, 2025 at 03:22:45PM -0700, Lucas De Marchi wrote:
>gt_reset() doesn't make sense by itself: it can only be called as part
>of the worker. Inline it there to avoid it being called from elsewhere
>and clarify the gt_reset() vs do_gt_reset() paths. Note that the error
>return from gt_reset() was just being ignored.
>
>Also add a comment to the xe_pm_runtime_put() to make sure the
>get()/put() pair is clear.
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---


applied to drm-xe-next, thanks.

Lucas De Marchi

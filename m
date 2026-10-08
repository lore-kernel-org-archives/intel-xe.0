Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1238CA600E
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 09:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D60110FD58;
	Thu,  8 Oct 2026 09:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0RSXWl6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21F810FD52;
 Thu,  8 Oct 2026 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791452944; x=1822988944;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=4+FUSUPYkjlnW5S61N49hFq+IkcPdEDkZW87z9SlOhY=;
 b=f0RSXWl6OqUPk4SspFrlkx6ywK2cCbPWWDJlfHuHxhee8e536UjHXmMm
 F6y4Pk5YKCTrifR8qdnlGrGA1l0InVg3nZRiJNxTRe1Z+20deTEHdSlMH
 jA2K1JcldIz+Cm21HTzohVKVpSs91lA2fRbp0bibvPfNc82RCtvRrZU4z
 B+4h576jz9e+A73zBIVIFwNm9xQqKjJ/7fpQOr51xspj61zBmlz3bWiTG
 InbSOYV4w1kLk/irNbWn3nHLVEi+rN2DOYRMBD7HdkPHUqq1LC1tbE9s6
 9OGeAKDhhr9xEyQWumfzsrG9PT+JpdFzXJqvsUcvCk4ffXOzJj6vYq3xu Q==;
X-CSE-ConnectionGUID: BafDMYsxT2GuHIOc06rq4w==
X-CSE-MsgGUID: nlDu87YgS8mtb1a9y+NaQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="240062"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="240062"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:49:03 -0700
X-CSE-ConnectionGUID: SO8rBLgoRgOdfrpcSXRRqA==
X-CSE-MsgGUID: zobBjaqiSbCFAfK65Y7jfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="5277"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:49:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:49:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 02:49:03 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ly+QjupPHHekHlPeq6PLSfI/rZAdzQpQSTZOeTo96KhIPHz3c39X6Uspe8vnTUR1UQb6yaVvZAMYFvAyBindWBVOzBz1cf/lqFgojH5ne3x/+ettdqTCuDn/fwHO37o0pFl/Lp7ShP3oyhBN/JUl1LJvEpkgVOMoAFrzlL6cUNmyPH6tLMDtU5txRIgmAHQJWOpTh5khFlF7QVdCXPcUklUiosX3k+2kWzjrHLSYCbsnggKKQW4ceU5kM9k+xG7y3vFSDD9BNgk+QsKJQ5HUaVYe3BLc6pfbnDIgjhzzfIVTPmXH/CLwp0+HNMAUyV4NGJTzMVOqzDwYntLjj1Zqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+FUSUPYkjlnW5S61N49hFq+IkcPdEDkZW87z9SlOhY=;
 b=AkoC7PesjfOKUhVudH77EA1jLp3zMriIeAHKUcl4evB2KzGmLXoHFHIz/rPh5JEwTs+SZdklMxRDv6YA40vHRU6PvamCpp/0HYdvHll0o897TFeAbyOuRzZK8/gQWqerw5CC8DknyvMGV7Ke8Au2wiqnWru39YOxL2gTdeXBl1HF9T77CXKXHp8+poMb6+lFj6tIPUUzvf1bCuZPAta3NQ/yvIk3cF+pNdu16xPtV9H1ghNFt5Wi/W1ZnQS/7verxtS0OhcPC0duW5rFW76a/lQ6j5I77Cy9HIlj+QAexv8nBrIB/iYka70zeDmlyh4uCKN2ucxQP0mEsiYuLEyOOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 09:49:01 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:49:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 8 Oct 2026 11:48:57 +0200
Message-ID: <DLZD2E26UTCY.2GIWH1L49GF9T@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/i915/gmbus: Fix i2c bit banging for PTL+
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
 <20261007222314.5714-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20261007222314.5714-5-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: VI1PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:803:14::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bdb4da-e3aa-4940-8111-08df2521616a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|4143699003|260925021311599003|260925021911599003|260925022911599003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: /Bvy4/3avPV89unmYyBm1c1Tzudn/Hllr5A+iduIrQnmLOlXkEdERGTHfFwl55hGUPlk0YcMeQ9pfyjN7ysGPHh7CY2bHeO2rTkoLAIs4QuOQ9vt6JpbzZpXWdAWoE3qeFaWt8rVbVGOYeL2SDd3lCotk0F9mPcXrZD671D/gHA1L4e/ak8LbhEXti/e8Z5YU965kXT5AwUMVHdHxo8o3M3flofviMG280v3eDdOL0FS60Ev+zb6CrnpRMFGi487U7to7E9x0OdfW7EGXHNiQII0au1kUq1lb+ZWTDhGqAHd5NOiQUH7fCvMycDGQCStvSwujpZIuFvXFkKUOGQeJimUxsRMkevoau8SQSMK7Wo7iHFSwVr5sEP72nv+Dly1cIkAZdUEVSgIi67APsUBxgwDXn5Rkyep8ZzLvSUVIONLJoqHsiJWs7ERW8QCK/2uczFOnv78DGtmfXNH2rmpEUwBXp1E2+klIjtakCAf2yOA2sK2OrzLBmTfHsutuk8bjpVKPAIefEZJu8L2WtoxCGNxLDY/UVX+T/PZZrEV0AoMIlN+BD5KbfXh5UxNXuDAp1bQa5YgIT4WOdtZzxchifKk2Nh/Mos9TJYwY0Ea0kouzHihk9jVTwU7IDGfSj1I+XYH0s9WNVqypfSOa3UEp0oquJzit0AaGzW+I1u3jE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWVOeHR3cEJSaXRrK0VQL3RRSGRWbjlLc3JoVlZzTkpWb0kvSmg3cE1Zd3FW?=
 =?utf-8?B?eTdrclZheUpMdHUrK01kVWc3UWI3Q2U3NkN5d1NKYklKQmV6QmJiRzBqSC90?=
 =?utf-8?B?dnV6QWw3QXVPVDJyRDE3aE5XckkvM1FDNzlISS8zT0VZOUU4cC90dTNZV1NR?=
 =?utf-8?B?UHduam9hRmpXcElpaFdraGQxTldnWVlTU1E1NUJ2eTR0TlJzaUttS3BSVnhl?=
 =?utf-8?B?K2hMaUhnZ29IY05iMXpTNVZ0UFZ1L2x5WDROOEZFd0NINVpCOVE3NTJKV1Rn?=
 =?utf-8?B?OXZFOEVQZ3RWQTQ5WDhPYVROakowNWFyUWJ4b3lUdUFORFk4eVpIRTRRY1Rv?=
 =?utf-8?B?ZHhSOTJMMWw1a2ZvVTh3Y1BMTEdFaCtlZDVTRzZ1dHNzM2drdTdHdUhKRS96?=
 =?utf-8?B?L0xjVXhsVnZyaUE5Q0lRNW5KS3V1Qk91bjVMTWt0djQvK3E4ekF1MjdvQVBW?=
 =?utf-8?B?elF4QlgvUGduRFh0QktnZWNzRnNRUTlkVVlGV0pXOGd6WHh1UkYxdHI1cjF2?=
 =?utf-8?B?dEVDMThvOVU4T05JQ1dqYXRlSmhudS9KV1FNUkR5R0dPc0F6Q21aSTZsRVQx?=
 =?utf-8?B?aXN6cW1uZFB4YlhPYUdYV1hIZmsvb2d2dUxBZE1PK3dCSEVMSXpQQ09wMUky?=
 =?utf-8?B?ZjBYaURzbStsNlRWTy84STZjZFM3R0ZkV3U5VWFYalh5Zzc4ZzBNUlZaRi9k?=
 =?utf-8?B?YW80ZWNIa3lnVXhqMzdIVmRwVnZ4cUoyNXplQjlBT1AvVW1CMWQzR096ZTlR?=
 =?utf-8?B?WmNCZXBMUlVvQSs4djFUMTBMV243d3lkbW5QZU9YSTFDL3poWU1yRW13T1BF?=
 =?utf-8?B?cWFIRnRFYjJNWmpzK0RRYXdtYjlXNHJOcW9wNUF6MndZNjBZYi9GVElaWUQ0?=
 =?utf-8?B?Q3ArbWRtOStXUm9tREF3dEEwLzJmNGxQU1A0WHRyMFROaEovS0VIMWY3VGRh?=
 =?utf-8?B?bnI0a2JDbE5rR0pVN2lnR3BVRTg2UHlOblVmK0NVV2lKZUpwQVhJOUhqVHpU?=
 =?utf-8?B?Uzh4RXBwSGFPVUIzaHJBdmNxaXpqdVpldEN3aWZSK0VYSU5YSU9vdTVhK2tx?=
 =?utf-8?B?d0FsMHFQOG0vQXRPRnFKTjhvVk8wV0YxeFBrc0V1WEU1eUNNd2F6ekR1QTFL?=
 =?utf-8?B?b1VaWVZGQy9ET09LQVZrZVRDQzB5WCtDYW9zRkdrSUkzVHlyaExPZm1acTF5?=
 =?utf-8?B?cnQ4U1FxdHUyb2JZN3FyTEt1K3ljZ3ExbFMxcjZzdW02RStVY28yNXg3ZG1Z?=
 =?utf-8?B?b2JSUzlEaVNYLzI5Mi93K0hBdDhrTkhCNndPZkw2djdvQkd6UWVHK2J4eTcx?=
 =?utf-8?B?ZHhDVXJmak1NM3p6L2RveUwxVHJUcExoQXpRSCt2SzVRaFo4bzRsa0UyVmQv?=
 =?utf-8?B?SndDN0FTaUk2L3hBa3Y0Z1M1dncza0lrbXY0YXpWSkxSNnZxYWJiV3NSNWJa?=
 =?utf-8?B?bUxGTDRCb1Q5eTRWME5YRTNjVUE4NUR1L01NeXNnaVBNWkdyM0tSS1lRbzdJ?=
 =?utf-8?B?NzhIRE16T01NdXVhUUhUKzZFa3dQWUtQaXRZN2J6cVFTMWI0R1hYc0V4MnBh?=
 =?utf-8?B?Ky8vY1VZZi9iUDBEVUp3NnBYaXl6SGRxRGErTUl6QnN5RE53dG9ESHdIM3Rn?=
 =?utf-8?B?cXlaN3hBclFEYVpQR2h4MlVrQ3ZuU2o4MGh5aFZCWGxNZ1Z2K0NNeG9vbnpo?=
 =?utf-8?B?Q0NmWEswRm9ta3BtTkhWclZtZFk5amorckV3Yjlybkp3aFNkK25Jc2sybXdN?=
 =?utf-8?B?bCtJbTdPNWxWd0U2cGVwdXU3TkVvVE5LdDVvT2xYaHVudlZVb1h0MU1SNC81?=
 =?utf-8?B?VXo5QXBsbWFxdElDNVVTdWxXMEw0NXVWVStQeDlReDV3MnFJM2VhTm5zWCtT?=
 =?utf-8?B?VUh2cVo3enBUZzF0V1hDRVhaNjRoR21ualZPUjNsd2VvTytTRDZZdi80VldP?=
 =?utf-8?B?cFlWQ1ZQS0RJNkpCKzFEb1dibkcxY3J6NGJFZExnY1ZlV1l3WWRXTk1CWWpy?=
 =?utf-8?B?ZnBIM0lqbXBLV0grQXVCaHpLa09HZVczQnlJTGQyMDQ0aEpPcllvRk41cWdm?=
 =?utf-8?B?V3ZORE54Z2RxOWpSbVlNTGVJYmNEN1R0WnV1bUdWcHZ3RDJiV0lFR0pteUtQ?=
 =?utf-8?B?WGZmdTRCTGN0Qmc0SmI0Tlc2S0J4b3NPSGF2M2J2SzRLSlYrZFAvMjRSUzN0?=
 =?utf-8?B?cVVOSlUwcDJVamhwd0pjZUNGbWdrV1NPaXk4QVd2UjhLOGtzNW4wQjJKR1hV?=
 =?utf-8?B?K1NBSUNDYXlxTit5NkRERFNEMER2ZFhXMTZDZmk5VkpZYXBaaXErbGRURk5X?=
 =?utf-8?B?RDN6eTdldlpYSWYycHFaU1hISy9UdUsyWHVncW5EaXJWM2NUUjVGMm0xQk15?=
 =?utf-8?Q?C96Q5Wu9iUC3yl7o=3D?=
X-Exchange-RoutingPolicyChecked: BXqO2SBfFGX4zARlhjMf8IvzBaIULmmecZzac+VaE3G8q/TzPtfdj/zGVCoHCHTDKTZYAmingck3295CWoP5SyiUew71tWZlxpqesDNMW/iVu1Fy4M+zEzlldG00fky8vyBq1o9CzA64RfK7Y916xxzSS/t36bq4GQUBlSN+PJOrWd9lxvaHWIk/iZoUr9JkFKioTo1gxmnTq8G8bUwMZDKaTgklqts531CVzkMf1JgFuIssdE7SzcWJXMfLMZIm/RWIqgV26gvbh/j+G7VvB6LTdyBIyMn+aDGuh003LgKVro1UHcbYG2JUwFVtHe4FhQ6t4bhauRU3ryKlTNU78Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bdb4da-e3aa-4940-8111-08df2521616a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:49:00.9780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28fWa7JEsEEZJHl+50TKARqzJ3yTmr0j9d4AaV7M3rZ2Uhmf9W6hyASpbLiyFpNY6hRP9Wjyvkmi+uk7C/BMQBBe1iNnAUNoaCKDKoc8p/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
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

On Thu Oct 8, 2026 at 12:23 AM CEST, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The current implementation of w/a 16025573575 does not actually work.
> The GPIO register mask bits are write only, and thus he read-modify-write
> cycles we do will not preserve them. Furthermore the implementation makes
> no effort to preserve the actual direction/output value bits, which is
> a must if all the mask bits were actually set all the time.
>
> Rewrite the whole thing so that we always set all the mask bits,
> and correctly preserve the previous state of the direction/output value
> bits. And do that on all platforms so that we only have a single codepath
> to worry about. As a bonus this approach will also make the code
> work on upcoming platforms where the mask bits no longer even exist.
>
> Smoke tested on alm,cl,tgl,lnl,ptl.
>
> Fixes: 7565fd5dcb0b ("drm/i915/gmbus: Add Wa_16025573575 for PTL/WCL for =
bit-bashing")
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
--=20
Best regards,
Sebastian


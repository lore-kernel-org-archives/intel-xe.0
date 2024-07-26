Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4553DC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 15:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A4A10E9CC;
	Fri, 26 Jul 2024 15:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToxPoQmB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6BC10E9CC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722007549; x=1753543549;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/3vEPnyb1PRCytccmqIlwhncdtaP/Uk5v72e1gTWBWA=;
 b=ToxPoQmBqAODJYA4PSrHSHXzXPYN1LA5p50djUKVekI9G8X8d2NWzHGC
 hO03YZBs3X/XJGRvyDU9BpP6XGOHbfXGDXfr6MtviOWywFozukskHdd//
 oUnxgSBBQbZjILKj13nxjx42/abjj7adMquHjipkVpzG8K71Z5wgtfF8Q
 Hs6zHNQNTUsqpvHOTPxinj3LzAHY6QV5ZSq8v9pVOXlCQzyxJeejUTOW6
 XPraMkp+xcHSP+7dn+nPYzd6YpPRFuFcA4qqIvMJvlyEw0tD7x/Yuf1a/
 UOAeVC5j/SKuxjNYglDIvv/cSQ+Q/BiP9MWdJL5bDB5s0X+OVRR2RZTBa w==;
X-CSE-ConnectionGUID: G9Yf3bjOTmqxvaUPWLvSkg==
X-CSE-MsgGUID: vU8vBhd1Ti+TeZYvBsWPgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19765251"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19765251"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 08:25:48 -0700
X-CSE-ConnectionGUID: BR5/H/BvTi6c3XQ3g5zURA==
X-CSE-MsgGUID: K1ZLyvCfSH6Msd5VSwLOag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="83934886"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 08:25:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 08:25:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 08:25:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 08:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzcuVaYuoyWzFZGhjx1zdU7W+uO1Z4F9zuqdLltnZ9doDxw21ucrQLLFBvZSOciqHL97gMsCsbISdhQF5GMzyIECfUMeom4pTlXp8g5ccIQxTc13UNgLO0TRoipEqf+7mXI2BeuxagR1d7t1YrA6xgR1QmbaQTx80oUZi8lyddjdJSjS5SeFOh3toxSxEVpV6M2mEDun09yb3SV/QSQ3vPOOlE+KqsU6kFlfvkK8PCe1RoK6xS079snE9nQlUGc4v1pOrQa00qV48ZLK70s37FGpodylwSAxZec3SDivvIwb6dZyky8bc1uN3YAc1RqBf+rR+8y/QvZGSVbbP+a4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X99B9r1ZQthpKNlR1kOlw7KkEZ4IOQpDVKQ5K9wczHg=;
 b=NcHiHuR0lELbV6GdJLEVSCA17hFw2S9heQUykIfFfPHxAC3uYoRf9MW6ol6z1ND14Ye9g7zg5mMbmvFOgX5NGUw4K+ig6Vz53stK6SrPm8IOJNj1lOxMY3trlzD6J1Udserch/z9bAZyQZstUm+5/KPBvdJBroFoFq5t2p9C6DdVgtTDLT7bhYcRrbhM9A/yApqNgeaeGN07GWFWPzTJNGWExwH6i+7BSjL5btS//5z3b1xpLG8hmU9Pp0GUNbRKM17/sZWMaR4NkHBcmCT8yCeHIcpym/MhL+4UINI9/pH+jyv4S2a3H7Q9SiVrjSM/uAq0+QN0ouYi/rgMhbukQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5180.namprd11.prod.outlook.com (2603:10b6:806:fb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 15:25:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 15:25:45 +0000
Date: Fri, 26 Jul 2024 10:25:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [CI] drm/xe/guc: Enable w/a 14022293748 and 22019794406
Message-ID: <7tlkrawyfq5vvriyrh4mbe52nwqvaa2kvhdl6drqf2fbjjs3kk@kwtyd3qp3ba5>
References: <20240719230525.2444543-1-julia.filipchuk@intel.com>
 <e46ecad3-9343-46f5-8994-818e6362dc87@intel.com>
 <f2d7776a-c152-4c7e-b6a6-f88861c7ae44@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2d7776a-c152-4c7e-b6a6-f88861c7ae44@intel.com>
X-ClientProxiedBy: MW4PR04CA0348.namprd04.prod.outlook.com
 (2603:10b6:303:8a::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebb7495-9655-440c-9082-08dcad873830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rxrqj3+h+e0J75hEwr+py8gBt8kSQnHkWOhXZ0UK7QPDi9sfmtwF6xGeTw?=
 =?iso-8859-1?Q?mxWhfoRmj43ZKNMUWUYCCFTgoFPff3A2IzTMEA3SQFBDO88flH5M9f8Pev?=
 =?iso-8859-1?Q?DzeSXAr7Ofc6eJr/K/Vgy2jKG5TklTREnegE8yfdesP/JRS0NXL6Vyfs4B?=
 =?iso-8859-1?Q?t5BetId7tJw4LDZNc6VwnS+NZ+qXzEBiBS+D+H2yY/YAIKShsCkmr0IcLK?=
 =?iso-8859-1?Q?Q9ICjq6VpwP+6JChYVwO8rLW9WJzFCNQR6wlHX/ljjrft4vgcfwpBZGKSS?=
 =?iso-8859-1?Q?vpJKHJrwGMM/95M/5Dfs37kjTdFu/SML4EqgM0pDVu5uMiNxlyH+aVWsEh?=
 =?iso-8859-1?Q?Xz480jRmApLBNFiA2EtAJEBZ50fFf/HfkAv+AD2JblvO/9wtopwP3bdNdu?=
 =?iso-8859-1?Q?1FbHJOHZSg5dzNBmasX3NHC4jcoWHS6HZovfwtrl0k/zcvC2D9x9e5SUN4?=
 =?iso-8859-1?Q?cQFajFZTXQvLM1Q+6CRAkBYLMQdkvYzUnCtYJEcGkk02tx+M2OPmB2UNbe?=
 =?iso-8859-1?Q?yW+znNUIhOglkBlJPBlSdyFcSEarUV8YFw31KdYn6HfQudUCp83aBZ4H1j?=
 =?iso-8859-1?Q?I28Ji5tuX6hEY1l08CJiRGsB2PINCByOOL5ChXmcpuibiuNIYhL91G6shH?=
 =?iso-8859-1?Q?twiYgUhRkvy82ZXTRWiRNMA5MfRKsQFFN9o9pAoGkLcJWr6ijLy6bWMLU4?=
 =?iso-8859-1?Q?7Qu1FL6AMWaj2KEpR0RZ2zq+YtVG7mLux+h1vufLtU9Apw0PuR1KpiwLmL?=
 =?iso-8859-1?Q?EpsN2vlFExwg77WH4sq/9HtE6srad2kg0BZGhW8T6iZZEZC1QWM50JPpYk?=
 =?iso-8859-1?Q?j2r/TbHOR5B4OUx52bZUEU0BpilwPlvtR5y9WNfen5IanbIz/jU8pymvvQ?=
 =?iso-8859-1?Q?sAaWgdcCGkbl2kScfdD+r+qPkn1c8wfatxa/622DnRzLEFzG34aD5HL1m9?=
 =?iso-8859-1?Q?XQ9iJgf/Gg0knIgoAQUl7htDMxwoMcUaSSquQrsOUWY65oy9S9HA80VHwM?=
 =?iso-8859-1?Q?vYccG1+YotuyaYecXOc9Av/LczIXH0N3/m3c4HfGom9nvzpB9eN1o0iBR1?=
 =?iso-8859-1?Q?uE2ynEM36gJVjsTEzfXF7Upmw6GwRRgGjLaiLz20Q+HsyHiYp2toW5SjdG?=
 =?iso-8859-1?Q?1L7afNaq/n88PHFXEH9SChOx7MQy/5g08wU7EmZcp/67fcoArHjQKUYT28?=
 =?iso-8859-1?Q?K5xDgNtriQQYOcRA9nJNTzy33esWMkfOmTgZ7+uy429gwB+qjRrwjwaUpj?=
 =?iso-8859-1?Q?yA11Iac4LwG/h6PmpEI4Db6fQ6V/zOnLK0BwwCqIiWwzMeylAXg1noyIT4?=
 =?iso-8859-1?Q?e3+nsM7D/+BYt1EPnXAwD6FyvGqVBMebzD793G8sgeG8/4YiYMHLDC3ezP?=
 =?iso-8859-1?Q?z3iOlUQK+vw9gxpH4cutUwh0W3UKdgmA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/DgCySL4mkwcUhoOTfxvINBW1hc54+vMyHWS3fHYRfTmtNldR3h46bxL7a?=
 =?iso-8859-1?Q?1Z+kI2OlKBWW7sfq3FdsqjNuIqWlTW7avQGOT14XGuduJ3ZH5538fnRSo/?=
 =?iso-8859-1?Q?lPwQb9zdMQQ0uQy183+ubkGH/bjGNGsQrGeISbW659EFjEQWEzp3Z6TaRc?=
 =?iso-8859-1?Q?P257WdmkfAsNj4t7m/OO5pZl8YE5WUnv9vwRKRm005bzWvSNonCXvSybZY?=
 =?iso-8859-1?Q?WOfyrvmqcFiVjE1hBo3BGfJKsClbqx5OfjsdRkjZ80XBeWKFhQdP7mK75M?=
 =?iso-8859-1?Q?zw6e8Dz/SekkV0BL0xaf2FmMOi9H2SFS2KaX/dKJ80A68O0l+wmLUmMhNy?=
 =?iso-8859-1?Q?0KZo7N8xrX86nC5Ot6Z7tTtCVkuiYx7TanAhoi7+dsg+g+UynyIrh8wABh?=
 =?iso-8859-1?Q?P04DYq+4nryPydQChayyf945/UH7HlptjxaggnUUcQ3pjJTA8c8VhTHBWv?=
 =?iso-8859-1?Q?aVetNY6gXIHYNpHpyyiJNSS5JveMEb4+4I9z0HEdcPiLExAcbxhVJsIMBh?=
 =?iso-8859-1?Q?T3n6xmUwGFC0v88h3Xd2xzOjVG5IJuVjs3GC4Yt0JjHS6K59bpsi1iVHOY?=
 =?iso-8859-1?Q?NpeZCjgUvZX+ymuFDzrao5DDcA0FAVRPUxcqJa/iUJYUzoqILEbjNB9InR?=
 =?iso-8859-1?Q?sHSbXGSu7/lly1R0w0/3bhnRJiQ+9VVeOW7AovyVFSmzBtTRhxHOmp5inC?=
 =?iso-8859-1?Q?X3I4PmtSTfdtzPgFsHVHhN4vfnSV5RD83APFTfAQG2LgOyOvQIfxzVXvGU?=
 =?iso-8859-1?Q?24wfMLK4Hw2ARGq8z5nDczA0ZAstddlK67gogZDtsegrlrgSoauiGz7nn7?=
 =?iso-8859-1?Q?yyzZXguLcE6QZd2VyASwBq6vBaqFGb9f6nZ46bBVcCbFjHuX7s/YLQ/gWc?=
 =?iso-8859-1?Q?+rjkWpy3MN6eOS8IWpX1Vpm1bkvB7iKyHg5LY9AeGU0WGAWt5BcDD8C867?=
 =?iso-8859-1?Q?oQs9ClS9i4ENkWhawOqLe6CO+gJKDWvAcPVX5LURwhCShlV3WoqnARma7v?=
 =?iso-8859-1?Q?yAtqXnhsQrtWsPwnTMg5idd8CnE7jhtsUJ5QqEPlVRrAWEAc9u9uyCotVj?=
 =?iso-8859-1?Q?V9DQtd+XXn0aALhuLEeQkFFqR6q7kMgCaghMR/BACz7py4wzvjOsq28Zjl?=
 =?iso-8859-1?Q?xVP5hTjFXN66rJVxnTTLsmMA15zIhdXRcvin9AVDwDUSCNlKSv3z+OfIv5?=
 =?iso-8859-1?Q?rG1rxoUObPb39JOq6StYznhs8IF3v6raMWtdCbCUF2lx2wnUcvJ4xy/DzW?=
 =?iso-8859-1?Q?ZEtgnAnRGWLHFmjFmCwJtViczfKhmZDkE7yTT0o+HotM3jtVcFU6rVT3iO?=
 =?iso-8859-1?Q?SyY3IiG9NmmQu5haC8wd8g60q20etFhQZjqSMcHtpBX8RnRwFxLdwoAiSe?=
 =?iso-8859-1?Q?/KJF181xQp2pDJIODFnu1cqFGW4OBcJQTpz/r/08SXgGT+aMnBl14r17Gf?=
 =?iso-8859-1?Q?k36fSgKLIPKFbHCOUX1liu3VDVu70I4iBo0Ethvgy89KDkMTF689rYzZvR?=
 =?iso-8859-1?Q?m0dzA0UjTXGmZTinddte1ynZFgBNV5qsyy/e2EOqSUTFKeriB9UILGciZy?=
 =?iso-8859-1?Q?8Yo+Yf8IXGaNmZCyN+KgQcRWVw3xk74IjGvS53mDev7padp7FhtnAJM1AI?=
 =?iso-8859-1?Q?/3xphMQaOupwUX1x6Yo5CHqCw6TsXd2FgJEQaUJ0kP6PBvWf0tlQxlyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebb7495-9655-440c-9082-08dcad873830
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 15:25:45.6794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7MByarQ7ptTimHMS9tI+cOVt0JwbMJo64SAKut9iw6nNsOCjjrlv7YqbS0kQVVUKBV26of/v+07dZrw2tVRZcYbxP9HzS6CA/hEFPAGlPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5180
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

On Fri, Jul 26, 2024 at 07:35:55AM GMT, Daniele Ceraolo Spurio wrote:
>
>
>On 7/24/2024 2:04 PM, Daniele Ceraolo Spurio wrote:
>>
>>
>>On 7/19/2024 4:05 PM, Julia Filipchuk wrote:
>>>Enable workarounds for HW bug where render engine reset fails.
>>
>>This needs a comment that the WA is only available from GuC 70.29
>>
>>>
>>>Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>---
>>>This patch is for testing KLV workarrounds.
>>>
>>>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>>>  drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
>>>  drivers/gpu/drm/xe/xe_uc_fw.c         | 4 ++--
>>>  drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
>>>  4 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>>>b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>index 8f9f60b28306..6b30743a2f6c 100644
>>>--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>@@ -351,6 +351,7 @@ enum xe_guc_klv_ids {
>>>GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING = 0x9005,
>>>GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE = 0x9007,
>>>GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE = 0x9008,
>>>+ GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET = 0x9009,
>>>  };
>>>    #endif
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>>>b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>index 1c60b685dbc6..3190bb4ce04e 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>@@ -367,6 +367,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>>                        0xC40,
>>>                        &offset, &remain);
>>>  +    if (XE_WA(gt, 14022293748) && XE_WA(gt, 22019794406))
>>
>>You need a check on the GuC version here. More comment on the 
>>version below.
>>
>>>+        guc_waklv_enable_simple(ads,
>>>+ GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>>>+                    &offset, &remain);
>>>+
>>>      size = guc_ads_waklv_size(ads) - remain;
>>>      if (!size)
>>>          return;
>>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>index c902f4a10f44..d145ce77008e 100644
>>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>@@ -105,8 +105,8 @@ struct fw_blobs_by_type {
>>>  };
>>>    #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, 
>>>major_ver)            \
>>>-    fw_def(BATTLEMAGE,    major_ver(intel-ci/xe,    guc, bmg,    
>>>70, 24, 0))    \
>>>-    fw_def(LUNARLAKE,    major_ver(intel-ci/xe,    guc, lnl,    
>>>70, 24, 0))    \
>>>+    fw_def(BATTLEMAGE,    major_ver(intel-ci/xe,    guc, bmg,    
>>>70, 29, 0))    \
>>>+    fw_def(LUNARLAKE,    major_ver(intel-ci/xe,    guc, lnl,    
>>>70, 29, 0))    \
>>
>>A couple of notes here:
>>
>>- The LNL and BMG guc defines are CI-only patches for now, so this 
>>update can't be done as part of a normal patch meant for the full 
>>tree. We're planning to move to the official patches very soon, so 
>>my recommendation would be to drop this change here and just add the 
>>official patch directly with 70.29
>>
>>- The version in this list is the recommended version, but the 
>>driver will still load if an older GuC is found, so setting it here 
>>will not guarantee that 70.29 will be loaded, so you still need to 
>>check when setting the WA above. However,  we didn't distribute 
>>anything below 70.29 for LNL and BMG, so we could indeed assume we 
>>always have at least 70.29; if you want to go this way, please add a 
>>comment above the WA to make it clear why the version check is being 
>>omitted.
>
>Just realized that the latter part of this comment was incorrect. We 
>did distribute GuC 70.20 for LNL, so we can't omit the version check 
>in the WA.

it was never officially supported outside of force_probe so doesn't
matter much. But I agree on adding it. The check is cheap. Better safe
than sorry.

Lucas De Marchi

>
>Daniele
>
>>
>>
>>>      fw_def(METEORLAKE, major_ver(i915,    guc,    mtl,    70, 
>>>19, 2))    \
>>>      fw_def(PVC,        mmp_ver(intel-ci/xe, guc, pvc,    70, 24, 
>>>0))    \
>>>      fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 
>>>19, 2))    \
>>>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>>>b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>index 540d38603f32..b0d7d4114967 100644
>>>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>@@ -27,6 +27,8 @@
>>>  16022287689    GRAPHICS_VERSION(2001)
>>>          GRAPHICS_VERSION(2004)
>>>  13011645652    GRAPHICS_VERSION(2004)
>>>+14022293748    GRAPHICS_VERSION(2004)
>>>+22019794406    GRAPHICS_VERSION(2004)
>>
>>2004 is LNL, but this also applies to BMG (which is 2001)
>>
>>Daniele
>>
>>>  22019338487    MEDIA_VERSION(2000)
>>>          GRAPHICS_VERSION(2001)
>>>  22019338487_display    PLATFORM(LUNARLAKE)
>>
>

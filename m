Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFDAC3065B
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 19:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9048C10E009;
	Mon,  1 Jul 2024 19:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcKzr47W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18ED610E009
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719862142; x=1751398142;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Q0vqW+vDxCxpe8bW/ksSnLkcFN+uaVNooBpgEgXF1w=;
 b=lcKzr47WoZGzT//CYE4CG76UKUlPFdEkQu3aPCQz6yQWY3/9QQmhPt3t
 tIDoVkyKcyA9JzXeV4XnG2tGupu0EC6qNquqzB7XPIQDbSDosW+v+z13D
 gbvJkQsMuIBNxVLWH6mK7iE3EHNE5JxDqL5cAfSe35kGwblK54g6Vl5mT
 vQJ5f9U9uOVS1q7G6DGEiW/1EjEF3DJQpKyJ8l9B7AIcbfCShNmcrDiit
 EKRDiQIlmUbpkWRMuXUV7a3xzxquVsCH9ej2hA7M/4BcaBKV/5ysdj6sU
 A7nRZ4e18cXWDFkhYt7qycAF12H79Sp1iMe3NUPmGzM88xOZedkGRI1Dx g==;
X-CSE-ConnectionGUID: AYAiuFp6StigajpBfJwRlQ==
X-CSE-MsgGUID: KsbFN0VPQlaC6f8cpVpweQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27631077"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="27631077"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 12:29:02 -0700
X-CSE-ConnectionGUID: siiz7/JIRg+NvJnf1WN1lQ==
X-CSE-MsgGUID: EzVwDSipRZWB3ln9sUwUXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="46284692"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 12:29:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 12:29:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 12:29:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 12:29:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTZfPv/Zwgos6w0V407v8KKP47nZk9O1oDjBgp+gYQW+46htNc4FFOgk8tk55ID/bMZeArnB4iyZTx0YTUPu2961Q3PDxfeFhI8zwMpf0zwnp97zlF/u7Kg5Dwz0SeBZlRRGEFvEgByHh/jZCRV8FMBE/YFpGpGHD8llYPrCaUMM5pLmdRQKFlGUj816Z1vzLKyMvYgwkbY9YRc1dYldBr4d1zSsWyfx01i6Eo9+NV3hmbAhfLcLUf3hnOH2vBEX2dpITiktznvlZ/VPEBbrx54tNtHQhUhhEtVFbOsM01vkCM+PahxKtjXoe5t/P2UPuLdj5OcH0uTIsRDLsYiwnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af8P2wY0WdcTh3NQVJhCDopYk7X6Pw0puJbWyXwAVaQ=;
 b=gw/n6gRV3VtKjhld2wk6citmFA2CSDsCoyOXe1sXaM4XzFFOyFL6DVsELwero0t/VGlivAsloCd3vqoaY2w9/Aa4ceoWe4BLBtqFVFcIAj+6stTnAmEGo5bC3TtFO4IGmUfAgrpIFuCV5ImXxw20hDhv1oMaql3yuoxxjxrmkXij0yR0L+sI7NdTxobtLY/kiyVyc5OzH24K1sgCFB+WlCCcp/dtumTSS26+Sg/S+MRbdvA3WKWuCAGMw/Gjy4+4hFi/9UP/+k259xc7GqacVNHcaAdbZqaZWdqCoEifnj8hGRCjErfiv4atAAnPMlX7KOdlm/mxg9HiK27CHjbiUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 19:28:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 19:28:58 +0000
Date: Mon, 1 Jul 2024 14:28:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH] drm/xe/rtp: Fix out-of-bounds array access
Message-ID: <nxeo56put6ejhn6iftfj5jsn7avafmeksylojusdwzhjqhfo23@rhpxlxacyfap>
References: <20240628161726.836734-1-lucas.demarchi@intel.com>
 <Zn8DyRqMDxKr8EWF@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zn8DyRqMDxKr8EWF@intel.com>
X-ClientProxiedBy: MW2PR2101CA0036.namprd21.prod.outlook.com
 (2603:10b6:302:1::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: d055a5b3-dd18-4082-bedf-08dc9a040de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PZvht7BSywJUFvP5e5seNe7o+s6T/x46e+U23McJGdkQtCk+dt8auKUkqvpK?=
 =?us-ascii?Q?zumC+NAxZtpTayYBX8KEgKoFzT0fWfjYXPIvvKcRkZfJ2QSh6ScJx7jRUaxw?=
 =?us-ascii?Q?na9seQqAnv14bH55EzIoPy/h+h1zI0cK1oJZdInklVAdg4/nOEQk51iVrgDs?=
 =?us-ascii?Q?i+34w/7GRYqdGXPDIklPXAuKEvA/IuI3XG8UfWH9KiqAqomYlM7XPPch+wXc?=
 =?us-ascii?Q?aaAA8Mxy1w0RVpbaBmHANBYaPWgTtAtyXOcKzzzU39jWoG0UKDt0/Sv/RSuw?=
 =?us-ascii?Q?wid455tKIlvY8pcubp5+2TGOuhFTzOTDF8NtK3GiS8cDqbnrlFeIhnaqfdtk?=
 =?us-ascii?Q?+m76ei7VmlxQZpFdsZ7M/21Jocv1hNEcV8fI4mPXLI40HOr9pcz60Z4zOj1l?=
 =?us-ascii?Q?5xz3ljkfDeIMhPtuSN+Y5NcHG/FRojNHnLzN5pGUSsAxYyIcDxKRH1O9F4Ow?=
 =?us-ascii?Q?E+IIm0GEpFgbaj0rSZRIX13mzRQm/rVsPyIGN/gDeLYV73Efs8ZJgQEIl6Km?=
 =?us-ascii?Q?p8fVJ4wR5lONataW6TtTrtYyFvoACLLP6VkMLbf+ISsX3uFP7sEjTVruQhaU?=
 =?us-ascii?Q?9TLAHbNRqrXLZSRAtDtkANA5+lYbMAocIW50VUVKdGgq5ZM3KbP6KsdoR2B3?=
 =?us-ascii?Q?+tnTgrEOJOsZr4u3+lt6eEWSLM3uSS7Rk+qYwGiEhOw0IhsT4KIA8X3mCJrC?=
 =?us-ascii?Q?C2iWhD8Nmnrcuq+pV2yJtIgEQ8GehG1JxJ08Uc5EV0Y9tQm4TyOuvFbKMd4U?=
 =?us-ascii?Q?glehGl/wds2jNKqiBXJVdpNZAS5iev4T/Gj4sAKO6CRqh6ue8IeRS2FNGdBK?=
 =?us-ascii?Q?kSmkysLVC3tolCx7KU/PHQicxgib8gRrbRHo3yS486B8IAYxbx1tWK8NK9Tt?=
 =?us-ascii?Q?kuWsCDKBURk+q9bk6YylRRYJf9Fd3s26bbHHVF9AV1u5xRMMQDHbPi3PvfpA?=
 =?us-ascii?Q?pAKpO1C6xua63WNfxyWK7QiLgRwfyJWZ1ILD6mSn0W+T1XVgXPcpHmQuiru0?=
 =?us-ascii?Q?u05TpcyLJEteCTrUha3Mwtkyb8Su+n9QZKK2FViZOXyL/kS2dUFGErtswsrY?=
 =?us-ascii?Q?va8mMh5HxxZSdXB7pniruZz5Wk0Cl0P1getiF3PP5DFdf0IWZECe4j/QbWG0?=
 =?us-ascii?Q?JC1sVbtFNW/klCMFycLBzclwQKx+JP4b4iE1G60a4J3qVXLhTh2CWF6VgZec?=
 =?us-ascii?Q?Y8Es/Bc4koYPMmxiYSeGRb69Pqt41lqDoAI2VlZWAMPrbBFDSDjjmqukH6w+?=
 =?us-ascii?Q?OX1RKUOnIOot2HjZHygMJGsRmnau2hOX05x5euZr1CTJ7mZk9mgNUdd4TZZ+?=
 =?us-ascii?Q?McC6V6qlZXTo9Fhcgbt9uaYNtkpRoHV8LccvFrtbmXBYPzjsk7oP9toCQsZS?=
 =?us-ascii?Q?jeFf1BPMjX0azhY/qjtgf8GGFbCzsiZfUu2Gupnq/xYliCWHrQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K8GWR87BFyYPfdIaSN38qCh5uBNNtABV+Hhepq+C83/jnb9EJasXifyV3au8?=
 =?us-ascii?Q?OidsbMfWWGB418vTUuLlbbbPN9XCngdJ/TJOlF/xy308o3DTKCklPgeWSfYs?=
 =?us-ascii?Q?ehRZp/CzLOF64zTl0DvwPPTxzIibgbElL2ZM45yRckgocCUlN6C2jWHSAA8r?=
 =?us-ascii?Q?F7wDplep+sXuO1AlUAthG1Kk1K/ss/JW17NGZSygnqYyjVKuv9XMGxC9M0Tc?=
 =?us-ascii?Q?BUQcMQkBW/xfwO4yVAqcVZ53DKrj9D+K5wZTDBYxhZ9+Uutv3T9vhiVEotOs?=
 =?us-ascii?Q?E2lSwK9mtXcIKcAI+FeGfGg+9+zfjJgD8xXEjJEvwNGARDIoGztK1K/JBNAU?=
 =?us-ascii?Q?YFvGtjQTDV8Hni4QIDeBCEX8uMem7rwRpngSIalsGBSG+3QqlCI0mUleAGoX?=
 =?us-ascii?Q?qQUr09gMEoQKdgxzbeRwwpZoj9w75Rk8tknh3n8Hz4ssN4PZN3fwvNTR3HTt?=
 =?us-ascii?Q?FIygY3vJ/BR9lqd4QIQUNy9gUfyi9xSI1B5Lp7ERbTe8udjYVhbptMBwrJOC?=
 =?us-ascii?Q?j043WYjkH4f6lgw4ej+ZR92K09Dj2fXxUO0JLkX9lDmwX8n0uAYvar0Wgia3?=
 =?us-ascii?Q?Nd/ca3N91JseOHXzVZ4V4tdOOGF0KqLDz06ziEqFBr1T6jNTU+RUhFunif8e?=
 =?us-ascii?Q?rxoM6dMM5e+8eBqv+L2XxaXWvQfWBa7Jcdvu8rQzsN5Roh+6IdHpVzaPPJF+?=
 =?us-ascii?Q?fjPpB5rnHb6dkyk2021K4qQY4w+7wNWBDF0FCdBhBDigXdNxNjpGetX3B7Fl?=
 =?us-ascii?Q?1BSlpaofaHX3ChXqMkEV3Bb4qwMkXjoTyu2hymuNhj815dVq3s3zoDfpnVbs?=
 =?us-ascii?Q?gJc2IGnPbmBiUmrRMcmfjEZs0FdKeP5sTVzU1UmTDYHTPR917NrtDatB3OtU?=
 =?us-ascii?Q?71x7M0wOphvX67+TVjc/9jDVDiVzwWC5YqOJ2lcBNxjplcsLystb3YeBmFBP?=
 =?us-ascii?Q?/7ia6nwuADBt4bjp1vXSY1uS1M1zJ8Yb3sp8lbo6c10NEqwNR0BdMhdT63TP?=
 =?us-ascii?Q?DrJK08qLv35F9CfFxufdacUyO17myOX5KrIyQDlWM7syAnsnx0z5+PQc9/pk?=
 =?us-ascii?Q?VUEj64a9BL8y4bBCa2CbKdHHOUFiAZMp4wGaMtnncv/Rwrzy0AMceAzhVGP5?=
 =?us-ascii?Q?k1YTidbEUyiaBQ80b9j+xQlaDsUe0RWWgWlhmwoV8M4nwAOosGN+iQ8HTDKJ?=
 =?us-ascii?Q?09WnlTHhRmHSWeDyMfIQbiFedX2oIQgf8PX7Nw7t4faUydSwXEcJ+wtZqNSC?=
 =?us-ascii?Q?LZUBeaVsGlS6uh3ldzEEND0adsS3LAy7mBXnnBf82RsULU8SXZCkSn48vbVe?=
 =?us-ascii?Q?QPHVy6iBpatvTIvVPBbGG3xq56xevzY/N+w1vNU/Jpcq2Si1FHkXeVMrRxyZ?=
 =?us-ascii?Q?twUHxCMn2upt6kVQpGcCPG49TKnhePHh9zY2bz091iY2iE1QF/Conu8fNke2?=
 =?us-ascii?Q?FFn2HIqsmNm70MnMlu5OTmHr6n4qqwEHYcUEsB3dP7TZ1aoKRpvBT2TK4jMZ?=
 =?us-ascii?Q?WhuG0z6qjZhHsWSz64mC1qKr5KpxFeJFiOZ1J4OXMefK0Zzadji5qNxvC2/c?=
 =?us-ascii?Q?rYJdfePYyjXptkqQvMRbZh44+MCjjNT6FM34EjVAOJJ7RP5S9Fs57RTc08T3?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d055a5b3-dd18-4082-bedf-08dc9a040de3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 19:28:58.5194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkoLmMxLnnowQGRID95rmHE74y9aJun8SPmEqdd9LRDSX6L9JsGzE6mxlNNm4kbhvUNaqA1RIJazqBrsUGNBNK08VqmjchqAhrhqNq799qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
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

On Fri, Jun 28, 2024 at 02:41:13PM GMT, Rodrigo Vivi wrote:
>On Fri, Jun 28, 2024 at 09:17:26AM -0700, Lucas De Marchi wrote:
>> Increment the counter before checking for number of rules, otherwise
>> when there's no XE_RTP_MATCH_OR an out-of-bounds access is done, as
>> reported by kasan:
>>
>> 	BUG: KASAN: global-out-of-bounds in rule_matches+0xb6d/0x11c0 [xe]
>> 	Read of size 1 at addr ffffffffa0a50b70 by task systemd-udevd/243
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

applied, thanks
Lucas De Marchi

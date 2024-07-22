Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F926C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 23:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B467610E201;
	Mon, 22 Jul 2024 23:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcT/cp95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E105510E201
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 23:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721690615; x=1753226615;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=fVjiSaiDh3JfezdVyc8Lp8CY6PR33/QRRy/NywlMa4I=;
 b=dcT/cp95HGXh4RUxWKw6uH6J7tWRwolfLEQDJNq9Rvo9CrqEWU4sQzgs
 iJLuoHBUqTYopVOZhGV3Fxbm4mJJ7WAvhowQRRQ6gj5ApFtGBOjN8DSbw
 uiGlKjFbvp8i3GQ8dwj9v4s61NEfL3N0PWIDF5niDFsK7Bw+1iR44Of01
 zDjtyPlK5ZCjyiIKIrbQBPGVMTm0AYtnP0IX37WSkVhDwzmLKvgLBCDze
 SfmdaZDFSmaTBxNSZ9eRkoJPix2C2l9Yu08KGIxtNcpgpyqy0WXN1ZAFK
 1eV/MSwgBk+yExvANr8Zp5Wv7jF/8tnUCg6LUGUudeINzQ54A7s907S1r Q==;
X-CSE-ConnectionGUID: 5rjFWIDBTgiibH/3uaHJYg==
X-CSE-MsgGUID: szd3E7e9TXOoOgFQOmaHrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="23091752"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="23091752"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 16:23:34 -0700
X-CSE-ConnectionGUID: po9myB4TQMyFYmJdwNBxFw==
X-CSE-MsgGUID: QSgpm2iPR+qJjj3QkwaIqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="52780743"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 16:23:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 16:23:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 16:23:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 16:23:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbgGocUWHqaVmnujcIYpRw/Ke3UMqrRryahGwwyfU3iipGMTT3XK6ldxf+W+MMLbeAbS2A/G2KTraBv26DvVBsgT/xKWFAyykJD8LhBhtTUfy3/WfYRhoIY92h9RfTJRCVXDPfBj3P7FUFhPG80znjjJy8pJ0v2XBGAAYaRvCFl8/RBH7X3tDgI/AGIv3sXbXFa7GYy1g/TpHt8vj2JguKYU9j29U8AdstvKtlhhEOqpXGXysUi/tE/xQM7WPJDBAYcnadzA68nVPV07jtuPd6epssDChWf9RmvQWu2otwFZw28P+ivATeuW/D+D8UI+tBNJcilzk1Si0jWiJk1tPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOwP8RCGm5CNhhjdutKA69s6wDNadmhVEOf8VOTXXuY=;
 b=bg7izMKRogvVI27Y9UKJwFlb3yo7ACnxVlZChFXiVy2dw2J+81pkfJ8KHr8JNn2W2XgooZglW9fVJ2Txekyp958Xqe0Km/bPA/WtH0Wq/SwhfGLRkLsh2yrJqzSVx9TFT4WcUWYwXIfRsTG809fKkKeUeKDsRnfMaobZ/aTLPOGmnTcJ7VS8oxZ8JeUe4jZ4svW1gUasuag6v/jkzdrPUdu9npCEayGYdjEfqn+QuOGZg5CdTpJZ9pgL7evxPhEFgUotkAYRFiYiG7HOgTUpbXapc5QnQCRTG1jgRTOFaQY84kz3+kfTZx7hsH9fVxSyJXdzK1SRrtk2qIqi0lAXmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Mon, 22 Jul
 2024 23:23:25 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Mon, 22 Jul 2024
 23:23:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240716195608.2819428-1-lucas.demarchi@intel.com>
References: <20240716195608.2819428-1-lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Refactor mmio setup for multi-tile
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Koby Elbaz <kelbaz@habana.ai>,
 "Moti Haimovski" <mhaimovski@habana.ai>, Lucas De Marchi
 <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 22 Jul 2024 20:23:06 -0300
Message-ID: <172169058665.66043.10367828117499655662@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: a350d318-701b-4b3c-f207-08dcaaa54936
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODJySHR4U3RqYVZMYm84bncvdkR1a0JydzlaVzJFc2VFeEhVemdPL1JiUGE0?=
 =?utf-8?B?dkRxU0pFTW40aG1ZQStKSWJ6eWdwcXp4TlRLNHg3UCtkR0VQV3B1WjJ1MUp6?=
 =?utf-8?B?MXVVZyt5VFdUZTAxS0pxZTdWTkRqSG9PTkFDcTVzUGNlOTlPenF0ZEVuMjF1?=
 =?utf-8?B?TnFZMmY2YkpzMFRyNDUwM2VZcXJUZ2RycFFZWjM1VWU3VCs0RXFPWUFJVFcz?=
 =?utf-8?B?eFFqTkE0Q013UnlPY3VTb0RRdXYvS1g0cFI0c2hZZE1XdndUdWx0aVNtU3h3?=
 =?utf-8?B?RVhudTFzZG44ZlJzODRrNnpNRTJDUnhVN2R3MmlucEkrakFZS2lROERxazEw?=
 =?utf-8?B?U0JSb3p3VGZQWm9uNzdKekxSL25rL0N2WkNVN09tN2t5emxDaWpBUTdBWjQ0?=
 =?utf-8?B?eFpYVTlYS2FwV0JHbWlJNVFNcmVxb1NTc3A2Z1p1a2x4dTJBMW9MSnFGZ0Fq?=
 =?utf-8?B?cStxZXJ0UkszMkVIczg2OE1RWjlZaDhsS3AvczJOdkhkUmd1Ymxxdk1oWnBW?=
 =?utf-8?B?c0dqcWdJZVdIWHBkYkcxb0JYc09CNEZ5MUJTbnlOU3pYbktacEZlRmltQWdS?=
 =?utf-8?B?YXFRVnJoTTlFbjN2QldNanRiZ0hqbzkyd1UzdkFlU0ZWczVubUZUYzRDaUg2?=
 =?utf-8?B?V2swTU1lQ2JlVlJnT3A2SzZmelBEZjNob2NjTWxVUkwwTythMEY4R3Y0Z1Q1?=
 =?utf-8?B?eldXRGZFdkFkZG9vUm9aNXF6Y0E2cTBtbGtMVmE1ODFRODMrNHRZMkFlYXZ6?=
 =?utf-8?B?a0xBS3hHaGZCQm9Hd2ZnT3NpZWsxeWpxcDlQUlZBU1U3U0VwTWxZbTVnb2Jn?=
 =?utf-8?B?dmxXRkxZeGZoM2hLVE9kQW91OGVKblpJeGoyZ00rM08rQldQZ2lXeTNLbHYv?=
 =?utf-8?B?WFhXM0xNZXN2c3hvSFZQd3ZmZGxWV1JtOXEwZVVlNDY2dUNINXJnKzRkam42?=
 =?utf-8?B?NmZwK1RRNjA3MGlXZDZOQUJuUmdNRUNGdElTWWdHZGFyQ2dmYytmZGZrbUh3?=
 =?utf-8?B?Vm1Vd0FWNzgraU04eUJwQ2cxRTNlSnFLVUxTNkgvcjUzYzllZlZNeU9xWlkx?=
 =?utf-8?B?Qm1SL09tNlQydjBCd0Z5MFgwOS8vcmlWUk9qMWY2K3dacHdHTTBGS3l2UUts?=
 =?utf-8?B?SGlZd2thU1VZZGRGM0Z5TElla2I1b0FWc1YvZ3dubzBzUDl2dVVmTkR0OGV6?=
 =?utf-8?B?SnlEaTlUTGN2ZzA5NEYwL21xSnQ1VUk1VlBkOUx4WFplZEtBUW12NjhEQXJo?=
 =?utf-8?B?azZ5MXhEaG9INkJYTi9zMHJhK3h4Z2V6M1VUb0gwUVJQN1N1dGFwSW8rOXVj?=
 =?utf-8?B?eTFxWTR2UTBYNGFWWVV6d0tlSi9jcFVuODRkOHdXOXMvc3p5N2hJRGk1MHFS?=
 =?utf-8?B?dE9Ja1dySlJLck5hUFdualBIVWdRY2o3UDJtYmdYNVp1SktqRG9lbllSUHYw?=
 =?utf-8?B?ekdNMHMrRkYxZ0kva3N1d3JROSsrVzZKTktMR25rTktnQmszaUZ1RXBVdlZs?=
 =?utf-8?B?WkZCdExoVCs3ZTBaYnowcXFPZHJ2V2lvRXpqL2JtaHZHTlcveVQ4NTlYVm9w?=
 =?utf-8?B?YWthR3VEYytNc09oTER6eUZZMnlOc29mbjFPMmNVT0ZmSENDd0c4VU9OSGpK?=
 =?utf-8?B?TmdjeEFselM1MHl4NjU1S3Fta2krYXJYbmVBd0o0VDF3OFVZV0E1TEVWZFpX?=
 =?utf-8?B?REgwZ0ovaks1akNSNHhVRTJiWkVCd3Y4NTRlQlIrWEhjMUM5WXk4NFIxaGtC?=
 =?utf-8?B?cjNHem9PaXczMGtxdGVpSk5UWTBLanhxZERNT1phdVlYWC9lVHFDN1g3SjdK?=
 =?utf-8?B?OXFtaTFLblJ5UEY5aU43QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1ZKNDRON1RPY09iVWh0eU5MTDdrSGpKd0ZIaktSc3oxOU9Kai9Edk1ZajV1?=
 =?utf-8?B?eGhUQ3pjbmNkNm9oaXF4MUx4M2VaNDArWkNxaklNem8wLy92SGVTeU92SVIy?=
 =?utf-8?B?UFRpU1RkOEhoSW9yYkt5R3kxcFc0MWROM1R4dEViUVY4TDVMUmJJNHZRSWFD?=
 =?utf-8?B?NHJXNFNmdXdBUUdZRnFvMyt0Zk9ucnV2UklzdXhwZ0d4MXp4Y1ZQWlZDTDJj?=
 =?utf-8?B?eEg0NUh5SlduREEwSjJPN3lWQTBtRlJ3TndHSDU2NDlMMjBwZExnbjFhRHA3?=
 =?utf-8?B?OGlXalVOMmZQdG1WQmYyUVltMEc4UHpyOUFidkQ2V3NuL1IxQ2tmRHREWGov?=
 =?utf-8?B?OW1Va21iWjJwUlVLaVU2Rm9KWUlDS2hGQTBVSEM0disydDg0QzE4Z2pOMlJu?=
 =?utf-8?B?OE54dDdCMGgzVitoaTdMWUdsdDU5ZjBJWnA1ODdFM1ZuMENVd0srMFpTeWVs?=
 =?utf-8?B?TUx4Z2dDeHdPZ3JONWkvZ0dxQ3ByN0ExNGthQkkrODI0c1pJZXpnSTd4Tyti?=
 =?utf-8?B?V3RicDFZZ1FzMndQanJtN09zZVJTT09oTEI2NEJWaSsrMDgwUnI2MzZSMGNN?=
 =?utf-8?B?SGFGVzlqZDArMjZhbEJ6d0dKMWk5Qjc2SUYzMHMyS3E0NDVTekRORXR1WVBD?=
 =?utf-8?B?NHVDaXl2cW43L3hHMGVTeE9wWnZZcERFcktGdjFRM21VNFk2RkFQMUMrYUVK?=
 =?utf-8?B?L2NBajFxRFR6YzhyMHZSYTUxWnFOWGJxa0pCQURMQ2MyM2U2ZnJmUmN3b2d1?=
 =?utf-8?B?K01TMjlrUzY5VUhqcm15TzdUWFZyZ0tLaVd1cXVLMzY1eGoxRC9YTEpTeTg1?=
 =?utf-8?B?YitOVCtEQWlxTGxIN1VpQ1JnOHN2MkVBQU00QndueC9aUExwZ01xY1JoSmVY?=
 =?utf-8?B?bDNEM1hFWDNRbjYrWGRwQ1gySVFlUGZhK1Z1b3laNU14ZVQxZXd2L2VvR3J6?=
 =?utf-8?B?L0ZWYVgzL2lDeTR0UjFzZEZBZEhaQVJTTjhGTGRmVFR5bzQ0azM3b1NmdEYw?=
 =?utf-8?B?Um9jVWVWWWYyS29RcDNld0hmNHF2aWFuVWZKdTRpeVlwTmxrVW1Dc0trOHg2?=
 =?utf-8?B?N2RUWlZ3RDd4VXNaZkRORFRKczFWQ214TVo5UHcrTXp1UkpSN2txQWRpWEZo?=
 =?utf-8?B?RXlCa1dPTWJKVVVIeVpZZ1VVKzZyQVpqblMxQSt3Q2hxS0dLYVlZbCtMS2ZE?=
 =?utf-8?B?eTRxRXczR29GVXhxUTZmYVJPMUhmQ1UrVFN6aW01TG96b2JQRS9DeHNESWhr?=
 =?utf-8?B?cHBsM3E4SG9GOGlhcXBMb0pWNXkxNkRGelI3TFdtWU5ieHUrNmsrNEhnSGRp?=
 =?utf-8?B?cjd4Q1BwYU5nSVdtdTQ5TzRXaEdxZ3JmbU9jelRVQ3l5VFBwU0tPZ2Z0WVVE?=
 =?utf-8?B?OEtpc1NadEZkSWVTL3ZIcGJUakhrUUhCMkpNVkFzT1crTTFqcldjNWkvZjZ2?=
 =?utf-8?B?MDVlYXE1b0VIVlZVTmpERSt4SmwrbjRqek9iUGxKelAvQldDZVpxVWNrcGxY?=
 =?utf-8?B?bHlyQm1LaGxOVDllcmcwbGtqUy9HRHpiUnUzMUJaa1ZXQVJHWkRXR2RjOUM5?=
 =?utf-8?B?U3BVbEozYkxKTDJhMHY0enFjQjZmY1RRalIvU3ptRUQ4OFZTckZxc1JreEtB?=
 =?utf-8?B?bm9NMm1oSkFaK1VKVjFaNjljNlZ0dy9IU2I4bmR4cFR2clZ0alBqMjZxdlNl?=
 =?utf-8?B?TlZXcmd3Tkl6UGE2YmpPTFl6WDNPa3FtKzY0NmFnTFNMdEU3T1dLbGxYNjFI?=
 =?utf-8?B?SlBvZ24zYnJET1F6U1pneURhTHdRazdzb3BPSWxVKzNvTUZEc0ttQmJmSGxM?=
 =?utf-8?B?TW9nQ0o5ZUtWcVVlT1JlallBcG16Tk9kZTlHZWFvV21Dem81SXNzVUdBY1ZV?=
 =?utf-8?B?MVNHOTVMVUJkN0J4ZWVXYlB2RHpFaUdKRVN6alV1NXhmaEpVNXhlS2NDL1My?=
 =?utf-8?B?OGdCang5QmM5RFhwNE5veWhYUXd4YjgySDBZTVBZWE5SS2NZbGoycUlkMUdU?=
 =?utf-8?B?WHJGVUhnVi9UQTloM0RnYWlxM2tiYUM5UUQ0R2lVckpveXFaUWE3MktPTnlm?=
 =?utf-8?B?dXFWdlpzVGRBTjhrYVgzcnlnbVcvektXRkpBS2V1blMrTit2V1ZKMFBpMEk4?=
 =?utf-8?B?TlQ1N044bXo2VXZ4OFYrWXpuclpzbXdlRlpoSWE3NWFlTHNIeFdmUk1qMWRB?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a350d318-701b-4b3c-f207-08dcaaa54936
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 23:23:25.5978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eX9PdaPm0yLdTRFjeGgJWueQ0F/tTAjKLiuC7WIbZMK8QqtFU6/3qS1PnZLN4q6JRrgxcLeuIcDRshmY8OOqQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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

Quoting Lucas De Marchi (2024-07-16 16:54:28-03:00)
>Extract functions to setup the multi-tile mmio space and extension
>space, while better documenting the final memory layout.  No change in
>behavior.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>
>tested only on single-tile platforms for now. It shouldn't change the
>behavior, but it would be good to get some extra testing.
>
> drivers/gpu/drm/xe/xe_mmio.c | 99 ++++++++++++++++++++++++++++--------
> 1 file changed, 77 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index ea3c37d3e13f..31f6703daec2 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -33,29 +33,56 @@ static void tiles_fini(void *arg)
>                 tile->mmio.regs =3D NULL;
> }
>=20
>-int xe_mmio_probe_tiles(struct xe_device *xe)
>+/*
>+ * On multi-tile devices, partition the BAR space for MMIO on each tile,
>+ * possibly accounting for register override on the number of tiles avail=
able.
>+ * Resulting memory layout is like below:
>+ *
>+ * .----------------------. <- tile_count * tile_mmio_size
>+ * |         ....         |
>+ * |----------------------| <- 2 * tile_mmio_size
>+ * |   tile1->mmio.regs   |
>+ * |----------------------| <- 1 * tile_mmio_size
>+ * |   tile0->mmio.regs   |
>+ * '----------------------' <- 0MB
>+ */
>+static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_=
size)
> {
>-        size_t tile_mmio_size =3D SZ_16M, tile_mmio_ext_size =3D xe->info=
.tile_mmio_ext_size;
>-        u8 id, tile_count =3D xe->info.tile_count;
>-        struct xe_gt *gt =3D xe_root_mmio_gt(xe);
>         struct xe_tile *tile;
>         void __iomem *regs;
>-        u32 mtcfg;
>+        u8 id;
>=20
>-        if (tile_count =3D=3D 1)
>-                goto add_mmio_ext;
>+        /*
>+         * Nothing to be done as tile 0 has already been setup earlier wi=
th the
>+         * entire BAR mapped - see xe_mmio_init()
>+         */
>+        if (xe->info.tile_count =3D=3D 1)
>+                return;
>=20
>+        /* Possibly override number of tile based on configuration regist=
er */
>         if (!xe->info.skip_mtcfg) {
>+                struct xe_gt *gt =3D xe_root_mmio_gt(xe);
>+                u8 tile_count =3D xe->info.tile_count;

Useless assignment.

>+                u32 mtcfg;
>+
>+                /*
>+                 * Although the per-tile mmio regs are not yet initialize=
d, this
>+                 * is fine as it's going to the root gt, that's guarantee=
d to be
>+                 * initialized earlier in xe_mmio_init()
>+                 */
>                 mtcfg =3D xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
>                 tile_count =3D REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>+
>                 if (tile_count < xe->info.tile_count) {
>                         drm_info(&xe->drm, "tile_count: %d, reduced_tile_=
count %d\n",
>                                         xe->info.tile_count, tile_count);
>                         xe->info.tile_count =3D tile_count;
>=20
>                         /*
>-                         * FIXME: Needs some work for standalone media, b=
ut should be impossible
>-                         * with multi-tile for now.
>+                         * FIXME: Needs some work for standalone media, b=
ut
>+                         * should be impossible with multi-tile for now:
>+                         * multi-tile platform with standalone media does=
n't
>+                         * exist
>                          */
>                         xe->info.gt_count =3D xe->info.tile_count;
>                 }

Unrelated to this patch, but I suspect this is an odd place to probe the
hardware for title count. We should probably move this logic to a more
suitable place in the future?

With the removal of the useless assignment to tile_count,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>@@ -67,23 +94,51 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>                 tile->mmio.regs =3D regs;
>                 regs +=3D tile_mmio_size;
>         }
>+}
>=20
>-add_mmio_ext:
>-        /*
>-         * By design, there's a contiguous multi-tile MMIO space (16MB ha=
rd coded per tile).
>-         * When supported, there could be an additional contiguous multi-=
tile MMIO extension
>-         * space ON TOP of it, and hence the necessity for distinguished =
MMIO spaces.
>-         */
>-        if (xe->info.has_mmio_ext) {
>-                regs =3D xe->mmio.regs + tile_mmio_size * tile_count;
>+/*
>+ * On top of all the multi-tile MMIO space there can be a platform-depend=
ent
>+ * extension for each tile, resulting in a layout like below:
>+ *
>+ * .----------------------. <- ext_base + tile_count * tile_mmio_ext_size
>+ * |         ....         |
>+ * |----------------------| <- ext_base + 2 * tile_mmio_ext_size
>+ * | tile1->mmio_ext.regs |
>+ * |----------------------| <- ext_base + 1 * tile_mmio_ext_size
>+ * | tile0->mmio_ext.regs |
>+ * |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D| <=
- ext_base =3D tile_count * tile_mmio_size
>+ * |                      |
>+ * |       mmio.regs      |
>+ * |                      |
>+ * '----------------------' <- 0MB
>+ *
>+ * Set up the tile[]->mmio_ext pointers/sizes.
>+ */
>+static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_s=
ize,
>+                                 size_t tile_mmio_ext_size)
>+{
>+        struct xe_tile *tile;
>+        void __iomem *regs;
>+        u8 id;
>=20
>-                for_each_tile(tile, xe, id) {
>-                        tile->mmio_ext.size =3D tile_mmio_ext_size;
>-                        tile->mmio_ext.regs =3D regs;
>+        if (!xe->info.has_mmio_ext)
>+                return;
>=20
>-                        regs +=3D tile_mmio_ext_size;
>-                }
>+        regs =3D xe->mmio.regs + tile_mmio_size * xe->info.tile_count;
>+        for_each_tile(tile, xe, id) {
>+                tile->mmio_ext.size =3D tile_mmio_ext_size;
>+                tile->mmio_ext.regs =3D regs;
>+                regs +=3D tile_mmio_ext_size;
>         }
>+}
>+
>+int xe_mmio_probe_tiles(struct xe_device *xe)
>+{
>+        size_t tile_mmio_size =3D SZ_16M;
>+        size_t tile_mmio_ext_size =3D xe->info.tile_mmio_ext_size;
>+
>+        mmio_multi_tile_setup(xe, tile_mmio_size);
>+        mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>=20
>         return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
> }
>--=20
>2.43.0
>

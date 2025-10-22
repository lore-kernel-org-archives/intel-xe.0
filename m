Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DF7CCD1BE
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 13:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B980010E791;
	Wed, 22 Oct 2025 13:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn4qBWGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCCF10E792
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761139972; x=1792675972;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=wmhr83k4sAyUkdWyfb9fIwrGI3X+oy70uLMycIPevtI=;
 b=dn4qBWGg1JwqAxDQgftfqVZNOBKtmuuFejoFbiDr13Pm07EyJZ4c5Ydj
 PNhSgAt3Q1I42CuLDn5KBhFCIXUh3GhlDS2//sS+QlVoKfGGLdsvLGk2N
 3yZy7XWbbYijK8wGqUYtMvEcOLfcFk7fWLCeeaWxh2dBkSweblyEmHo+J
 G8KGM2vzL5I5QoV1zVSctWaK4M5axxr893NmzUPEW31rvvGjZ0IMNF0ef
 yypRN3i2HnMUfzYMrjD/auUJR27uLE1WLf/NUCivMlNp0+4Nr/4RNHFqu
 OfmqGl9qpdjYgSPQ8edHCxWw4OTh1XLM5qk94WUTXbKluSXDzJf3rCAcc w==;
X-CSE-ConnectionGUID: LcrrtU8USGSuU8DAH0IKyQ==
X-CSE-MsgGUID: 3YhR0Bi8SEuf30yg9vwuuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67123939"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67123939"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:32:52 -0700
X-CSE-ConnectionGUID: fBCGiXV0R4+657eyfWuQqw==
X-CSE-MsgGUID: tJ7tqON4QYOOPX+C/Hc5pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="188280984"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:32:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 06:32:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 06:32:22 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 06:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IakI8+JoO3XeLBPBEmG8MI8lGwUgERZ4wRroFTf7XePFYdrvt9/Wk8PI9YcG4dmTHs5aJqhpdRVTVbnUQ6b5INgv+BNIRELT0bnZUAoKM8IgRzOHWfmx8D0Iegu9bL7a1vCSDgVRtcWg9uJ+Oejny7ZR6+kGDodHo/wSPSCYN4RNqacKfufV41kZFaYGp4FonUIvpYqG1Wdzhz/6InN46+wJWxBDl8eLsjJJorwJ6M0RPBsespFi3mOjmjchK76X1pz+VsDbbNy+fAxyIFYZlmKr4XF1awMBxQYLTRiocG95WSPoXm56ylYfJBwk7nhOBn/uQ60frhFrNPxtEKX0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxjnEMOSUFBPKeushgz9fvWLNJ7P5MeJzvahyYqyOw4=;
 b=YKIyTt2VSfc5424wj81wlxY2C2HgPV9Hh6XpJG/zidmpgdlHDTSxVy5na6sNEJq7jVF0ezXkoB0BgaKDHiB0xfy77691vcVq/zJ5qHrUyc0SWpZSvay7UlMy2/Olc8hMR3iGY8QHZKzSqRrpOyQEH0zXfpVaHGRq4hCkFhAKcHuc233NK73+V0lY/nllHx8ubLjod3+tb6CK5WzHltpoBJoY20p0HeKInCih4lz9LL7gCG2/TU5uY58bJSEBFzt5d2WbbMwjntquzBq+nZFvC2f1kAYpICAUJIepZYJ3gfFOD+EPs825V6ApUbWd+whB2LmA6qJ/DrFvdomYaYlMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:32:09 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:32:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
References: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
Subject: Re: [PATCH v2 0/2] drm/xe: Add kunit checks for dma_mask_size,
 va_bits and vm_max_level
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 22 Oct 2025 10:32:04 -0300
Message-ID: <176113992426.3231.17207183545511853928@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 0513ae81-988e-479c-e25a-08de116f66bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVdVc2ZPMGlEc0J5RHVNTFZGWW1VdXNCUXZ6T1M3R3QzdVk1VDVJVkZCbVd1?=
 =?utf-8?B?R3lidVZLWnRQVzBPTk0rWjZQa28wenlGTVR6aE5Ea1EvMTYzaVR2VW5vZ3Fn?=
 =?utf-8?B?a29oUndDSGRXdENTZHdsSnd2SVVZUzBiT0E0Ym5iY2VUbXVmaDZJUEorUCtj?=
 =?utf-8?B?TllTalE2MXlsciswZGxuU3AyRnVYTkdkcHRmUkEyWWxsRER1UFREbGFvcUM5?=
 =?utf-8?B?cld4RkVtZGNnL3dHK3BJeldlM1dvYlV5eHhQazZVOVB6UFc4TVN6Z20xcHZS?=
 =?utf-8?B?emUvby9KSFFrUnAvMzZQeFRVS0dBYmpYL0R1RXdzOFFzYW5zTktud1h5dlVq?=
 =?utf-8?B?ck5IV0VoZGU3WVJQc3BvdGw1RDVTVzA5Mk5VOXErWEErZnhuNGthNXBCTUtV?=
 =?utf-8?B?YXMyOTFmMmRnd2JqdktCSFMwWmxvOEt4OE1TeHJ0c0lZS2VObytyTHM2NE0w?=
 =?utf-8?B?WU1vRlMxUkZJWmVodzdNT2U2MHZOUitDRjBBK3M4T2NZWnNxQ2kzL0llRmRH?=
 =?utf-8?B?SDl1NU1rR0p6dU16N1FabG5EeDNUY0gyOTQ5SUg4ZlYvZUZNVzBVYTcyajVl?=
 =?utf-8?B?S0pDRDFoZG4rd25DVDZSUEZtZjJrVXg0a0RpcHZCakpDemkvWkNOUnNiZWU5?=
 =?utf-8?B?VlpGVVk1Z0tLZTBGazg2UTUzMDE3aWNPaVNhbjc3YWtCenlEaEVlRzI3M1oz?=
 =?utf-8?B?bllQbkhEQzBzaU5Xc2cxRmZvUW9YNndiVENkK2dtK2MwTnBsb3hxdnpDclB5?=
 =?utf-8?B?aXVSZ2FaMW1KZ05TNytKdmVnd1JHbUI4d3AxVVM2citZSURjaERFUlptUExu?=
 =?utf-8?B?dlorVFlyZDBFUE9lMW53TnlOczNOZ3ptZnRvYTdIUFc2alNseUtaK3FiZks1?=
 =?utf-8?B?N1d4ZlA3U1lGVHdyZXZ4bVBDcFVkZlNOK1huWVlxeUpBYkhWcmVVVUh1VmVl?=
 =?utf-8?B?TDd1WDE0cTQyYitxREd6OUFTUS9vczhzZGxFblE4NkZvcmx6RFRiVXNSbTBS?=
 =?utf-8?B?RzVyUHV1OFVHQ001ZXVDTENmdnVBV1J1dHB0U214WWtCNTRwL25KVDRQTlJE?=
 =?utf-8?B?V2p2cnh6Zm9pODdJNi8rck1OOW0vTUoyWElHQlczTGxQWE1xY2QyVW9aVlpi?=
 =?utf-8?B?UCt3a2R2NEsrVTJ5UHlDOE9qQkhidW5XQlp1MUpsZlJ3QkF4Wkp3OGRHWE1j?=
 =?utf-8?B?eWJGVy9iWDBrL0kwVE93eWRRM3I0ZmFPa09vdGtQT3FldHgyUnZPdGxoeFdj?=
 =?utf-8?B?YmJUK0g2TmFlTUFXNEFBekxwcUtCRStFN05XWTZTMU1ZWnIvUFlmdFQrRmRq?=
 =?utf-8?B?TThoMXU2YndpUUFTblJTdm9zZkQ4TkM0VHpnQ1VKTU5Vd3ZGVmhuc2pUMitx?=
 =?utf-8?B?bHNvcDJQRWNYdXFycWpGTkZNcDF5cUlUUVBwZHBxZFdtdXlHenh5MWtXVXls?=
 =?utf-8?B?eE0rUkMxd2ZJRkx2bGRSb2ZjMHM1Z1FLZERnK05tWVBZVDY0WWpReGt3Z05O?=
 =?utf-8?B?Vm91Uk5NOUsyWDFBNk15NHZjVURsSWttQTZINERtRmJMNDUyeUhHdGM2QnpJ?=
 =?utf-8?B?WUNpNEJnMU4wa0VEZzd5TmZFK3F5LzRvOW5tOWhDVHJqR0p6L25rWG8yL2M4?=
 =?utf-8?B?ODB1WUJaN0QybStmQTlkS2ZjWmF2NmZaK0J5SS9tRUtTbXdCeXk1aVZUL1c5?=
 =?utf-8?B?R2Q3d3M2TytJNTQyeDFaNmorRyt4dDR6WDZEVWV1WFMyYzRHY3BEa255Umg0?=
 =?utf-8?B?dG0wb214QitucUU3VmlMM1kxMjU2WW1GQ3ZRNDRyQTEwYmdLSEJDUXIvdHRM?=
 =?utf-8?B?SGFGRjdMSUkxU3ZnZG5SbytJUmIrM3NsVTdSYWdaQzRPeDVkR0c0c3RaMkJ6?=
 =?utf-8?B?aGJIckY2TG13M3hjRHlVTFVob0xMV1hzK1Vjb1hWaHpkbmpJY0NOQjMxamps?=
 =?utf-8?B?MXBkRWNFKzFOWURmRStLUFl2NkdkeXF2TnNMcEZrc0UzUmxUTitNdGptWDNK?=
 =?utf-8?B?NzJPTDZ1ZDBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXFIUHRBeEtyRm4rV2VLTHBNZUdJOVFLNXRhbHE4VXJBQW5wUURKbmo4SFN3?=
 =?utf-8?B?V0EvM3FuR3NOTDFPVkNyeCtBbk9uQk16bGEwZk9Vc0lpN1NrRXZIV3pSOUly?=
 =?utf-8?B?dUlxR0MzdjZSOVNFL3h1alhtaElhV1R1b3Q3OUp1Mi9DSXVzUGRpazNSUlQ1?=
 =?utf-8?B?aHVuOEpDTFYzTkNHVXFUdG9zcGNmNFhZQkZJMldDbTlGMk0wMU5HcFdNYUtD?=
 =?utf-8?B?MHExblVFczRwRGxQR1IxTTVVTUY0T2p5T2dJcFFkMnUzZlBEZEVmUGxWNzlt?=
 =?utf-8?B?ejh6QjZLTHErSWlIT0RmcSsycXNRdGFjdENJeVFsM25pWU11Sk85YW5oN1l4?=
 =?utf-8?B?SFdsR2NhcWhVMzhhaTlTck4zNnFCdEtwK3RyeWpITnkraExjaFF5d1hvcmdo?=
 =?utf-8?B?eC9oRlhtaUorRExHaXZ2dEk2NTJHOC9ja0dSbEFoVEVta213M1JqSkcvVCtI?=
 =?utf-8?B?SzhGNmxCK21PK1BJcG1QVHFjYS9JOTBFUU1Nd002OGFPcDFESk5BSzVOR0R5?=
 =?utf-8?B?Q1E5a0dQVzl0RnE3K04zU1NnREhsQjJyK2hDSC9GbG0rL1c2Zmx6c2xaYThr?=
 =?utf-8?B?ZFJVZjRLNEJOUkVEVEZpRURqMzh4b3BSVTZCWVkxYVZYR3R1bml4S3hYdkdt?=
 =?utf-8?B?OUcwYThKSHZFbE1ZeXByTFVjYkRlNUxZVjgzbWl3ZEFsNFpSZVVHNGc5TmZq?=
 =?utf-8?B?d1RlV3RQZWJGVmVVVHFjcktOUHNDR2ZoeWdaazRsOVM5K01neXd3QUhpNnlo?=
 =?utf-8?B?Mzk1WDdYYlBrOFVOU1dwWkdjY0FCQ3lQMURNMUgydW0xS2lSVEFOdmNDK0hT?=
 =?utf-8?B?V3ZxTWtqeFNRb0w3OEhEMFYzVDlvSTlLR3prZ1NrTWdqVEh6emwyOFpvdUFq?=
 =?utf-8?B?SjI5amdySlFmajlNK3RBSUVLWXpkc2hEaVVoSTZoQ2lNQUd0YVhEM3NESG1J?=
 =?utf-8?B?QmdwaERydVZ2elhhMDdXZmFTSWdLWXdpTy9ScFdMSFVlWjZsUlBKME1XWlFw?=
 =?utf-8?B?MnNEM1dCT2FmdElKTCtxR3krOFFPV3VZU1Nva1dlYVVTU0pUL1BlTGtkYUoy?=
 =?utf-8?B?WFJpSkpSMm1GS0VzMk9nd0Qrd2p4dFFPSnljQ3ZpejVCd3F2ekM1dGlWL3F1?=
 =?utf-8?B?cjhQRDZuQjFrZTRTSWdyZWRJRVg5OEFVOC9za0JQU2hQanZDR1BySHhkL1Br?=
 =?utf-8?B?eFBOVldlYjc4cm5EeWhtcXpXTU5OVXFCYVJoZGNEMlVPZFlTaDBDTVQrekJw?=
 =?utf-8?B?amhwMjMxSW8vQ2hCYllZNVZKVUtWQnpsSUw3SjZtN2VpanVBd0x4WTFJbkxq?=
 =?utf-8?B?QlpRbkpsUGRwYlRyU0JndiszWnBsdTlNLzBZQVZPZVJST3JldEI5TWJsMnFh?=
 =?utf-8?B?SlJuSjN5SnF5T1BUYUpwSUYrYmRVZjNYL1pSaUJGRDQzL1hjZko2M0VvbmU3?=
 =?utf-8?B?bVlLQUNVRzk5V1ZNN01yMG9CSEs3SXVPRVcybXE5QW4rQlNvTlJqeGk0aklB?=
 =?utf-8?B?RW10Mm9qRzVBNTJIVmZWcVlscW9pZ3RiMDFVVW1QYjV2dDJmL2pjK1A2cmt6?=
 =?utf-8?B?STZUZ1oySDNtRldMQitkNHo0S1R1aFRFR3Z5ZFJRRXFTMGZxK1o1eWxXVjMy?=
 =?utf-8?B?RFlvS2hlcVJHOHdxWVY1YjBzSHN5VUdVQlFSaXJwREJDV2lvNW85Zjl1dEpT?=
 =?utf-8?B?Y20xRXArVDFWWkZxZmtBaHNrcnJ0S1l5NlpmYzdvQ2Q5Ull6K1NkZGhLQnNU?=
 =?utf-8?B?MlZpRHY5RVBCTGZLbEN4cTAxWTBDVHJkVjFQZTROMzJ1ZGdNUU9HS3poZW91?=
 =?utf-8?B?a0dOL3p6VVoyeDFMckNpWUF3Q2VIaTh3b0tFeWdVRFdsaGg5QmNVSHU3Q05a?=
 =?utf-8?B?TXR2aWY5K0dZOGVVRWxRMTZadVpnYllaaWh2MnFLTTJRZ3lsTXFZV2pnbng5?=
 =?utf-8?B?RU9EL2pHTzU5bUFnT3FoYUhRNDF0K2dEN2h6ZjNERGRTSmpUN2dyMHBneGp4?=
 =?utf-8?B?MERxd2dNYjNiL29PTHlmUGY5V3Y5UUUyMHMwTDBkZDF2bFVRbmJuNDRJVWRo?=
 =?utf-8?B?SnlRQlRRMjNsZVZoZWhta3hxckdjbzhjb1R3TWNMcTlUa1RCQW5nTTJKU1h1?=
 =?utf-8?B?d2xKSFNLSDg2Q1Nua3VXWko5b0NXQWk3YkQ1emluMkIvT3BGMXY1V3hsbkla?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0513ae81-988e-479c-e25a-08de116f66bc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 13:32:09.7528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kg5ZbBXL8gU+7d5k6jJDpWi5rhFaBOXg6E+bUNPFa/EUOlMfDEe2w1RZJi6pCFCpsn3enlsgWVbODd6gBOHPxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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

Quoting Gustavo Sousa (2025-10-20 20:45:55-03:00)
>As part of [1], we ended up moving members va_bits and vm_max_level
>(among others) back to struct xe_device_desc. Those two, as well as
>dma_mask_size, are all expected to be non-zero. Let's add checks in our
>kunit code to verify that.
>
>[1] https://lore.kernel.org/all/20251013200944.2499947-25-matthew.d.roper@=
intel.com/T/
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
>Changes in v2:
>- Add tweaks suggested by Michal, please see individual patches for
>  details.
>- Link to v1: https://lore.kernel.org/r/20251016-xe-kunit-dma_mask_size-va=
_bits-vm_max_level-v1-0-d0886d97121d@intel.com
>
>---
>Gustavo Sousa (2):
>      drm/xe/tests/pci: Convert GT count check to general device check
>      drm/xe/tests/pci: Check dma_mask_size, va_bits and vm_max_level

Pushed to drm-xe-next. Thanks Michal and Lucas for the reviews!

--
Gustavo Sousa

>
> drivers/gpu/drm/xe/tests/xe_pci_test.c | 16 +++++++++++-----
> 1 file changed, 11 insertions(+), 5 deletions(-)
>---
>base-commit: bee2d9e4308e4b888e2524014a246793233f75e8
>change-id: 20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-27c61d1349=
84
>
>Best regards,
>-- =20
>Gustavo Sousa <gustavo.sousa@intel.com>
>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8767FC3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 00:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297CD10E14A;
	Thu, 18 Jul 2024 00:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJpWGCdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1CE10E14A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 00:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721261165; x=1752797165;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dS+SLyf+kbW7RU1r+GTd8DLTeJCWVtjiEIqd+xTN7is=;
 b=BJpWGCdQuSb+6OVm8mv2x8J1U4ZriQG+HktXUewfceUjngPgEo+xbuzd
 x1++bQkp9nyhmboQ2H5D/TYHcKOjSEHfYt7+1PXxtOwlj3hdRLslb0J5h
 9hdyrmXvqsINiB6j6QoC+W/JO4MNzJrxZf1/pibFArW4oS6bYZOGEmuam
 pjXkn9er4++9FeRdVOuTOZJzUYfcdBV+JXQKNlyfk5OS9mgPOoRs04ykh
 5/Zz1iNRZezKsa/78ZevLrayNZuUMgJqXbIKQLeUX+T6DRPRCczePtRYK
 p89o/B9JQbSHBx5vMs32s59Re6ukWPWOylsi1ChEvM3fouRqCmzKjcWEJ w==;
X-CSE-ConnectionGUID: /l8butLRTBm11nNb/O9h+Q==
X-CSE-MsgGUID: hrClzk7RSeKGZchL8n7nXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="30185553"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="30185553"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 17:06:04 -0700
X-CSE-ConnectionGUID: ikALU67fSIGgEZAkyw53Hw==
X-CSE-MsgGUID: AdfsDcFZTbmgdqdYfeygaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="55706006"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 17:06:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 17:06:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 17:06:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 17:06:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqEb2ojri0D+36XmEG5LdT8Y80yh+K+XXQQW02gkZ1m0hxj1P4Wp38N01D84vWIOXBfXdGd9T3/WMkukjQG2JLi3rXFcvp1Q0rQTe4w/XZJF56m0gaAm0ti2u0yTkeI323GkC1byI1W/jDvnczCw+vz01rgSrWVrPcDHxtKUvsG4GnHGtABRTL3+wlBk+zqdL9rUJn2r11WW66z+g9h/sSUo5uWlgaaGkDBwdDx81ca+sexyJMSfgTSxKG2vW289ZTWk3tKvpTcwCwzSWggWk5sdcMjcMcA72rN7eauqPdstqZlQMxEVzyTiUfsQPinhpl72mE2MlZ/xk/Q2khM+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZf6fxfKkZ8WkjoIcUl/UykHu/tI/a+b6gycZB0/YMA=;
 b=eR7p1FTmGZOGPZ/oC8cVNWJ7+8Z7hCUdZFUVESGbb0HnCiIadm6qKBWlZD4Yf6cGYwpZ/AVXjMck0hcnK74j7/p47+84eISqxyURChPwfJfzqE8E8VzMO8XbByLFt1ttmMEf0Gvd5SfeaTUJjXmKQBKA0du89d4cVp06K8rMmTMoi8koLYq5adf14RN1Eg+Tyxy6upnX7gWI5eeAR5Vv+uBb8v6kSIfQG9nc2l54hwD80oI9i3Ml3u0BtrOrTPzJLXDwUeeKY9M88wmnynqh9ujkYZR2uQbcGNe/pG6fUbm4oy1CZBFt1agAwyBbwOXJUK1X1Z1V0tw8+z69VQhRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB6718.namprd11.prod.outlook.com (2603:10b6:a03:477::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 00:06:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 00:06:00 +0000
Date: Wed, 17 Jul 2024 17:05:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <akshatajahagirdar6@gmail.com>
Subject: Re: [PATCH v7 0/7] Implement Compression Support on BMG
Message-ID: <20240718000556.GM2905419@mdroper-desk1.amr.corp.intel.com>
References: <cover.1721250309.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1721250309.git.akshata.jahagirdar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB6718:EE_
X-MS-Office365-Filtering-Correlation-Id: 37574bf5-23c6-413f-cd3c-08dca6bd679b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjdqQW5TYllMeEdtWjQ1ZmoxRE5VNWZUVWlSZzlBMCtiWkJzMFc2OW0vMTBC?=
 =?utf-8?B?V0JLaFI1Ulg1K21OZ1VZeFJPVi95Rkh6blZNTi9lUzVCNTAxZzZPKzRoU2N0?=
 =?utf-8?B?SVhjRkh6QmpFMm0zRTMvSDdac2hCMWJoVVg2MENjUTBqZ0VxTEFPa1ZRN2o3?=
 =?utf-8?B?dG4walVHZTZmMmRIUDludzJ5cUNnUG5kZm5JWVg0dmo4dHQ3ZFF2RnJybGV6?=
 =?utf-8?B?dCtlWXVkaEYyUXlYSHZvekhEVzMzSzJlSXUyZHhvZ2V1WHI4K0M4QVNiVWR5?=
 =?utf-8?B?UUJFb25ZMFRxR0loNmFOaTBDOWxneVRvaWRZc1g3WGVoNkx6aG5lY054THVn?=
 =?utf-8?B?am9rNlJuQ3J6dWE3N2hvczB2aFJlZ3BUNVlPY3hHYUgrSmFrYlI5b0NkUGpn?=
 =?utf-8?B?UTE4MURrcG9ZUGZ2c3dQRkU1RXA4T2dZVmNpYlZaUWY5S0JaRGhEdmFncTNt?=
 =?utf-8?B?Q0E0NzAvOEloWmlDejRFVzFjUUxaZk5ONENoa1RSY0hOeEdodG1Sd2FuMGxz?=
 =?utf-8?B?blJFenFraDE2eFB6TkJVQlJVdzdLeCtiRVozMUtML0J4WW1jZ1hPZ1Rjc1Av?=
 =?utf-8?B?eXk1U0tjTlZXdVNXU2RFYy8wYmhIenFXMkVOa1ZLSDdYZnVwbGcvbDdUdk5v?=
 =?utf-8?B?TytBVThnOE1FUmtNc1J3ZmZLcUI1YXhWQ0pyalZXWWFRSGpjMWFySlk5YUJV?=
 =?utf-8?B?NDEzMVBwV3U0MjJ5UFpkUUx6anRNZ3NTZUl6NmRpYUJ5TU53WE85c2FYNk1y?=
 =?utf-8?B?NjBZRHpkR214cnhZUjY3Ny9WUEFBQlJlNW94T09ESXpOYVUxN2tvdVlldStn?=
 =?utf-8?B?NkExNG1aV3Vwc1JGTGpodmppd3pWUmtreGRQaU9oOCs1T3kwTENiazVXM1p2?=
 =?utf-8?B?MFJDTVFhRm53M1kzZlV6QlNhQUxrZExMMnZLSmYwYmprTUJTNmN1WWN2bzJ1?=
 =?utf-8?B?VUNZaUk0Mmc1QXAyV2p2QzBIajdtSFU3VlhOVi8weXVkYndnK0xCZEFaOTRt?=
 =?utf-8?B?dWlPUlZIUVJaNjNOdVJKeW9EaGVHR3hGdWVvNTVJcVU0MUVFa0djVzNWTWFy?=
 =?utf-8?B?Znk5V2IyRDJkVW5FMFNMR3ZmRzJSR2xIczhOcVhoRnpmWFpnRWlnUmJOQlRC?=
 =?utf-8?B?MFdaUXZIVGNQUjR5a2YrdFhzalFwb25pN1psNDU1eHlZeG4zSkRsdW9QWXNn?=
 =?utf-8?B?dUxOY1VVZ1p4b2FMVVU0VCtVQ2YyZnlCM0dkeUNtOTRaUUFpRlkzeG9NdU1D?=
 =?utf-8?B?a3RPaXB2Z0FxN2lQTlV6dzRHKzExK2J6K294UFIxa0ZId2Z1S21MQTk2TXpL?=
 =?utf-8?B?dEJsYUpqUzBwSXhMa1JOU2NmV01PdTJBUkNnUzdITll3bmdDWjZIL1h2VGQ4?=
 =?utf-8?B?S2lPazZtQitwbXhjdGFJKzdQMVVnb1J5ZEpxR1NmVU50Y3pVL2t3RSt1WXFQ?=
 =?utf-8?B?MmFwVUZmYnRPV0JDaHFFeENQUGM5NXZNZUQ4aXR4SnNqL3V1T2dxTHE0d0ZK?=
 =?utf-8?B?Z1VZNnR6ZjRPTTI3TVh1cnEvWnAxd3Q2a1JHSVVKd21JYjg1cFRMTllpV2Rh?=
 =?utf-8?B?NVZDcTBrOGVONU91V0N5ekJlaEtLRjlYN1BMc1dGOHV4NlBMc0RtU0NaMDV2?=
 =?utf-8?B?UzVuZzlYWEdZd09yUWRXY0JJY2JPNDBtUG5LU2V3QlZiMSttMVppZjFLV2hW?=
 =?utf-8?B?MG9wMzRDVTQ5alhVNzJoZC9oMUNOWUNwRDRXTHVndmdBR0tUMWpRRzcwdC90?=
 =?utf-8?B?WUUwZFRHQTBwcmhuNmVHNVRyVGU0Mk5pSWRBWVdhazlub2hjWEZYSGZsN2Q3?=
 =?utf-8?B?bUNZUUdXWko0aXAwblRyQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWl3Z0JkRjE5YXlDVkZpVDVqZjZybmFxVGF4OGpnOHQ4L05OUUJzK0pER0p6?=
 =?utf-8?B?dVFNMUt2dVZGMnJxK3c2a1BCRlhselZST3FTOGxIUk83SHp0eVVQMDFHOEsr?=
 =?utf-8?B?WHBmNllSNUxNL2NaeVRGZ1VZRzdHSEU5QUhGN05NOEt2SkdaaVFvS2FZajlP?=
 =?utf-8?B?MW04MXJBVEdTbENvWmJoZjZZT2xlVlMwNCszNUhPTkswOHVEZi9HRDF5bjc4?=
 =?utf-8?B?VzMxWURpMDlpME1GZktmVzRJV1hRdVh6VEtvVEFiNFdLL1o5bUt2eklHS0tE?=
 =?utf-8?B?N3B3bTJjMnZMQWJuOTI1MmpzaUNHNk00Z25oRnBjajFaTmtRNWgzV3BaL3F1?=
 =?utf-8?B?dU9tSy9KdDVTdjJRTklRWWY2elB1M3NTM2lkWkwwdTVuNEJSTmJrWTRtQk5T?=
 =?utf-8?B?VktHQ3U1OXh2cDl5SmtLQm9vN0YyVmdCa01NUThFWWhwdUk2Y21FZi8xL3JF?=
 =?utf-8?B?TGsvUURRNmwzRlkyWlNwK1lWRFRZd1RjNkNPZHdJRi9sblhVRnF4cTBCMnBG?=
 =?utf-8?B?ZGcxaGIzdjR5bDVvNzJGaEFzZWVQdmZ3TWRXdEhZNzZMS2ZOTXdWNTNTZG0r?=
 =?utf-8?B?RUl1SzZPbDl0RTlLOXhDUXp4b2FIa0VlVSs1TUlRQTE0d1h4QzBSbU9qOW5D?=
 =?utf-8?B?MkV5V2dwbTFhbC9YVjlZOTkza2VEN25pTW5FRXU3N0xmdjR1cHlrVUg4cXdX?=
 =?utf-8?B?eUNsS1k5L05XQlVGRjBGWHIrOEo1eS9QRFE5ODVXdWZUQjA5Si9TYlBRVGsz?=
 =?utf-8?B?U3UzM01IeGpYcE5QLzhHcTUwMEFWVTErQ2JBR2JRUlZEc1RwU092TGlrRTlm?=
 =?utf-8?B?SmhQTkw4N1BSY3FidGlXWC9RNHZscFExQXRROGYzKzZ3cXdhUHRjOXNxSXBS?=
 =?utf-8?B?WlN2Q1RQdGpveGxmSGNCWUIzVU0rWW03Ni9ZSEx6V1AyOWxoU3NCZThQTUJy?=
 =?utf-8?B?akEwK0RsYk1JMU83R28rOVVBSHBpSWw4emVjZEcyalpmM21ENVFwYTJrQXBy?=
 =?utf-8?B?VHQ2WWhwQS9LMTRQK3VVNTg4Y2w5SHVJMHBhQ3lic2FPeDB2cGFTWlZCdWc0?=
 =?utf-8?B?eFEyOTQ4K3diWVBldTRON241QjhISEd0UFZDa0FmYVBWTkx1d0R0amFVQWdp?=
 =?utf-8?B?Mk5ZWG9nU3NtTll2d1lMQzlDTGxuSXVpSjBLQ3NvMHBxWGFhSHhLM2IySkRL?=
 =?utf-8?B?VjBjeXVoejM1WE9ZMzBDUEhyOG1lajRqcjNTL250VVJJL1FncWhaWkpVZFZF?=
 =?utf-8?B?NURDWVFtalB4Z2xIdmpyMlRWRktNN1lqYkhkeVdzZ0xSNWtCeUFPTU1qT1Z3?=
 =?utf-8?B?VUQySmU3QTJKVUQxVGRlNHZwOWVvbnU3djRPNFFCa0lETS9UVDhUMUF2K1JW?=
 =?utf-8?B?d1lMeUVzSHdWQ0wvSWgzbERSeFFOWTZTTkxSWWVYT05aNEQwUHc1WnMwcnow?=
 =?utf-8?B?N0tLdHFIdU5RVXM2NCtPUGFGM09hTkRtQmdVTlVQWENyRVpFUDhBc0ViV0xs?=
 =?utf-8?B?VitCOFlKVlZITG5oZUZVY1duYnVTdzdTQmlabDBENG1Va1VvOEs0RWdnVWds?=
 =?utf-8?B?S3FWTWZqR3JYdVRjVWd3R3FWdUtURWJ4dGJHSkZCQ05kMHNFanhVQlRybHVv?=
 =?utf-8?B?SWlYcC8wdjkxYUdvYlRnMkRRUkRMalh0NExmN2ZDaFAvcEY5Q0VDQkxMTzZN?=
 =?utf-8?B?RVd5V2l2WnhyUzA2UGxaWTNaRmlraUhxaHlJcEVzU29hZmVUbmNLZU02elRS?=
 =?utf-8?B?TFV1YkdmUUlFOHNMdkdYcVpaaUsxbk5JNGZaV01hTVdZYkRjN2U1VGpsNCt4?=
 =?utf-8?B?bDR6WVlLWXljN1M3eTZQcWwyTUE0SFlER3U1akp1aWRYay9Edm80TUR1dEJJ?=
 =?utf-8?B?bCtQQTUwVTdUR05oeVZCbFJQanFCckVPV2VFbXVlUmk3cU1saGE1UTloS1JD?=
 =?utf-8?B?cUluSWxRNk9qNnVpZmQ4Mnc2dE9KS1FoT0JTUFk0WFJiNGhZSmpWeU9NWk5X?=
 =?utf-8?B?eXZnUCtYWUduZXR0UVhlWWkwMkY3bUYzRlVpdWo1VGJ2RnRvdmdWd20vYy9y?=
 =?utf-8?B?VHdKREphUXhlTlBieVQwNk5acGJOdWVZc3dFaUo5WUtGSG1qVHUwaklIU2lW?=
 =?utf-8?B?MlZkS2xuTEx4UTZnRVNoeTVpcnF2aS84VGppcWtucTdVdjJWSFRxeGU0MFRX?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37574bf5-23c6-413f-cd3c-08dca6bd679b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 00:05:59.8220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fVMPuJehCS3H9epGzIilT2EIq275krXnWlV5dvDFYXhgfBlQNYvixxXMVvsdHitG93tAt0eGPyY4M5VN2L04cWpgKgHo+efrmqUhnIPJCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6718
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

On Wed, Jul 17, 2024 at 09:10:01PM +0000, Akshata Jahagirdar wrote:
> Xe2+ has unified compression (exactly one compression mode/format),
> where compression is now controlled via PAT at PTE level.
> This simplifies KMD operations, as it can now decompress freely
> without concern for the buffer's original compression format—unlike DG2,
> which had multiple compression formats and thus required copying the
> raw CCS state during VRAM eviction. In addition mixed VRAM and system
> memory buffers were not supported with compression enabled.
> 
> On Xe2 dGPU compression is still only supported with VRAM, however we
> can now support compression with VRAM and system memory buffers,
> with GPU access being seamless underneath. So long as when doing
> VRAM -> system memory the KMD uses compressed -> uncompressed,
> to decompress it. This also allows CPU access to such buffers,
> assuming that userspace first decompress the corresponding
> pages being accessed.
> If the pages are already in system memory then KMD would have already
> decompressed them. When restoring such buffers with sysmem -> VRAM
> the KMD can't easily know which pages were originally compressed,
> so we always use uncompressed -> uncompressed here.
> With this it also means we can drop all the raw CCS handling on such
> platforms (including needing to allocate extra CCS storage).
> 
> In order to support this we now need to have two different identity
> mappings for compressed and uncompressed VRAM.
> In this patch, we set up the additional identity map for the VRAM with
> compressed pat_index. We then select the appropriate mapping during
> migration/clear. During eviction (vram->sysmem), we use the mapping
> from compressed -> uncompressed. During restore (sysmem->vram), we need
> the mapping from uncompressed -> uncompressed.
> Therefore, we need to have two different mappings for compressed and
> uncompressed vram. We set up an additional identity map for the vram
> with compressed pat_index.
> We then select the appropriate mapping during migration/clear.
> 
> Akshata Jahagirdar (7):
>   drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
>   drm/xe/migrate: Add kunit to test clear functionality
>   drm/xe/migrate: Add helper function to program identity map
>   drm/xe/xe2: Introduce identity map for compressed pat for vram
>   drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
>   drm/xe/migrate: Add kunit to test migration functionality for BMG
>   drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

Applied to drm-xe-next.  Thanks for the patches and reviews.


Matt

> 
>  drivers/gpu/drm/xe/tests/xe_bo.c      |   6 +
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 399 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.c       | 185 +++++++-----
>  3 files changed, 524 insertions(+), 66 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

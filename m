Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0575CCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 08:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A9810E383;
	Mon,  3 Nov 2025 08:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gD1Q/PFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3874110E383
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 08:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762157118; x=1793693118;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iMvcENe4ca3+UdAD/ByVPuOPTtzdM+ZtKCxBiZH9+t0=;
 b=gD1Q/PFp7qgSQd3MYpoGciAZ2fjho+mVOCqWL669a+oMXtKH6b2rFXXe
 lot3vzPo7qflVLD8o1QIuOX/mpUL7UWIzGOpvGEbOfL/HLYhvimX0RkQJ
 2XtDFR0PRI+k2RymLoVKC7lwjPgXF8EHIcuXFvnpQONm03JF9+tqfSvI4
 c3YsLJHeDR0BzqBKKp8UhU4wfMj/9GxBeYlTIdiumbVQsJYtlRN8AeTjb
 dNHKGjAE3dDxLuuPDHwy6FNdjl1sxeFfoHIEn+va6ZRAiiD+S+UAn1npp
 T/ZfFSWW4TbcUvsZFEBSBmKURKWRyFHsRXb51iuJiQa42s7VW5raei2t2 w==;
X-CSE-ConnectionGUID: rDQvni/lR2qjEE9FfsV93g==
X-CSE-MsgGUID: BO1squVZQoKJoYfkgXQpzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75337422"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="75337422"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 00:05:18 -0800
X-CSE-ConnectionGUID: JS5qBMUERE2vrR4IpcxehQ==
X-CSE-MsgGUID: 7lrOUrPHTSGd8pkPvYRH9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186042404"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 00:05:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 00:05:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 00:05:17 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 00:05:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzF9aqQkszfbNnVGeeDoW+0Ysv5CT78YnUl/3vgsDsYCBbX0ltOzkeHEutR0OZy6Z6yr88DzIO6s5lYDdc2AZj/MtChlZkJdjhQzfC3gRsPlOKkLlEpqLlMrOdHyvx8yexvLBdltNFjE1wYQSwvGW3HDfsbFi6yGuCHKrxJ0SV9VBJeoy/QRrIALfB6TabVpOZpvSKu6J/bHxEmm73i8adJxJ4HtW9kwDPwo2hPb8W3wQoXRLSFlyWaOA5fCmMszKn8Kbf4zPNsQjJ1xB/+ov7j9M62y0hfr1iO209e1jDp3SRu2G2E62jhfzKXss9+TXiyctwfItDLyWxRHtpak8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouG00RgySwaYRdYTO/cDG3B6stvuMj7HL04+bIOmEC8=;
 b=YGCwBLtbEMX9TMuVQnJjuQ0cdJCqNGwDk0R1RZ3bWm/+v3MhwLoZM6LnjpontI2JLcVrCQGJEXwC6mgqAJj6eTy8xhEy1yD4KyVDCSWT9el7ptZXf1MN6fs9oKaFP08OQwrvxwxDsOhy1b/ptuyUipqI/cHsuvb0EB4k+5w3CKgplEJCaLCox7sZCkZHua1zewzxM3OadhFp3mCvheer0ev/6KSILo0xwjALISG8BrzWBnK0zt3F7EXlXTsBTWZfFuER6yfb49OAY3De5ezqUIX9MYrbuFgviHBSbujrAzoBBBFlM4zOxf+KQ1sExIV53aXbEgKIf+d6ROrAGVkoXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 08:05:15 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 08:05:15 +0000
Message-ID: <149be14a-1da1-4f43-9b0d-7c38feb0b01a@intel.com>
Date: Mon, 3 Nov 2025 13:35:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_survivability: Add support for survivability
 mode v2
From: Riana Tauro <riana.tauro@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Scarbrough, Frank"
 <frank.scarbrough@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, Raag Jadav <raag.jadav@intel.com>
References: <20251014053257.3417575-2-riana.tauro@intel.com>
 <aPFE4hIJKUKh1pjz@intel.com> <b02685b2-5e50-495d-8ddb-00acffd8f8c5@intel.com>
Content-Language: en-US
In-Reply-To: <b02685b2-5e50-495d-8ddb-00acffd8f8c5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|PH0PR11MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f58566-bc37-4fae-3ca0-08de1aafb834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmhGVkdKUGY5WTJDdmtEVWF6emNLZkM2TWxaMkFIY29uU3R4Tlc4c2dRcWdY?=
 =?utf-8?B?QW5ZMDFvd2UrTFFtNmowTkdXQVUrOCtKQlA0bnNYU0FiTkpOUFVxRjVBU1RC?=
 =?utf-8?B?MytINUJmekNscDYrb2dkdHVuWWhkVHJhSDJNN2lMbG1NVkdPUlVMemIvN2Rn?=
 =?utf-8?B?aVlzMzR6SERZekFOd2dRTy83bHROQUZrVjFvandITjdiakFOc01DY2pYVVJ5?=
 =?utf-8?B?TzhNWFZlRStyZXRwWDdmTDN1eDZCZkpyREg5eHVqT1dta3pBUUxOQzZweWkx?=
 =?utf-8?B?c0RsYzdHMUpjVTd2RkFaczNXZ2xJNU9BVnVpZ3YzUGo5N1d2U015VXFmZ01s?=
 =?utf-8?B?dVRvYmtNRm1Bb0NhVVA3SWlRT3RJNno1Y1plN0NWZi9CaWFqSzg1amkwUmVi?=
 =?utf-8?B?WCtROTE0ZVd6VDg0VVpHRkl5Nnd3dm1aekFtZU85RitYVTRKczYxZXhxcDY3?=
 =?utf-8?B?MHNkWUplU1UyWlFXcHFaaHZ3MERWNER0RHk5RVptUGVNUFNqdDdtKzRRZ1Rm?=
 =?utf-8?B?ejRwamVjWVVQcVBOZ1UrZDRXZDhEZHlkbWRzVkxaSzNSSDduY2l4YzdQU0VY?=
 =?utf-8?B?c1k5UVY0QlJhL3BXdXlaSUUrV2lmcGhYQnFrc0IwcXA3Z01za1paTkUxWGN5?=
 =?utf-8?B?N2FqUTk0cVMzSUNRMVJkNGpJU2J5T0s3NDduV2R6YTRaRzdZelBoUWhvSzRM?=
 =?utf-8?B?bktJZjRlNjdEVTFlYXZtbWRMUXhPZkNwUittTDNjL2lmQ1c4Q0tWbklTNW9W?=
 =?utf-8?B?R1BHd2RRRitEdHFGV29JRGJXOU80MDZTZm9ubjZtZy8zangrNUx3ZGRuQUVn?=
 =?utf-8?B?VTJTTXpkYTZveFBGSzRPK1VnUGZNMXhYaitxaDlWU3Y5MGZ3MmUweXpBeWdQ?=
 =?utf-8?B?WXV6N1pLZ0ZpamYzTDZLZXU2a2k4OHpyKzFQVWYxQnhBeVY3Y1ZjODh2QW1s?=
 =?utf-8?B?MHpxTW5XS0w0SVFwY2hldnlyOXZzOWRSd3plQnhSVmhiV2VUSTAxMUczZ2RD?=
 =?utf-8?B?MHk5Rm9XQ0d0Qk00aVo3b2U5QmpHT1dFZ0JQNm5rNUJBemZ2SCttWjR3NlIv?=
 =?utf-8?B?ODc1SXRkeVhCNjFiMHpCK3pvckpVUGRCNWMyc3lQVFFNMHVUU1FMOTlrSGtY?=
 =?utf-8?B?bnhoQVZJUnpqMGJuMS9VbkxwM2UwNXdTMEVselNWckJ3a3lmaTg3aVd5Y1pR?=
 =?utf-8?B?WE9Jck1TSE0wN280R3A1dU53ZCt4cFhKMWVtMDcwZnZHUnltY3YwTno4WHdW?=
 =?utf-8?B?NkZER0NMZXhleDB4dVhzbmR2dmlUQXpad3Y2VzFZMUgzeXYrYjg1Ynp1c1Vp?=
 =?utf-8?B?RmF2NDltL0xqSXRoRVU0Z05UbHB3dm5tVmtLK0RNdHVZdWhrN0d3YjdWTm8r?=
 =?utf-8?B?dVVjTitZdXhKMTdBelpqcnJsWE9VSXZMWTJqclFrOHY2Q2NqMFVpSXZBa1Jl?=
 =?utf-8?B?a2dCZnZGZlVTMm1Hc1IzeUNKQlJldlJuUEVLODNlM2QwbFZ2UmZZVjR4MnI3?=
 =?utf-8?B?VGxZckpZVTNEcDArN2FSczRKMjlMU1ByTUF2TUhhaHY4L3UxNXJIVEcwcjI0?=
 =?utf-8?B?MEY4RFdDZkFHRFFnS1B5K0ZLbkZPZWE1dm5KSXpwVVhxU3dNZXZ2akNUYlpB?=
 =?utf-8?B?UVlFUThyTzZMQm9GSldmWDYxVEcxKzZzUEV1V0cvZFl0L09mb2FtVUU2Wm9O?=
 =?utf-8?B?MG1vcVA0MDU3WkVmVkJTSFIyQ0N1U0xwRXpHVlBmSGdjeHVIRUlMc0dtY3pE?=
 =?utf-8?B?ay9vWWFVZE5SWGN2alMzNkhVL2pzNkcxdzYwaThRaEdNeG9jd0pvbFZBRFAw?=
 =?utf-8?B?N0RaaDRKTHQ2TmlUUXVOY1poNTAyUWZnc3BiNklMa21iUXJRSGFybExIY1kz?=
 =?utf-8?B?dURZZzNmTE0vZDZhSlA1U1lXWXdYTzdlT0tJZzJwNmxueDJCMk9HYmcyR3J3?=
 =?utf-8?B?c1lZNUJ4Z1RZdm5GbWpySzJudG5EWGR3THMwWllEdDY1dFdXVzRXQzBIanVP?=
 =?utf-8?B?QW1GSWxRZndRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEJXdHhwNkJieEUrUDF0SW9mMmJTUGdyenN2d0N2NU0xTE9xcTFEOXBmYVpQ?=
 =?utf-8?B?TlQvWE1tRkQ4VmFQOEcvKzNMRmdTRWhrY0QyaGlhQVluUS9hYlJyWTVpZHM0?=
 =?utf-8?B?VnVOYnlrd3BHUE02R0VsajBHMnEzWnZsWldWSGExTnFGSWhhczhVRjUyOVNV?=
 =?utf-8?B?MlREUW51STJ0Wi9DTDNhWkxPalZGdFEzTEZPSU5id0FhLy9mUHRWakVMT0tl?=
 =?utf-8?B?NDNKVlVWZ3plYnJYTk42Z1FKT1ZXLzNnRzZsaG9LdDlTWGoyNmUwMnVCVHhN?=
 =?utf-8?B?dlQrZzAxeEMvVDNEdWVaM1pWU00wVXA1NVNETUlpN1hOaitQM0R6Nm9HY01K?=
 =?utf-8?B?YS82LzJlL2dXK01LdzJvQ0RNT1JNSG1GSkRxRUYwczBhdnkrTEk2K0dybllU?=
 =?utf-8?B?cFRvZjJVQ0pLVEdnME1QaDloZnJnay9SWWhpWEhKU3AyVVlpK05nZ2tNZ0pk?=
 =?utf-8?B?VXlTaTcxYUpqcEhnN1pLZ2NpazgrKzNTQ2poajlnWnVQci8rVTNtdmQ5Tllq?=
 =?utf-8?B?OGxPcndoaDViRHR2T2pYT3hBNTB6T1VCRHo4b3FtMGRiQVpnV0cxd1UxN1d3?=
 =?utf-8?B?UTFscmVUamlFMmFEM1JYUVE0VUxnd0tzSUlGY29VcjZra014eGZqZ0lQaEtv?=
 =?utf-8?B?NnlIN1pEYmw1b0ZpWVZXSDhsN0lYQmJld3B5MWhET3hqNjErbFZHSUZGbGJr?=
 =?utf-8?B?U2d0M2Nka21sa0lSOXRNeW4vbGtBb1U4K3hsUnBEZXBHbnAxbEVjNHlOc2tZ?=
 =?utf-8?B?T0Vra3lsVXd3MlBpMm1jdEk0NFBHeFE5TWF3WmtpaTRSMkxVSmt5T253bGls?=
 =?utf-8?B?Q09Pa242SE4wT0FsME1YdXFBc3F0K0dmYlMwWGVOb1BjSlNUOElhS25Sa0lR?=
 =?utf-8?B?UUJDdk1GTWt4OWYvdkgxYkhqNXkvRWI2R0s2c3QyM0JpZUY2VWVvMlBTUVBa?=
 =?utf-8?B?c1MvUWtEUWVUdFJNNDkxODEzVVF5OVp0b2tQaVJRN0RRdFRlSEFWTFRpYlBT?=
 =?utf-8?B?NVhkZGJZRFZHUGhxcTZUVGZ1Qjhzai9VVmRlOGlVTmwzckZEOTNXMEpzZE1Z?=
 =?utf-8?B?RDNmaG13NWt0b1puWXZSTWtrRGFZZzVhOVBndnhzN014UW1DZzh1V2IvTUg4?=
 =?utf-8?B?Szl1NVA3MkVZRmtOKzR1MmJuTk1RWmVqYzVCQ01UeXJqZjl2VEFMd0tpNU91?=
 =?utf-8?B?c3pyNlJCOElzallKNGpKYXBkcTF2YkZoQVV5d0RzTG8zeVNyamxlRmI1a1pz?=
 =?utf-8?B?STRvemJuRmsrWTZ6QXdjWnJ0M1MxNC9vbS9pYVMxd0Vaelc0b2dLaURQRzFU?=
 =?utf-8?B?eGp6QWJndUFXNmtDdmxKS1FGWkl6aHpJa1MzVGtEa2pRZ3VsWjIxTHgzTkY5?=
 =?utf-8?B?Umo5YU52NXErZVNzWWEzazJyV1NXRmZUS3BOUGlJTVdiUXVmVU45Rml4Z2JE?=
 =?utf-8?B?eE9WTFBvZ0oxYVBXN2NheExPOWRHTjJjR1JLYmpqQStUN0Eyc3hGem9iWmVv?=
 =?utf-8?B?ZkRUbFV2WXpDUXFiclVZeXNWQTUxdWRaVE9OM1dpNWZteWtHUHhpRjBYck94?=
 =?utf-8?B?aVFDY1ltdmdBS3laWmpCNS81MFMwSmoxOFhodTB3bTlJZHNBZW5maWpDNndM?=
 =?utf-8?B?dGhEYzdZNlZQWklIOGo2YXh5b3Q0cTUzaWQ3UzU4Ylo4ZjhUUjVjcXhvRDdy?=
 =?utf-8?B?TmpVQzJCMmhxdFNXSWNmYlRNeVArLzBTTVZsdWlPZnFPbjhFdjU2WHliMVNI?=
 =?utf-8?B?di9BdlRybk1xMXBDZmxQMzdwOTF4NTBBd3ZMWGZWQ0JIWGR5ekMreFFicEJX?=
 =?utf-8?B?c2x1NVhRTUk0ZEVZOGNhbHFKNW45T3ZqRXFuUzE4ZmptTjVickppb3I2RTBs?=
 =?utf-8?B?RERiUmJsUnVrZ2lTQWV5VUJjWU5XQ012OVlTajErZ01CcVhJZmJGazFvQTN6?=
 =?utf-8?B?ZTQ2ek80aWlkSkE0WGcxR0dPSit4M3Nka1FPeGZEM3BKQmVFemt5aUNBTU5K?=
 =?utf-8?B?dUZkc3NmNHE2L2hQdzFlKy9XVkIyRUN5OGgrdm9MaHBrTi82Ui8reWVWTzVW?=
 =?utf-8?B?OG9nRURQd0RaR1dvM28weENHM3lRYk5ZT21oM1ovZmo5YjE1QXJqYVJHajhR?=
 =?utf-8?Q?n+vgNRloqGk0pndTy/uGuVMDN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f58566-bc37-4fae-3ca0-08de1aafb834
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:05:15.6068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v39LblBHfJvbs3vi6wP03Nb4cieywiE1VnAE+o2puTgbnI3p8Ms9XMr5ufSxkQh2ufI9qKJZc1T6cdaycMqG+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4904
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

Hi Rodrigo

On 10/22/2025 6:08 PM, Riana Tauro wrote:
> Hi Rodrigo
> 
> On 10/17/2025 12:47 AM, Rodrigo Vivi wrote:
>> On Tue, Oct 14, 2025 at 11:02:58AM +0530, Riana Tauro wrote:
>>> v2 survivability breadcrumbs introduces a new mode called
>>> SPI Flash Descriptor Override mode (FDO). This is enabled by
>>> PCODE when MEI itself fails and firmware cannot be updated via
>>> MEI using igsc. This mode provides the ability to update
>>> the firmware directly via SPI driver.
>>>
>>> Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>>>
>>> Userspace should check FDO mode entry in survivability sysfs before
>>> using the SPI driver to update firmware.
>>>
>>> v2 also supports survivability mode for critical boot errors.
>>>
>>>     cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
>>>
>>>                 Capability Info: 0x138320 - 0x2001ae06
>>>                 Postcode Info: 0x138324 - 0x0
>>>                 Overflow Info: 0x138328 - 0x0
>>>                 Auxiliary Info 0: 0x13832c - 0x0
>>
>> I am truly sorry here, but although I was the one that designed this,
>> looking it now, I realized that this is breaking the sysfs rules
>> of one value per file and no fancy format. This is only allowed in
>> the debugfs.
> 
> Just found the link regarding the "one value per file". When i had tried 
> this i found few sysfs having this format, so used the same.
> 
>>
>> We need to change this asap, and with help from any tool that
>> might be already consuming this.
>>
>>>                 FDO Mode: enabled
>>
>> After we fix that we can come and add this.
>>
>> About our options: I don't believe that debugfs is an option
>> without the drm card right?
> 
> No debugfs will not work here. And changing the path now will break
> any tool using it.
> 
>>
>> Perhaps what we need is to transform survivability_mode in
>> the directory. Each entry becomes a file in this directory.
> 
> Since tools check for presence of survivability_mode file. We
> can try this. Will check and respond


fwupd tool currently reads the file for runtime survivability (though 
the file has only type). Changing this would break the previous versions 
of fwupd

https://github.com/fwupd/fwupd/blob/66a0e5cc13b2f9b1391d84186bd6274cc9971299/plugins/intel-gsc/fu-igsc-device.c#L397

@Frank, is it okay if we change the directory structure now?

Or else can we have two sysfs entries.?

1) survivability_mode - boolean to indicate if device is in 
survivability mode or type of survivability mode

2) survivability info for all the other details?

/sys/bus/pci/devices/0000:03:00.0/survivability_info/
├── aux_info
│   ├── aux_info0
│   ├── aux_info1
│   ├── aux_info2
│   ├── aux_info3
│   └── aux_info4
├── capability_info
├── postcode_info
├── postcode_overflow_info

Thanks
Riana
> 
> Thanks
> Riana
> 
>>
>> Sorry,
>> Rodrigo.
>>
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pcode_api.h             |  2 ++
>>>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 32 +++++++++++++++++--
>>>   .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 ++++
>>>   3 files changed, 38 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/ 
>>> xe_pcode_api.h
>>> index 92bfcba51e19..d41f07f9194d 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> @@ -77,11 +77,13 @@
>>>   #define PCODE_SCRATCH(x)        XE_REG(0x138320 + ((x) * 4))
>>>   /* PCODE_SCRATCH0 */
>>> +#define   BREADCRUMB_VERSION        REG_GENMASK(31, 29)
>>>   #define   AUXINFO_REG_OFFSET        REG_GENMASK(17, 15)
>>>   #define   OVERFLOW_REG_OFFSET        REG_GENMASK(14, 12)
>>>   #define   HISTORY_TRACKING        REG_BIT(11)
>>>   #define   OVERFLOW_SUPPORT        REG_BIT(10)
>>>   #define   AUXINFO_SUPPORT        REG_BIT(9)
>>> +#define   FDO_MODE            REG_BIT(4)
>>>   #define   BOOT_STATUS            REG_GENMASK(3, 1)
>>>   #define      CRITICAL_FAILURE        4
>>>   #define      NON_CRITICAL_FAILURE    7
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/ 
>>> gpu/drm/xe/xe_survivability_mode.c
>>> index 1662bfddd4bc..1c9421651548 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -16,6 +16,7 @@
>>>   #include "xe_heci_gsc.h"
>>>   #include "xe_i2c.h"
>>>   #include "xe_mmio.h"
>>> +#include "xe_nvm.h"
>>>   #include "xe_pcode_api.h"
>>>   #include "xe_vsec.h"
>>> @@ -61,6 +62,12 @@
>>>    *    Provides history of previous failures
>>>    * Auxiliary Information
>>>    *    Certain failures may have information in addition to postcode 
>>> information
>>> + * FDO Mode
>>> + *    To allow recovery in scenarios where MEI itself fails, a new 
>>> SPI Flash Descriptor
>>> + *    Override (FDO) mode is added in v2 survivability breadcrumbs. 
>>> This mode is enabled
>>> + *    by PCODE and provides the ability to directly update the 
>>> firmware via SPI Driver without
>>> + *    any dependency on MEI.
>>> + *    Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>>>    *
>>>    * Runtime Survivability
>>>    * =====================
>>> @@ -105,6 +112,11 @@ static void populate_survivability_info(struct 
>>> xe_device *xe)
>>>       set_survivability_info(mmio, info, id, "Capability Info");
>>>       reg_value = info[id].value;
>>> +    survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, 
>>> reg_value);
>>> +    /* FDO mode is exposed only from version 2 */
>>> +    if (survivability->version >= 2)
>>> +        survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
>>> +
>>>       if (reg_value & HISTORY_TRACKING) {
>>>           id++;
>>>           set_survivability_info(mmio, info, id, "Postcode Info");
>>> @@ -171,6 +183,9 @@ static ssize_t survivability_mode_show(struct 
>>> device *dev,
>>>                              info[index].reg, info[index].value);
>>>       }
>>> +    if (survivability->version >= 2)
>>> +        count += sysfs_emit_at(buff, count, "FDO Mode: %s\n",
>>> +                       str_enabled_disabled(survivability->fdo_mode));
>>>       return count;
>>>   }
>>> @@ -179,9 +194,13 @@ static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>>>   static void xe_survivability_mode_fini(void *arg)
>>>   {
>>>       struct xe_device *xe = arg;
>>> +    struct xe_survivability *survivability = &xe->survivability;
>>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>       struct device *dev = &pdev->dev;
>>> +    if (survivability->fdo_mode)
>>> +        xe_nvm_fini(xe);
>>> +
>>>       sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>>   }
>>> @@ -230,11 +249,18 @@ static int 
>>> enable_boot_survivability_mode(struct pci_dev *pdev)
>>>       if (ret)
>>>           goto err;
>>> +    if (survivability->fdo_mode) {
>>> +        ret = xe_nvm_init(xe);
>>> +        if (ret)
>>> +            goto err;
>>> +    }
>>> +
>>>       dev_err(dev, "In Survivability Mode\n");
>>>       return 0;
>>>   err:
>>> +    dev_err(dev, "Failed to enable Survivability Mode\n");
>>>       survivability->mode = false;
>>>       return ret;
>>>   }
>>> @@ -365,8 +391,10 @@ int xe_survivability_mode_boot_enable(struct 
>>> xe_device *xe)
>>>       if (ret)
>>>           return ret;
>>> -    /* Log breadcrumbs but do not enter survivability mode for 
>>> Critical boot errors */
>>> -    if (survivability->boot_status == CRITICAL_FAILURE) {
>>> +    /*
>>> +     * v2 supports survivability mode for critical errors
>>> +     */
>>> +    if (survivability->version < 2  && survivability->boot_status == 
>>> CRITICAL_FAILURE) {
>>>           log_survivability_info(pdev);
>>>           return -ENXIO;
>>>       }
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/ 
>>> drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>> index cd65a5d167c9..379d90759c28 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>> @@ -38,6 +38,12 @@ struct xe_survivability {
>>>       /** @type: survivability type */
>>>       enum xe_survivability_type type;
>>> +
>>> +    /** @fdo_mode: indicates if FDO mode is enabled */
>>> +    bool fdo_mode;
>>> +
>>> +    /** @version: breadcrumb version of survivability mode  */
>>> +    u8 version;
>>>   };
>>>   #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
>>> -- 
>>> 2.47.1
>>>
> 


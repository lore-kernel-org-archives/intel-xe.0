Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3ADF513F1
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 09:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEB810E145;
	Mon,  9 Mar 2026 09:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRKdrn+q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8224A10E145
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773047457; x=1804583457;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BnfHvIEuovJjGEvnlSUNq1HNS7pl0IaGBFFKjqvRVZQ=;
 b=SRKdrn+qptFy70BrEbw4pkIN25cpw2uqNVbxeRFUWkO4vY3UowRM5SCi
 bh3f5J5AWL5GXX5DrZ3PvXnmE6/YVbf/CcQdikiYNJxqiXlhvHJEhy6BS
 v/ECBq57J6UZD0wFhsP2dV10LIkzF0rdh/Zp9jfNCrQyCqNiyLOC8ILLF
 amnkQkaNf6vJUoLu8NO6GtAr+hJatFf0wn9qoWJz0Td7NSFfyAM/YDno1
 EK3RmdtSzTnU0BqqJhWd8tuwyO4PyHJaipwVJPKKRFFogJbTIObqxd7nL
 Y1N0cmYCs1X/Uu+Evv71CKNekP92u+FF3ObEMZhNJ9vUTNg4czvldKULc g==;
X-CSE-ConnectionGUID: d13NW89tQM+C38yoNkhKGA==
X-CSE-MsgGUID: 2K+BkvESREyUj5vUgfACUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73940268"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73940268"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:10:56 -0700
X-CSE-ConnectionGUID: CCYe5xLHTCK9VsCvWspHTw==
X-CSE-MsgGUID: 5HEz8EksSr6s3+o1NCk1zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="242716725"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:10:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:10:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 02:10:54 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:10:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAmsmVgRnu0N+f98Z+M5ml4cda3PdFAuCWNPgQTAsFjhwQnFrUkNLZ4sFfeQsI0MyB3Y7nTp6XUyRPFXbKhsOZrc/LyArBcXth84L0vxJBKPwSBrTLad2OCtoeIMHkulydN28mOBap4lolwq35i7cQ8RAbkCrupq4Y0difPdcQG+JdfWJq1xgPpb6V412rmcrY1DAXg28K3Tlgrevs+lU7Yl87kDoiI8p27V78QkEO9+yOdEiMGuD3YbdmiKCVr/f9OjCz6/7V0kALWu4Xs7N9cLS6uBhyp/dc+GnCRUZzfonLIqW1MClsLRDCKR/7zG/OKxT4l7FTLAb7Zyv22XOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpaV9WLf0mxwDA8I4PncxgDSutXNXfrj1nRaGWljcv4=;
 b=HSxDuY5tYCMGCXsr5g2GhPbfhh/nMKbaufSge6UpdTKXhNbB5pw+RrfUquI7wBEMbiqad1UQnq7fekELVWnjM2nkQtr0TrDmIvNBwg22o082FUI620R/svO9jf55jkKURKTYVzacAnfXqEe/JsGD8zHgiSU4VZ/sCq3CRd7AQ+KO3b7z8yS+2cg5MrjxLsqpwwq8AGbMY7EJfo4HoDbYygkpC4yLxAPM9ZimRevOrH28DbotF+8cCV7SidUShv34GOEXKFgdSLLMH/UgtU61ps/iD2/+1aE3UbSfeHQt6G8wpaycDhHUfwubFKJMGT/uw16QbiCPVAfvUsRgmIsnZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 09:10:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 09:10:52 +0000
Date: Mon, 9 Mar 2026 14:40:41 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 2/6] drm/xe/sysctrl: Add System Controller register
 definitions
Message-ID: <aa6OkckbtLnwl7Kh@soc-5CG1426VCC.clients.intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
 <20260302081002.3275868-10-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302081002.3275868-10-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: a56d7ce2-cbf2-4091-ee6a-08de7dbbc2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: ydni5iUpyUcOiluhg83pJTv9m9etCTTyvDCVlMMxyD6OgXKQsuYKD9e3VepplAN7PEa1J9M+GK/8fR1ITNfikZn7ODLEB2lO0TVfsDdef4FG+hwLTk36lE0VK5pZ8rpeDdTjD+4qEiwvTD+A1xdKBBjTgrZGoiWLc1OMiRAVB0HPhrD4ktufgVM6wv1KbJbyco4AVWwc38BCr5wJejMQ4NGTDoaeZ6YnMRNHWUMXKjfDNwKIMS9RGyBW6fE/bVp9L6KrqOB2MrWUKXZO1+olXdeTm/kU3yfkg1neSgMuchMClPmDsW4ZbSHG0jQKITTr7UBt2/Sfda/PUFEf0L6Xl/raF/AHIwPkvzQSoq/djO0fGGpCxtDViDmCb8rqJr2uo36w5ZhJxG+6YgN909G4Fom7S820jU+cDD+B9/C02RsQwykmeb4ZRE98jJEnbaZruV4Vkn6zSAYTYwM8qG9t7NPO0Z2gQN0d+iMOSDTfTRpF/+OlBGq2P/USMfahkWLQMiomwsLGeBQLD7aJAwH0s0lNmrkMeKnU8sdTLVd3gUSKYdfvnghzVFpCwNbx95kYyzUVIxSR9M/D+orJheTmY8mbcW1aDZXSKBcFb3M/OfGyy4BigNj6ymJuTN3MiROJjPJICy3H+c5UzsZW1ncoyQV+gakKMP1H7eakzjtrhS44hhhm5cM8zlq89oCVpBBxivLizQJSGT17qMx/09l9Q7Xws8IstcDV62z5aCQtmqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9JVlhNWUNzR25WaVNMY0lvNklqWGRZc283QVp0VW8xSkZiOFFueGVGYndN?=
 =?utf-8?B?bTF3UlZaeHVCYmx6Y2tCc2UzUXIwTTNWY1doc3ZHWGZhZ0U1bXhzT0txbG9U?=
 =?utf-8?B?UzBoY2kzMHlDMTVFOTkyc1BtUDVqYmFDY0V0TnZXSnNVSkVBREdra1JXbytU?=
 =?utf-8?B?ZlkvRWx2ZTZnK2Q0Sjh6Z1ZZQnl3QzJuemJiSThoalVFSmQ0eWJ0UUNTY1dD?=
 =?utf-8?B?YW9PTnE2NDNITXhoZWFQSVk1VXBYMUlzbFNXUFhISXFvcGpkMEZFRGRqOW1t?=
 =?utf-8?B?anZhb3FFR01uUHN1SnROTHA4WDNxNW56VldVR1FoS2Y1SzRDUVV4czE1VXh1?=
 =?utf-8?B?emZ6dUdRbFRTMW5nRWdlTy9wOExITTNEaUdNUVpSQXZ3R1J4cWE4MHBzdHRK?=
 =?utf-8?B?Ym1NWU04VXFCN1M0Z05pOFhYUThBdWJIcGJGeng2RkhMTmJrVGxlbS91bWVR?=
 =?utf-8?B?RmVqWEVkK1c3eUh2ci81Mk9VOFhmMUYzTDByTy9RMGxLOVExWGF3M1ZVZUJn?=
 =?utf-8?B?UFNzUmQ1L2I3ekY0cVNkNTJwbEs0VWdNZjZMNkxnTE13ZGxWM3VmVDNYL2gz?=
 =?utf-8?B?dFR0QWJDYndDVHVEbUdDUHl0TmpldHpjOExwZHVQaWs0OUg5bGNXbzZ5Q0JW?=
 =?utf-8?B?Tm1qOUFucnNROU5BS0orcjBiME5wQ3d5dXIwdVU0bGFnamRhZlNaM3dBdnhI?=
 =?utf-8?B?cEVsMlhoRkxFTGc4UURFano1ZUhXUFBtcWE1V2lSZm5RaXcxMzM1YzhTcU1U?=
 =?utf-8?B?RjFMNW1vU1lOemthYyt0bGFPdGVleVRKYjFUQ0lQR2k1YnZuQXRYSEhZZ1o3?=
 =?utf-8?B?SXJMa0cvZGxsaHlCSlY5VWc5VXdhbXNTQWVqMSsrSUwrSytpOTZ4OU56aGVZ?=
 =?utf-8?B?U3pENU1QWGxUWEZhMGNiTWdXd05ReXd0d3htSS8xRUNIUTFKYzhvd1ptQnhn?=
 =?utf-8?B?L205MWhMRzFGbnpzSFZNc0RoT1dvdUxocHhzcU5oaDNQTnNoZ2hwNDRZbG8y?=
 =?utf-8?B?U0duZlBWWGVDVktWS1FGQkdpOWs0Z3JkQVJRT08wSERZSlFpd3FjaUxvTTJz?=
 =?utf-8?B?TWJnWndCVVBRSUZxSVJjVFc5bTMyRmJoaTEyS2lwNmUzbkhjeTdhTkc3VCtC?=
 =?utf-8?B?SUFlcVJzdkRRcGUwUlFsV3BTRVdWWFlQMll4UHJGeGE5WnFmVlphVWk4Z2J2?=
 =?utf-8?B?OWJyQnRqU2Yxb3dHZHdLS2x3Z21lbkpaWnloa0NIZlJWMGFPNjNIN2RNOHFX?=
 =?utf-8?B?WERXMnloTUErZkhveUo0ellrWmE5anpoQ1psY3RZd084b1lOSkJhYkJqengz?=
 =?utf-8?B?UHR0SlRzeDJENXA1cFBjaVd5SnpYQTYxNUloUkdhb2gwVW45YVpkMzBxZnp6?=
 =?utf-8?B?U0xaU3RSMERJaTZIMTh3WHNRU0kyMnQ0T3czdmJqRmRYcWVrdFRGVG5vN3lD?=
 =?utf-8?B?SDJNUVRqUUx2cExGVG4zU3lRZUJ6V0tJSFJLZE1mZGkyb21QL3BvYjNRZGdU?=
 =?utf-8?B?UjFNM3FqcW4rMWlINU4yWDJmYXo5R0podGt0TWFTWVd3djQzQU4rR1Z4UHVN?=
 =?utf-8?B?aUE4cVg3M2NVYnNUQjB5RUkvVDIvL2xhaGVjM3pycFVJbGpoczh5WWk1QUg3?=
 =?utf-8?B?eThvMVZ4SjBmdU9TWTRJZUFqMWtmU1Y4THZGenhGSnBjOURtK3ZWZG9vTlhs?=
 =?utf-8?B?RHlSWlQ4UWJSVEVNUVBpWW9TM2lDL3RBaG4wT1d0c3lveHJUNGRDNXF0RGxO?=
 =?utf-8?B?UjQ2dUVObEduMDJaSkNHVHg0MEkrUU0vNlhmNERkUzB5REp6c3R3d0RsNHds?=
 =?utf-8?B?N3N2QStSTmUyT2t2bWJZRTNjOGxWKzJtZVVrUWxvVnF1SktHLzhuaDhTajRj?=
 =?utf-8?B?a3pvdjZjTGRaemdjMnk0eXZkN2JidURPL2U0UnJ3WVBxaGRHdVJZL1FWdy9C?=
 =?utf-8?B?ZHlpNEpVNEdrUlRaUjJsR2tVODBHYU50UXlNeGV4cStLTVN3Qm9OVy84c2RB?=
 =?utf-8?B?aldBUDFFbGUyZnF1dzUvZnpYN0E4ZTQrRVFaQlZBaFBFaFErSjdGVUZ4UFoz?=
 =?utf-8?B?ZXFFc3psbi90ZEJMcjQ1TDFvYXdIVDUzQTF5UXpxbnlrdVdvc2gzaWFIWUxm?=
 =?utf-8?B?ZzVUTUN2ZFVTQ3EvaU1ZYzNGS2dJdXVyNUFiV0VoOXJPTmFyNkhHWGJtYWxK?=
 =?utf-8?B?SWpmRjlwZlljVGg3UnpROHduOUNJZU5FTVRFdGZQUHJmV09rS1A2K3hKUlR6?=
 =?utf-8?B?TDg2c3MyeVJxVzg4R3l0TzBhZGQ1d0pmLzM4Q25YUkRxMmdIQzVkdzA0b0c5?=
 =?utf-8?B?SnpMK3MraXg3bVhIcHdQYXUza1FrTEljd2RaNmE1TDZWTmFVNlp6Slh2NXVl?=
 =?utf-8?Q?HyZW7MUEkufjGvsk=3D?=
X-Exchange-RoutingPolicyChecked: iY+acmUfI0H8Vn/bOTQ6tcylRairlGK/kWUcF8CiMhqwJ8/EqbqJ4eZvfVbsbH/Nn1PLvcptkMDUvg+6aIDOndQIqIxVTz5TajnA0kxf6Oi7+hiDfo3pz1lvxF6rnMUSiul48xL2dZLYU0GB1zl6sqCbQPbjGlyeJGIgeJ2AX9q8F0gLWPt+/hfJfwpASJGgwLSEknrZyQ1plyIeSebDeNSjBg+aCh8kst2zUtrtKku5r0MbcEs6XwhyRH94TOU2bVydeaMhFXsYZJQLyi1W5j9xtDa7KmSfkOXhBq8TbwuY9luLr336F68ClJcFI5TDwFs4HaB/NGscj4ws12V+GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a56d7ce2-cbf2-4091-ee6a-08de7dbbc2e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:10:51.9136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miJBV9ptTDHeNCWNs7aa7vdK/XFYUv3QBY/hI7JoxBw8pPZhuyu+IdzEwGR0iiJmcoloTM2QigzkpDtWoZ/eJ+AsuwE2TIpxUmAquzg+gFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8399
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

On Mon, Mar 02, 2026 at 12:10:04AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add register definitions for System Controller mailbox interface:
>- Control and data registers
>- MKHI protocol frame control fields
>- Base address and BAR configuration
>
>No functional changes, just register definitions.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v4: (Matt)
>- Use lowercase hex values
>- Align macro definitions to column 49
>- Change to relative register offsets
>
>v6: (Matt)
>- Move protocol constants to xe_sysctrl_mailbox_types.h
>- Add SYSCTRL_MB_CTRL_MKHI_CMD helper macro
>---
> drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h | 36 +++++++++++++++++++++++
> 1 file changed, 36 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>new file mode 100644
>index 000000000000..f3c00f54a2ce
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>@@ -0,0 +1,36 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_REGS_H_
>+#define _XE_SYSCTRL_REGS_H_
>+
>+#include "xe_regs.h"
>+
>+#define SYSCTRL_BASE_OFFSET			0xdb000
>+#define SYSCTRL_BASE				(SOC_BASE + SYSCTRL_BASE_OFFSET)
>+#define SYSCTRL_MAILBOX_INDEX			0x03
>+#define SYSCTRL_BAR_LENGTH			0x1000
>+
>+#define SYSCTRL_MB_CTRL				XE_REG(0x10)
>+#define   SYSCTRL_MB_CTRL_RUN_BUSY		REG_BIT(31)
>+#define   SYSCTRL_MB_CTRL_IRQ			REG_BIT(30)
>+#define   SYSCTRL_MB_CTRL_RUN_BUSY_OUT		REG_BIT(29)
>+#define   SYSCTRL_MB_CTRL_PARAM3_MASK		REG_GENMASK(28, 24)
>+#define   SYSCTRL_MB_CTRL_PARAM2_MASK		REG_GENMASK(23, 16)
>+#define   SYSCTRL_MB_CTRL_PARAM1_MASK		REG_GENMASK(15, 8)
>+#define   SYSCTRL_MB_CTRL_COMMAND_MASK		REG_GENMASK(7, 0)
>+#define   SYSCTRL_MB_CTRL_MKHI_CMD		REG_FIELD_PREP(SYSCTRL_MB_CTRL_COMMAND_MASK, 5)
>+
>+#define SYSCTRL_MB_DATA0			XE_REG(0x14)
>+#define SYSCTRL_MB_DATA1			XE_REG(0x18)
>+#define SYSCTRL_MB_DATA2			XE_REG(0x1C)

s/1C/1c/ if converting to lowercase.

Umesh
>+#define SYSCTRL_MB_DATA3			XE_REG(0x20)
>+
>+#define MKHI_FRAME_PHASE			REG_BIT(24)
>+#define MKHI_FRAME_CURRENT_MASK			REG_GENMASK(21, 16)
>+#define MKHI_FRAME_TOTAL_MASK			REG_GENMASK(13, 8)
>+#define MKHI_FRAME_COMMAND_MASK			REG_GENMASK(7, 0)
>+
>+#endif
>-- 
>2.43.0
>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBFAC71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 23:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830EB10E74D;
	Wed, 11 Jun 2025 23:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfnN/w2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D61310E74D
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Jun 2025 23:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749686226; x=1781222226;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XdNz42K82NYXzYvuheCPuSHbHAv8x3lwQlTiSKRTs9k=;
 b=NfnN/w2/URzjsKoWe1E7XmwB9uYAJKd2UNI7RU/x2wjI0JafcATGQj7s
 HHH3YRv0pE+j0eRXovDiL0u3AIsstG6n8FwoRjiBgTSkG7eXsEquWI6ea
 fB/6238uVrw4Db5+8Rjm6Cw3kirY44VgHr8jbYKqOqmli7rP+lJ+qZdBg
 tbT5O7T9zHkdgmKL7APTpmUMC5jzvqjgUiAUHrJtSfI4SbUdF6HiToRxe
 7Ietg9pQfVPqPlvLpIVukRK5Oru0tn1orUVxi9z9jxQm80wzsRy8DAXOj
 FG39hQyONwrQmqlTKo7oIm8oirQyMoL4NUyRso9nicYb/c8vsjrQU1BfT w==;
X-CSE-ConnectionGUID: Gjqm21ufQi2WgifGGKWWkg==
X-CSE-MsgGUID: ZCnZP8trTuSJIQCc84nLIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51564103"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51564103"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 16:57:05 -0700
X-CSE-ConnectionGUID: RWD1cVu7RzaiNrEoahQ5mQ==
X-CSE-MsgGUID: fap5Lq6ARVa+WOPm+aWhfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147896726"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 16:57:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 16:57:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 16:57:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 16:57:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBgqdjrxSM0LAGQfIgwNQNDziNLiV5UhHeWbRsIA/Lbacv+YGfcxMiNlvCUaeSE7tyceJ34WC2tVNdXXF4kv1mXqq8x+s2OONrttZfjbx/LvWXS7Cv2fJ9wbm5mC2QOy59rJWu8bQ7AIRaAzWij6mj0hQWyqoMMP+fGjH6DWDKTLaLLw1Jlt3kSp9HPed8zCcWH8cVxrgdPI8nXiiL4ysn0OUw4BLPvjWdESmCcjHwwflgRKTGtqZPO2MZ48Tcw2o18OQ5tuyoxppPOpWDQgkTC0C0AyutRGoEetZY59Fno+ZoecUkSdRjY3hefJfEbMaG8wxqJrfl/err9vj9eblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptO5WPW456ICm8vQtk21RsjJZXpWtP6Mq+NGu09jiEY=;
 b=PdzsPnx6z4f5CZtkM4Hdmn4sVa+WbVzyJ8tH/VebPwoMKXdx0ghl02fVsVFK47fVciYVb5BG+IadI8NiVYpondqXZZ/jXmETQrXU4qHgnPpI0EC4DMkAODVl0+L1ieJCkrTSfACLvby+fauEre2x2z3RV+P9cYs5EWgiBys2+Zyi9lf8NzASpCoPwxSvt0WWm6VUxCeZ4mOsPkJnSF33UlZWaJU5PKzLgAq9PDJfZsfQlr8Gs+5XjtyXx/WznMtvGQfiZjNBsz96Zl5KBLMDqwsI51PcuB5PlMu5LrOBlILoh8Pv9L4nzm7zf5Rt2Dtc4itwvvEE3MYFJfROnKYS8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ0PR11MB6718.namprd11.prod.outlook.com (2603:10b6:a03:477::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Wed, 11 Jun
 2025 23:57:02 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 23:57:02 +0000
Message-ID: <a47f94c7-7677-4945-ba4e-cba894428472@intel.com>
Date: Wed, 11 Jun 2025 16:57:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
 <CH0PR11MB5444BB01251782688FECD0E6E575A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CH0PR11MB5444BB01251782688FECD0E6E575A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0048.namprd04.prod.outlook.com
 (2603:10b6:303:6a::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ0PR11MB6718:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a40f80-3f36-480e-4498-08dda943a90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1FvRE5qTkNFeGk1NzVtajBKRlVzT1ZWYy9FejhhdnpjR296VFRCaXBCM3dW?=
 =?utf-8?B?M0kyVklPVlJaYlNZWkU2NXkxQ3Z1dkc2RytVSVRFSnAxOXNZdnFQUzdRK0Z4?=
 =?utf-8?B?OXpobHI2SUgydUJlRS9zUS90cGhkTG1jbElWTWVPRkRpVU0zT2NsYmdwUEQ4?=
 =?utf-8?B?L3RaQUc3WWRscWQ5U2hnUUFYUzBNR3ozbDJ1TC9reDFuWDBZMFYvd0h3M2lz?=
 =?utf-8?B?YVpWbGdCS3ArM293MytDdit1UGJEbUdmMHUzSTBrSWpWRlZPZ0dpK2U5V21T?=
 =?utf-8?B?b1p1UTNqaHZHLy9PZ2pZZmhmenRQQjNpYW1BM2ZtQlFmZ1djNGk0UjFxYk5K?=
 =?utf-8?B?N3VGWUswRTVFZjlHTUwwMzZqTEttZncvNUNIZ1VucWpVNHR1THFDZ2t5eERX?=
 =?utf-8?B?UnhwZGwxMkJ0Q2hXTExnWjl4Nzl6K2ZRSTFwRTkrb011bmM0Yzd4N3BtaXR4?=
 =?utf-8?B?bmtVVXZ4MHlzemxza2tXNVE0TUl4c0VvbWs3ZnlpUTRFWVBDdmh1amswMUs1?=
 =?utf-8?B?RHlrM1R6ZDR0TzMxU2poRkhXQ0NjK1pDbXZyUnhVcm44Y1JMVDV1aGhxc0RN?=
 =?utf-8?B?dFE4bXZ5b2ZaY3dkNGRnSE14YXkyQmFOZ01IOVdBV1ZYSjU4UUZZd1hDcXZt?=
 =?utf-8?B?Yk5lbWZ0VE91U0EwS1NORHJUYXdtakVmTUtqeHVha3FMR2FRbW9OM1J0VEpE?=
 =?utf-8?B?TVV4dVhJT2N3eE5GbmxkT3ZVbUF3SHlLWGEwY0IvK09CUzZoZXd1MHVycGhH?=
 =?utf-8?B?NWlQV3lYQXBUcitsSENteTM4ZTNMNVBUQUQyVDlkWkhzUVFucWlBVWkvY3M1?=
 =?utf-8?B?cFJsRmhQS2Y3dS9nZzdhekV1b2ZpRktpWGc2T0JPWGR6b05KYUJ3M0pvYXda?=
 =?utf-8?B?K2NsSUNCWnRmOVViQWRYc1RkbTVHM0xCMkRjNFM1RjJFS3VkSlRXVVBJeEt6?=
 =?utf-8?B?OGNJL1lqaW5pYkNnYnAvdGw4SHB0cFY3c3Q5bWRRS0RGa2ZWSDRmU1J6cy8z?=
 =?utf-8?B?M2VUUXFlUVNJUno1TWd4UzA5eTFPdFpMMHdROHJLNlNWTGJhd2ZseFZLbFdI?=
 =?utf-8?B?WndvbmlIbG5hcUxLSG9OWit0NTErM0tGbTlnVHdLTjY5blRuWm82bC85Slhy?=
 =?utf-8?B?Y0czV1g1YjdwYmpsUVF2K0dFeUp4bHBFMnFUWEZaN2JsYkV2RWpId1YxY0Zu?=
 =?utf-8?B?eCtuUFN0NzljQkI3anFUdytKNHRYc2NyMm15MEh6ek9Jend0WGN5VXVqU2Rw?=
 =?utf-8?B?dGVmSmxUV1Y3Ny8zRHNsNWRTZWdrWWtHWU5oUU40M08wU3VVSkNyVXU2TUNC?=
 =?utf-8?B?YzBwMWQ3aU14S1dNLzlUS0RhNzZ4UHlvVlFqOWdVc0NBTW5LaUs0UkoyNU1w?=
 =?utf-8?B?cm1HM2hRdWZuOWtZVEJ3K3dudWZ1a3BRTStnRTlMYVF6RGFFZWh4WGtWaHQ4?=
 =?utf-8?B?QXYxYS9HQU5wemhwdm1MUldxdjFwS2NZOEgrV1diMjhLb1BsaUFEdnVuOGV4?=
 =?utf-8?B?L1hVY0NUZS9mZkxxMnFqZGJqYnQrU0ZXNXMyR291RFhyRDFyVU15UTFDLzBl?=
 =?utf-8?B?SXBTV3JScHl0OUI2dDNobng2RFJ1ajkrNEwvZkxTUHQ1R3BSc0lVd3JHam5q?=
 =?utf-8?B?WHpyUlZJV2tOQWlQc0tUejRCTFpFWU15RnREd2tGdFd4QWk1UDdYNjNjSkJP?=
 =?utf-8?B?N295WFR1WEh0dW5aNW54Q0hXdFZjZzhiejRuOWdiOU5IOE5ybXd4Vm1BTEd5?=
 =?utf-8?B?VmxJblhvdXN0WEdVU1kvWjNtZjdCYVhpRU1abTFubkRseGt0VFFnV3pjM0hr?=
 =?utf-8?B?YzUvclpCTS9KbkJ0OHdaaWkvdGZ2MUxWWG00d0t5eUdsUkoxWHVOTGNyOTYz?=
 =?utf-8?B?WlpYcmRMTmtwQnJrL3VnRjNINVU2ajlSL0paNWhScHE2bTFCOWtaUnZLTktE?=
 =?utf-8?Q?7w9pKmPNQT8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3J3QTQ2SjQvVVlTaUttbkNjNm5FMklBcDhUYm9mVG1ES093QUVtOGVMK3d0?=
 =?utf-8?B?MkNZNWU0Y2oxcVdCRGlhZzN0VUdFaEV0c1ZLaFZ6K1gydUNkaG5WV0JSbUFL?=
 =?utf-8?B?NEQ3Y1lSdUFJeWJMOTd6b1FrWHlQd1hHd3hSb2ROT2JIQi9KZ0lKVUUvMWU0?=
 =?utf-8?B?akVKYnptbE1NaC9LdVQzU1FrSEJ6YUJCaWxZcjFiajg1Q1I1L0ZpUXNwTlZL?=
 =?utf-8?B?dmh1cXQ4RDVNUU8wb2lqOEZWT2Vvem9nYlJYTFZUSDJuV0d2ZzhmU25hWUxN?=
 =?utf-8?B?ekRBVDh3ZGtWaGljZEFxeElSZFcreHFuN0g2ZkpFeVpMTDZrdjdFM3EvdVZs?=
 =?utf-8?B?ODdSeGQrT0sxSUQ3cWU5VHNCUFVlTkFXNWRzQ2Fmc2JxeGNLaVBTNmRncDBl?=
 =?utf-8?B?NjZPV2E3Z0NYdjBDOFFIbytLTGs3b1IydytwQjNTMjFlQTBCR1BwcVBYTGVG?=
 =?utf-8?B?YktJNU9Ydkw2cGJzMW84YUlLZlc4OHc5VzI3S29qeGRwR0xneFJFMUsvNTB3?=
 =?utf-8?B?UERFY0dFMmJoNWw4QXlUZ1FHVWdiZGhWdXdCQlhqaWdQT2FielZpcS8zVGxv?=
 =?utf-8?B?Z1lRTzNGZXNleHhoWjF0WmVaQWtJT2JpakFJTHhGdkY0U1BmZzlaY2FrcHR6?=
 =?utf-8?B?eSs0ckN0WVIvNStLaUNPVmNRcnozSGN0VG0xV2p3SVdEVUxQTGhVNFdUbnRl?=
 =?utf-8?B?TXpXM0lhWVRkQUMva3ZleDBmU1RlZjZOY2JZcUM3bGtoK3RzY0FvZnNDQ01k?=
 =?utf-8?B?dWRDdE9qbWloOVQrWnFTVjlsZGZhbk5mODZnOEQ1cXlXc1hDYXFqZmVKc2hP?=
 =?utf-8?B?ZndTeUlTd3JyTFNQTjRaaWJFNjM5a0hTcGZmQTQ5ZnlMQTFDaHJCK2V1OThS?=
 =?utf-8?B?eHByWTE5bXVESEtyZTRHSVlTNkhWWUI1NFYzbys0VXYzcGFOQjFucTB4ZUQ3?=
 =?utf-8?B?OVM5WjdNZGk0SVpqSjh5Uy9DZTBPcG5QTzN4UTFqYjJieFBSOFhZOURBeXpp?=
 =?utf-8?B?ditReG5NYmlPVzhkdGt2RkEzZ3B4S1c4dGM0VGhDL1UyMmRiZGV4VS9NMklH?=
 =?utf-8?B?UW8vS2tIbWxUWVZSZEhyeGZCU2F5ekdMazFhL0V3L25MQlNXQUcxV3UvdjVa?=
 =?utf-8?B?VEFodmVDNDI1YTAzc0x0QnlSWExSc0wwT3FzZlV4d1FqYVBaa0JNNUZoUllr?=
 =?utf-8?B?S0M5dFFlTEwvblNHbFQyNnVNSXpKQnVwTFJoSjB3R1BUK0tEM0ludm1ydVh6?=
 =?utf-8?B?ZUtVcUkvOTdaN0gzYjcveVdXL3dFU205RUZOSmZLN3ZSa05pRGFETUNrOFVx?=
 =?utf-8?B?YXhtRTlXMFRpMFBhWnB4VGFLY1c1YTZuMGw2cnhRdGZmZXI1QVB5NTRmamxH?=
 =?utf-8?B?ckFmUDVGcm9NVllJY2FjYW4vRlorczI0cnRNb0RVaW5WMGprTWVHWjFBUXU3?=
 =?utf-8?B?NEIrUHN0QWpDRnNYZ3BwVC90SVRhdDZpUXhzUDdHeHZiTCtCTFg5UTZaNi95?=
 =?utf-8?B?UVNQeWFEOUtDb2lhYnFBSUJjazB0RjhCcVhWL3lHTDM1TlpqeTUwL2ViMEgx?=
 =?utf-8?B?aGVyV1BVbmxhVGtLL0VQaWd2L0x2dGRHNHYrY1E0WjBEaWM1NWVXMTZpazB0?=
 =?utf-8?B?Y3VoY0FRaHdMeGhrdUhRL08weWVPS05PVlh6bXRaMDhVdTIyOVVrRFB1dmZN?=
 =?utf-8?B?dkhNYUpJQVVIY2ltcTQwYmJMT1JKSWlJdWZTR2xzN1VQakV0UXdwZEhFc011?=
 =?utf-8?B?UEdrM0V1TDRGVHFQdWFXaWVBdDVLSCtxbnlFcm9CT1JmOTlRWmNxMSt5U0Ny?=
 =?utf-8?B?cVlQVGdrYk9QY1VRc0hKQWVUNmVKQlFxUzVqZGk5enJva1E1R2dPaXhTUzB3?=
 =?utf-8?B?UjY0bUI3OXBnUjU0R0ZxZHBDc2J2MzBqSDJiWDE1cUxsK0w1aTU2eWFpTmVj?=
 =?utf-8?B?YjNGdURwZTYya0hYU1N3ZkUxaUk4dU1ILzhPYXlRRXVZMzlDY2p3ZDVFWitl?=
 =?utf-8?B?QVRWT2drQ0F4WTVrMEZVQ0R5TTFaczdVMTMxdEZjS1BlNXh2U0E4RXJKbnV5?=
 =?utf-8?B?aXVGMStuWTVRblFxOVl1dG9IWUpzUTdkRU0xbnBFWWloSXNpRFlMZG5MRGc5?=
 =?utf-8?B?VVlOOVk2Ty9OZHJ3SGd4dlBxRlExNVJQY0h2Q1ZIWi9COHoySUxFeGg5cjhz?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a40f80-3f36-480e-4498-08dda943a90c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 23:57:02.5026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HP5oI+LCQl6pZP/hyutmOqrukV51zI8blt+JRyMjiYMxDtqBA3Cg9uDAnUBJOWjqHaFKvpeLxoOD2oyiIVOtawsxL1dRykiHRfqJayNpisc=
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

On 6/11/2025 3:04 PM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C.Harrison@Intel.com
> Sent: Wednesday, June 11, 2025 2:06 PM
> To: Intel-Xe@Lists.FreeDesktop.Org
> Cc: Harrison, John C <john.c.harrison@intel.com>
> Subject: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The GuC has an option to write log data via NPK. This is basically a
>> magic IO address that GuC writes arbitrary data to and which can be
>> logged by a suitable hardware logger. This can allow retrieval of the
>> GuC log in hardware debug environments even when the system as a whole
>> dies horribly.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> So, this is basically a new modparam value that redirects GuC logs to
> a specific IO address?  I take it guc_log_target = 2 is the default value, and
> guc_log_target = 1 would print the logs to stdout, then?  I'd ask why we
> use 0 as a default value and not just default to 2 all the time, but I think I
> already know why (we need to guard against guc_log_target = 0 anyways
> to prevent printing to stdin).
Um, read the patch - "(0=memory [default], 1 = NPK, 2 = memory + NPK)". 
The default is zero. And no, nothing prints to stdout. This is about 
hardware level debugging. It has nothing to do with stdin/stdout/stderr. 
Those concepts do not exist in hardware nor in the KMD. If you send the 
GuC log to the NPK target then you need a hardware debugger (JTAG, etc.) 
to read it, as described in the commit message.

>
> I also take it this is modified on boot by, for example, writing
> "xe.guc_log_target=1" to CMDLINE_LINUX_DEFAULT as a part of the grub file.
That is generally how module parameters work. You can also set via 
modprobe.conf files as long as the Xe driver is a module and not 
compiled in.

John.

>
> Yeah, seems good.
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
>>   drivers/gpu/drm/xe/xe_module.c | 4 ++++
>>   drivers/gpu/drm/xe/xe_module.h | 1 +
>>   3 files changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index e16d19b44bcc..9c0e3113f7d5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -35,6 +35,7 @@
>>   #include "xe_guc_submit.h"
>>   #include "xe_memirq.h"
>>   #include "xe_mmio.h"
>> +#include "xe_module.h"
>>   #include "xe_platform_types.h"
>>   #include "xe_sriov.h"
>>   #include "xe_uc.h"
>> @@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>   	else
>>   		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>   
>> +	if (xe_modparam.guc_log_target)
>> +		flags |= FIELD_PREP(GUC_LOG_DESTINATION, xe_modparam.guc_log_target);
>> +
>>   	return flags;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 1c4dfafbcd0b..fc8c681819b9 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -21,6 +21,7 @@
>>   struct xe_modparam xe_modparam = {
>>   	.probe_display = true,
>>   	.guc_log_level = 3,
>> +	.guc_log_target = 0,
>>   	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>>   #ifdef CONFIG_PCI_IOV
>>   	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>> @@ -45,6 +46,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-res
>>   module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>>   
>> +module_param_named(guc_log_target, xe_modparam.guc_log_target, int, 0600);
>> +MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target (0=memory [default], 1 = NPK, 2 = memory + NPK)");
>> +
>>   module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
>>   MODULE_PARM_DESC(guc_firmware_path,
>>   		 "GuC firmware path to use instead of the default one");
>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> index 5a3bfea8b7b4..4d978f6f26b6 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -14,6 +14,7 @@ struct xe_modparam {
>>   	bool probe_display;
>>   	u32 force_vram_bar_size;
>>   	int guc_log_level;
>> +	int guc_log_target;
>>   	char *guc_firmware_path;
>>   	char *huc_firmware_path;
>>   	char *gsc_firmware_path;
>> -- 
>> 2.49.0
>>
>>


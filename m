Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC63CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 19:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1919710EA69;
	Thu, 16 Oct 2025 19:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCAAz8LJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2D710EA6B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 19:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760641394; x=1792177394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ReEVyuEHYv5poHyN4wtnGnt+lW/CSzprFvlxixO+jUk=;
 b=GCAAz8LJeOI+d/NV2O3DsWFe1OmLzCdtja2Anc1dllOqPClbAxRXlQg9
 tBJPZTlY9nKIWXbOHtuypgBdcXfkEFk2UhogZo2QshQkurqE2OUlO5XJg
 hcwV7+3jMqWXOnyD2d2KD5Vazdx5xBSErbB/PpOTb1oG+dkJCJ50vBE4b
 GXoLr1R/QGj+uLaFzIDKEU3UqnVHVFXEbd4cmqGWo+SEymrdy+dzIm4HP
 dUYscluFGlU032kbzMqYqTJgxaxgptLijE9XNvUQmRDqZlmix79t+kWLd
 iTXf/oyVcfpSFw5qCEmt3AGuz9/3fxkSwjvCFpBiXq4l0zvQu4QsoQNeV Q==;
X-CSE-ConnectionGUID: CC+47VoEQMmFNRX+HUfbMQ==
X-CSE-MsgGUID: cO5PKym1SECKzGihHQAetg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="88316608"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="88316608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:03:02 -0700
X-CSE-ConnectionGUID: xLZEyo5HSaawBN8DUkMFCg==
X-CSE-MsgGUID: yR2QknwpTfq8dMuZabNnVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="206240400"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:03:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:03:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 12:03:00 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:03:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIoTNO0x+juQUE95f1PQsp9/OU+v8Nttf+uKrZkec95mVuaxtRhMKDvK325BcJMfWCncRoexEK9peNLRFQRngXf+8307rlesVfL6uIYBlZmSfWsMEGglRG5W6ICuSjAhHeF6nDIJiMSRSq/NEGrLITi/p05pddt+Qj5kWM22A7MopnVIrTgzJD6ya8CDsMBt2amDhNj8sefn9/JuETXaSJFa6dWuUV+IE911wkVL70hsS8OECu0yihgh+pXoOUtX0mVRMncvjQ/gY0mHn6iEQpphO4T2hgidKu1BD71RjRt2nRn3SI1jbIX072D8hYU7764HSKgO0MBgqmKnLtgHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csDFiYidk2OEdvVFyMjw5COzdc/KAIm6w0cqTVp8EAY=;
 b=FkPqUUBq7SW3r6t7PXsiq+hAZ5nRvTa3A8+rpnoaegtXb4HKZJLNdkAm4ubvGASNDeBiMS0GGaELgoQrR4EfdijpULhTDTdyKk6QmeqR3yvc0XCOnnk5SRaq0bhxq4k5VDsNI+zzyd57rdC9fofPqEuDH8dQgmDIfRlkAH3UzVewkmxaBRuDQUA/93SU2F6ICDKjef1EHojsEC65ruBdO8Msj3ckVG5ZvuJTbLG3dCloXKU/8kNp/SINCDxpg5cyu3c0yWGLXkUwM+65xspuIuHZb6JMXBzP1LzyBnXFsxOMZJWtOVDxc6J0HfbGe9lI1yH1H41d65bXPJ6c2URpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB7208.namprd11.prod.outlook.com (2603:10b6:8:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 19:02:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 19:02:58 +0000
Message-ID: <afea5ffb-9429-4e54-950a-0c7cae6f391e@intel.com>
Date: Thu, 16 Oct 2025 21:02:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/tests/pci: Check dma_mask_size, va_bits and
 vm_max_level
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-0-d0886d97121d@intel.com>
 <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-2-d0886d97121d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-2-d0886d97121d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d2e41e-ef54-4f05-6f9b-08de0ce69ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHVmY0RpWkpLaXNxSXZmN2Nqd2EzRmlHb3JHRDcvc1Z6Yzcybk1nUUc4cmlX?=
 =?utf-8?B?WExXVEROckhsRC9TMFVzQnk3SEwxdVBiU21QaW11WlFSMzcwc3hKTXV1ay9j?=
 =?utf-8?B?YjRJeC9mU3RLakhYY1BlUE9Od1AxeGp5WXBDZ2lUaG5GZFUvVDNVY2taNmc1?=
 =?utf-8?B?VGxwUzVWc3UyMUNNbXVTeGJ1a1ZCeENQdlpIamk4Skw5MEJYb1AvSVBVZ2Fl?=
 =?utf-8?B?a2t2U1ZReDcyRWk3RUVWcU5ZRW44Y1R5KytTQWFudlEyUEpRNjZmUHgrTDAr?=
 =?utf-8?B?VEVpaWxZbm1VMTFXRUpWV2E5WnJNUTliYkRSNmhuN3MxRElOKzNNTENEVG5N?=
 =?utf-8?B?TnNZd0lXcllSS1Y0TnBFVzlhOFArRjM3cUNwVEFvNUlnMmJJZVI1T1ZKQ3Av?=
 =?utf-8?B?aEw0RzYzNWI5Q2ZyMk9oMkoxM2ZoM2xpSG40ekZwK3JzMFkvdkFzZ2lYaEk5?=
 =?utf-8?B?TStwaE5NY2JRZ3hLa2JmdmpmNFIreWJUNnhjb1pNRlpGNVNDa2NkeUhpL0Np?=
 =?utf-8?B?cFNUSFNYWVN2NzB5dEV2SGhabFZrbjhWSkZUWWJIVE45ZThmWU8rbWREeEZx?=
 =?utf-8?B?b1Vkb2R1Ni9lL083Q3p3NHA0MHFheTB1cVp6N0cwTDNyM1pyOGVOTHN4c2hJ?=
 =?utf-8?B?VCtNOEVxSUp0WmJYVlVzeTBITnVlNGorZWxXSlNoeGE5WEtNSVFSL2tiVTZF?=
 =?utf-8?B?YnhMQ3BJV2JZdkZxa2lvWTFUaEJCM3JjR0lEOWd5ODQvRm5ndkhFOVFUbGFj?=
 =?utf-8?B?UXBUa3VOdW5DNXRJU05zVUQrQUhpVFI5cm5xZENJRHZCKzJyZXdBRmVKL0FF?=
 =?utf-8?B?MU1OMW5QNU04Q2tOYjlNeU1JckR5U0drYjFGZnFLN205Q1NidEVOc1BTUWNE?=
 =?utf-8?B?M0gvbHlEdFZYSmgvQ3g0SS9wK1Uza0NUT29qeFhrVjNtQitudjA3Y085UlNZ?=
 =?utf-8?B?WGlCdmU3NFZUb1JVV2ZTNXlmNXo5cVpFMk9RbjZvbWJOYXYzb2VLNHBRcEwx?=
 =?utf-8?B?L25VMjFrQXBCTTdDQkozb1pOSEFlQlpnbzBzTS9ld3hlY0FXbjVoT21uQ1Fr?=
 =?utf-8?B?YXNxbEdjeHUzeSt4eC9aM0FwK1p2UlY4aVlNMzFCeW1vdWxIYlcxUzU5QTNP?=
 =?utf-8?B?ckIycEcrS0tUTU0yK1FtVE5PYlliSjQ0OWsvTjdlekVXcGJEUE1QQnpyRFFZ?=
 =?utf-8?B?VlozTWpRbEdBa2ZmSnRFREU0QjF2R3lwMXBMbFBTYVpRdU5QSUd0WnFHWDYz?=
 =?utf-8?B?c1VUMXRkZU0wSG9hMEh0L3pMakJCRzZ6Y2lwOGxUOGdSRm5WK2RTekJ3Um9S?=
 =?utf-8?B?RjQzVkU0UjYrQ3dlTE9xdTRZa01YdVdCamkwZGhmeHE0blFXWXp3bEZCN0VS?=
 =?utf-8?B?aXRBQm0yT3orZnJXdWZJSlVwVUdTeGZMQjdTL25jSjU3L1hwYVB5aGJud3lY?=
 =?utf-8?B?ZXpDa21TUnlCOFBxeENSZDU5VUg3Nk1ZZGp2MVMvOVB1dFFKbHVySm5VMmcr?=
 =?utf-8?B?THY5N0hOUFJKcXhtRG1leFNvZHN2T0c0TUZ5eitvNmpyM3ZhU1lyMGs2azhH?=
 =?utf-8?B?UUJXSWRIUUxvVXZ6Q0diKzBTa1p4NGw0OFJ3czViVzEvVFFWMGtJb09ySEJG?=
 =?utf-8?B?dmh1MWhMZTFpSVdRVHFxRkI2S1V5dDNPeXIrb1RxWUgzVEJidWdjK1czdFhE?=
 =?utf-8?B?U2tXT1B0RlRWYk4wdGN2ZmJlbUgxMC8yTnIzRVJ1TVFvYWE0Mmw4aEFDcUdT?=
 =?utf-8?B?U0VoQ0JNT2kyMjBzVWxUL2dBOHdDYTRYTWtkNGk5elJFMlJVR1lpSWJVQ3lw?=
 =?utf-8?B?UEZGcGU0d3A1SEN0K2trd2dBZERndGtWSmFmT2FHeXF3RG1Gd1ZTeWRnMXFs?=
 =?utf-8?B?aUpvRTdlVGVIZ3lneHdpVHl1VzlMVWtOTWtkYWVNT3BFVWw2ZmJFK0M0QzNL?=
 =?utf-8?B?YzJvS1krNEUvNDUxMC9WTEcvMHFNeXc4N0RjYklWN3JVV2VYQ3hYaTFpR0tU?=
 =?utf-8?B?c0N0VFhRbXRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW9uUUF2Zy9xTE1YdEhoTWJnYW53dHc5enMwSHNDejJBR3BnQWJDVi9PT1o0?=
 =?utf-8?B?bkI5aW1pWDhHMTI1dnBnTkdOUFkxRkQvOGFhUld5ZzdKSjR6RWVBVE8yTVRL?=
 =?utf-8?B?MjlORU82b09rVU4vQzc1SnZGZWRBVE00L2ZhYVpKSkRzVEg4U1pnTzBJSnNw?=
 =?utf-8?B?S0lSOENUdDZnK3BIQ2kyK1pUWU8rQmNUSjlsc3ZHYzJjMnJFU09hdDhLSWxr?=
 =?utf-8?B?eXR2bnpLaFdCTitXSGViS2pxbTVWRjZ4cDRnVTRUdGVzOUY0V3NpUUZvelJI?=
 =?utf-8?B?L1VLZUdBLzdBb0ZCRVgvZUVUOHUxdG5pUjd4Z2c5Wlk1VEpPTXRhdXd0NitI?=
 =?utf-8?B?OUd0c0pYZEdwYkM1SXY3aXJZSmd5TFh0eFNUMGhWWDRSd0ZsaGxPc0lwZ0hp?=
 =?utf-8?B?aGZtWmF2bFdTcFJtem1jWHhmQU9IL3pLMUtpVW1zU1IvRHpkaEV5YStJcUp6?=
 =?utf-8?B?elBlMGJEYUhWTXl1a3NLU2NXNjVZZVBWemZsQTJDZWlxKzRpcDlCSTU0TmVE?=
 =?utf-8?B?a1pXMXRQaUNMN21oSTFQMm5TZi9qejhtZHM2Y1Q3cnB2VHdFWGtXVVhFb2Jq?=
 =?utf-8?B?UjJlV0MrTTF2OEF5N00zVDdlNTQ3K1lQWWFFU2hIN0ZnMjF4QVJ5SGZPT05E?=
 =?utf-8?B?RHBFZkNCNExNZU5DRWtNMEZJZVQ3UnNEYk81K25Yak5SODZFanZVS1ByTU1O?=
 =?utf-8?B?NzdEbllOZHlkMnVzZ200MkRyUmdLUHMxdGsvb0RwMThzWEFkNW5MT1N1UkQ2?=
 =?utf-8?B?OXFiYnAyRVhjVVkxNkJ5QngyaWlMQXJYSlpZRU1RdE1FcitvSG9zOXo4Mkli?=
 =?utf-8?B?YXBHdjBvSXFQWjFzbGFDM0ZJdmkyRUtld2lQZlJ2U0VheW5wV0Y0L0F3ZU5D?=
 =?utf-8?B?WUROQk0wZzhCa2lqZjBBcTYvSnlZZHdrNGdXNHlzNGoyK1RtcG1hZXlxU3pj?=
 =?utf-8?B?QStzWklWQ2FWL3YvUWZNZDh3cDZPSE9QM3NjZDJscVVGSGlZeXRpV0pXOGJU?=
 =?utf-8?B?NHhKdm4rYW9URmtxWmsvS3JRTFNZRFBpdTVOWFdiK1ZRTzZTc0dYSVRKSjBE?=
 =?utf-8?B?Uy9LOXJCYnNmWjNZRTNZSzZwa09ibk53c29ZZ2kyWExyUlpybmNRQnUwbzJu?=
 =?utf-8?B?MzQvMzlaM2dyT0tMVVVhci9qTEd5RlQ2dGVRNVFWL1hTZ0J3NmpyMmRGRUZN?=
 =?utf-8?B?akJTK3FPRDR6cVZzSXNtcnBjQWdyNVF1eWRVSlNHMVMvNFJCcjBKdGdBS3h6?=
 =?utf-8?B?REtYbnBQN05scVJ2NkpnZXlCRStzT2JpQVdwdW96NXhKMk5UWkJzd3VOTmNN?=
 =?utf-8?B?MEVCRDVIWS9ZUGEvdXZVVUtUYkprMEJDY0hETld5OWNuanYzOFJXT1B5ZDVz?=
 =?utf-8?B?OTlDZ2d6VThPWG9HNHhYYU8xd29FcnZhSFQ0V1lVNGs2N252Q0JFOWVVYktP?=
 =?utf-8?B?NnFrVjJiTHVtYlJqOXc0U2lqZHFrVFdubHozWHJkbkFMeVdoYVZCZk9kZE1v?=
 =?utf-8?B?Q04zbTNmV2U3TnE0dm1SUUhqMDRXYWkxMUt3Y2JOYVNzeEVxTHQ1UjBZMjk5?=
 =?utf-8?B?S1YzL2doeFdNQVVzeGZEU0ZDdkhuT3I1SXBmdlJiWWlBM3RiWFZGQTVGbEp3?=
 =?utf-8?B?b1NQZE5tUWROQ0JHR2hHRWI1eE4wcGR0NnovR0lwdHRvSFlvaGxJRzdIQUdX?=
 =?utf-8?B?ZG5HdkE5Y2lLRytVWmFUeVJDMUMrbTJQaVQ1TmhITy9rVFpoSjVwcmUySTUx?=
 =?utf-8?B?bkJwbS9Ickxoc2ppWXpDSHk2WEY2WHd2eHlQdmJhRFF6eithbVRoUXBURDhF?=
 =?utf-8?B?VFJ5RDhoMWxuZmw5azNYZkxIZm5LWDdHdGlnODE2MThHTHFld2lWMThMMmlz?=
 =?utf-8?B?S0dwRjhuOFpNOWZldm5UTSswNGx2MmVaaDI3SGNnbExRVGVnZUNBMDYrU2w1?=
 =?utf-8?B?eExnNXlKMTAwZjVtNnZOSEZnQ1BGa2lEeVFITzZPVmRwU2pReStkeEhpQzF3?=
 =?utf-8?B?a2V4QjBSaDg2UGM3WHFJQmRLcnpaQkV1QWVWU3VJcHJmaVdrK3gzTkt2OEJ6?=
 =?utf-8?B?YXlKS09nS0lUR2EyazlqRHlHK0tjZ2RmUER4aGdkVzI2ZFg2RHJqWFRnb3d4?=
 =?utf-8?B?UlUxc1AxMGx2T3JqbHQ4ZXdhMkxZTWNWZHUrdnBtaXhpWVFPQWdpeTlOaDZQ?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d2e41e-ef54-4f05-6f9b-08de0ce69ed2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 19:02:58.2758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGhASRhsltEbRTGNSvDO5zmRSmXPNK2awhqvSgLnGC5eJ872J1al5zfD1nk8EJGZpzSBoC42TmON22Vo8zyv62wz6qohQogevsDnSLlkfHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7208
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



On 10/16/2025 7:49 PM, Gustavo Sousa wrote:
> Members dma_mask_size, va_bits and vm_max_level of struct xe_device_desc
> are all expected to be non-zero.  Add checks for that in
> check_platform_desc().
> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
> 
> Michal, I added a "Suggested-by" on your name because of [1].  Please
> let me know if you are okay with that.
> 
> [1] https://lore.kernel.org/all/43c824c1-dbfc-48b1-9c90-389e3bf24c9a@intel.com/
> ---
>  drivers/gpu/drm/xe/tests/xe_pci_test.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> index f09efb523b7e..a4dbc8ddee43 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> @@ -50,8 +50,13 @@ static void check_platform_desc(struct kunit *test)
>  	const struct xe_device_desc *desc =
>  		(const struct xe_device_desc *)pci->driver_data;
>  
> +	KUNIT_ASSERT_GT(test, desc->dma_mask_size, 0);

nit: maybe check against 0/false using:

	KUNIT_EXPECT_TRUE(test, desc->dma_mask_size);

> +
>  	KUNIT_ASSERT_GT(test, (int)desc->max_gt_per_tile, 0);
>  	KUNIT_ASSERT_LE(test, (int)desc->max_gt_per_tile, XE_MAX_GT_PER_TILE);
> +
> +	KUNIT_ASSERT_GT(test, desc->va_bits, 0);

	KUNIT_EXPECT_TRUE(test, desc->va_bits);

and try to test the upper limit too (where applicable)?

	KUNIT_EXPECT_LE(test, desc->va_bits, 64);

> +	KUNIT_ASSERT_GT(test, desc->vm_max_level, 0);
>  }
>  
>  static struct kunit_case xe_pci_tests[] = {
> 

but not a blocker, and still move in the right direction, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


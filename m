Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA75EE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 19:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2626F89263;
	Wed, 11 Sep 2024 19:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AemgI0PU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C401889263
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 19:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726083366; x=1757619366;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7SNSYhohSHY0K61NTYah5lR26wAsJi4v0Pu4wwYF6fI=;
 b=AemgI0PUeiXLR+gBVZah6zObTVa5BNZ9aQFsB74+k+Xa8QGnMhigDpR/
 yebC4USgTefSEwyikZHoS6CvOoUYBotDldeqVAhLaPNAFPIFKCMJOVmlv
 JvtaCLzG0iJurLtKrMwoYfcl/jiF3ppViPvUq2X5KjQ2Eegq2guyTlCo5
 uD6TuXya+Qc8wz/oImDPOHApt/KDmI1XJX61cq7wInsxyvN5fdb4rpSVA
 aco4CDAnlJ7O9fMkH9UhcF+nrhD0IIcP+wpfOuAAP0xpmD018YQWtTW6K
 tlR4NKVrKPQMcsmd6jKLr17YEpnQQfzodyGRtKE39yWbqEsnxoehaZRlU g==;
X-CSE-ConnectionGUID: ecipV7RoRsCrHo7d+AsEhQ==
X-CSE-MsgGUID: l3uxHOv1QxOBvJtqIWgojQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28792024"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="28792024"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 12:35:55 -0700
X-CSE-ConnectionGUID: TI9KsksUSfamyE8SsmMxnw==
X-CSE-MsgGUID: Fubp99gwTPujCH4opz6oGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67307456"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 12:35:51 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 12:35:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 12:35:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 12:35:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/RQtaBedNON9hTrs8DJGTPEvrL7R9Zk+i+N5SXThlE0qDMaZ/DK+PIP7nVdQt7zPOznRSiRxrD5SvWZ4U3P5F15IfTfctgejFCx4IJAzTDsimE5HOAz7nAbDdmICrpQuEcjRPjWpGY7UrQ1eHT7HnWhtldyyTx1KQoV+OVm03CvfYFe+W1DnDys0ITpEHIlDC5dhnCo1T6b1xXrEU8TGkDUVTYsn6ZcjIG5wm4Sz5dS66+4CQEwlNPawepROSQ072+fchE0PfNcCCP+QYoT4mGg3ElfuMXUba0Z18qm1suJza43a02CbILm04bCG4q0bIctc4lFM2Oe4ZKH1RIAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiGJzLnpL9AY5Y80MWIJuSixQTLV0Y+OjXJONkr8wgA=;
 b=elMJ55s912OACyK7pyN1iPVZ5bs9uQ2tik0COXNadoPda/TSXKbhNXhMM3ib+67/RZmjvd3FoY+JLPZsk1fEMOVj7C/e71JLro1guAFMjL22TGX37UvlQ84mWQazERxlBRq0G9jmo/l22AbXvvuU6ahzboxOhFO7ypp9NqD9lWmtax2JIvI+r3bxSC40Uj2K3uGXJfzMqRV3k1RVrsG9R8OUKQHjikq30fEPFeOERaGyEa4o+5vyAzjg+N6uyC+L9TNe7VLVEUXohQBHLdXcgMl1MUxduAb2xSj/HgUUVwWAAmqZi/aE51uvVsr2G2CRXHXcZeiDqwweh7XAYGXFhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 11 Sep
 2024 19:35:45 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 19:35:44 +0000
Message-ID: <7c75dda1-e62b-47ff-a6e2-0da2f080126f@intel.com>
Date: Wed, 11 Sep 2024 12:35:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "Intel-Xe@lists.freedesktop.org" <Intel-Xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
 <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
 <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
 <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
 <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
 <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
 <61ce4887-9cc6-4e46-9412-958c992305a9@intel.com>
 <3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu>
 <34c59c0413c51d574baa39a62a735d0de67f8a2f.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <34c59c0413c51d574baa39a62a735d0de67f8a2f.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22)
 To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ0PR11MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fc06fd-1e72-47cd-46a7-08dcd298edc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkVoVGh3QmVDVWlEbW5xREo2Ky96MlRYRTFrdmJxQnRIRXNpcVFDMjEvYmhK?=
 =?utf-8?B?VW1NQ2RlSmkrMlJ5bDRzZmF3dlB1OGd4LzJ0UkUvaElwTmNBNko0THFIZm5r?=
 =?utf-8?B?ek1yVVNIaVhId3pMNkcxc3Z6Z2hPRWIxdjhNb3RSMUMwNVZ4VVd1aFNvM2dn?=
 =?utf-8?B?am1WVVNQTml0S2FjNHRwVnJPckxTcEREejBSMUFudFNycWswZXZJK0wrVTdp?=
 =?utf-8?B?NEk4dEpxMzdJQUNUdkRsUkNqSFN4OE1JZW5wbDFUU3JUK2JmSXhaR21VVURZ?=
 =?utf-8?B?Y1NPWVcwSkpITUZ4RzNFNmpWTGNwM0xyRTdsTUtVbEZVcHdEWmZxOTdHck9N?=
 =?utf-8?B?cVB6aXB5c3R0TmlCcVBEOERyNm15M1p1bzRwRDNVb2pLTllCUlhjYnNPajFJ?=
 =?utf-8?B?OFJXNnZTZGQveTRQak0vd2FLQUhKaHdKT0lRVkZoS0pBMUV0c05pZndHUHhz?=
 =?utf-8?B?THhhRkV3cmM0NlFMRlN1N0RFd1pPNFpBN3RwUVJoQ1FlUlhENnB2RUJXWlRp?=
 =?utf-8?B?Y3BJNGlSM01JWjRnOFQ1bFRwWkdQUDVqakl3cUc0UXFhSGVHckhaS2lLVzhz?=
 =?utf-8?B?aytweUlsYlY1SXZRbzA1RFAzaHhlNkFqbVlwRzR6WkRtUUYyeDJZdzI5eUxu?=
 =?utf-8?B?Nkk4dmpqK0wyNk9CTkNlSHVvcXVjSHhjdGpKWE92aEFaTTMzS3QyN3JwL2pH?=
 =?utf-8?B?NEpPU2JZWkkyUnJjSVB2aHVpazBydDRmcmV3bCtVUWwvcTI0dTRaY2l6Zjkz?=
 =?utf-8?B?cXkrOEE5WFJhbE5KZHZSWmdnVDlnY0ppZEgzTUNQbmZ0OWtJRjhRTkdrOW9l?=
 =?utf-8?B?bFJ4QVpFUlNBK0xjTFE2bWdxbjRJYVFvRjVoMGV5VUpZZ2FwY3kxR3YvVWlW?=
 =?utf-8?B?VFhjOG9adW5MNCtMbzc4bXprL0hzUWtsWjJsUVptVFZaU3BmaGZmYjlZVHBr?=
 =?utf-8?B?ZkdPUHZjOXo1ejdHTWRjK3pSZUFmZ0dQZnFXSDlZbW9sVG9JTDR4SVJaWWo2?=
 =?utf-8?B?OWlXVmdSdUNpNHlmOFRLd3BYVlhnY2dNeFl0dXppRmlucEFVOTV4RDRoQSty?=
 =?utf-8?B?NFRoR0pUQlA0U2loRDJsT1ZLZUxqeFdHK0kvbnNIYWJvMnNjUS9oeTlpOUln?=
 =?utf-8?B?NU1USC9hZmVCZlBXYnlCMGRTZEhWWlZBYVlKNjlDVmE3QVd0L0w1RzE1cGFZ?=
 =?utf-8?B?MFAzMkJxYXlHblZRdTNOanJHODN0UUFyYlVQM3ZOOXd3SFAxOWdWWXhjRGpC?=
 =?utf-8?B?Wk1rbkxhaTVWSjkxQkF2WVdzdUpTb3k0c1hIVFFZNmhobmNPRWxpL3ZkMmMw?=
 =?utf-8?B?NGFSUWwvSFEwTFRXRWJkZ013UjJadm01VEU5WURlMlJxWkdJSEhvSXhESkJk?=
 =?utf-8?B?dDNlT29kNk9aMmcwTWpSTHVxMUkxNUxGS3dHWlZseXUvOHZhUW4wTmVlM2k1?=
 =?utf-8?B?SkgySWR2cmhSYk1iRlZvUk8xZXg1eGhDWjMvNDQwSUFhY0czNDdURXE2dGtB?=
 =?utf-8?B?OEh4NC9HMGtQbU9MTXlGOXlkNWRYNXowOHBNSUVydWVzZHFFVytXT1dmRC9M?=
 =?utf-8?B?T3JOcEJFRFZseFNOMFZ6Q3M1VGlBdVI1ZjdMTnVkVlJJK1lUSVdRNDhSRGJO?=
 =?utf-8?B?RjN1Zm5pdUxiRitUaEo5WGx0ZEZWOUhWMnBFK0w4TEZvR1psWFc1UEh5VzN0?=
 =?utf-8?B?Uy9WQkVCRzhudTEwd055TnVaaCtGa3BTR081bk1McnV3emRYQ2R3TkVaQ3lZ?=
 =?utf-8?B?K2o0L3ErUG5xbmcyL2NhVnJkYmd4ZHg5aUROcytrbzRoYk00UTc1RUFjSitN?=
 =?utf-8?B?Z0RQN3RlbmZZWTVQTys4QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFVFbG01UlQvYVdTM2c1YWNQdVhQVElreEtKMGFLa29IeTJRaUxRSFowUFBz?=
 =?utf-8?B?OWwvSGN0bitkUVpvQzh3YitPb0xaNFJUcEF5MERsS1B1VW1velhDcVIzci9V?=
 =?utf-8?B?dTdsUlJTQ1N1ZUYvMHY5Ukgwa1g2K0NUNWErYlJMc2x6eWh5a1I3dnlPR3Rj?=
 =?utf-8?B?Q2lhK2tVbmxJdUw5V2lTbkt0N1JhVkUreVN1MWY2UERGcFV3Q0s2UWVwOURw?=
 =?utf-8?B?UTRhUDFxVGY3bGZ0bklwQ0tqc21mWlBKQzRoeDdka3dma040ejRTZDA0R2hY?=
 =?utf-8?B?cUwyaGg0RFVaVFpKOHRaYnlZNHR4UlVLMkZCenhRdncwdEFqb2EwQURNTHpa?=
 =?utf-8?B?SFlRZDJtOEtpb0JSUjNJbldEakl3eVFrVFBxdzNQVHFKbS9BWkxMNGJoa0tQ?=
 =?utf-8?B?eFNCTmUyV2RJRjFWYnkyMXlzMEZjL2J1dy9ZR0xqTmRQSW5ZU1lsSVBPa2RT?=
 =?utf-8?B?OTU2Y2hsVXJDays5cmhHTWtQWHZ2K2lEUGh4cWpmNCsvM2poa2RGa3U1QzBR?=
 =?utf-8?B?M2lDRzVFWVJqT0VmL1kwRytmSUVvSjVEUVB3S1dNMFhjQkdXY2lKd0ZQTTVu?=
 =?utf-8?B?L2w2dGdYa0hvMCtEVnBGbG52WnVPOVVrTG5ZVUIwWGtPTExNdUFTU3BFMWtw?=
 =?utf-8?B?cFhXUkhrNGJpU0ZTOXJxelUwL1Q0RnAyTnpmY3k4dVRGNWVqRW5PWEJpc3BR?=
 =?utf-8?B?OEZMUmNPdm5pWWI1cFlsdWgyK1ZXMmxFOWtjU1FIblZDYnNGNXpzYUY2bVRY?=
 =?utf-8?B?Y0o3dWtiRGEwOHpVQW9EdXNwWXFzRHRLQ1dGTUFIVVJTY05rSVptNzg2eUw3?=
 =?utf-8?B?cEtta1B3TE5mK01CSXFZVmhSZHhraWdocTFrUjdUT1dVUFRDSDBKRlNjSU12?=
 =?utf-8?B?QXh5dkxPY2txci8wTHlsMDhMYTNDeklRK0FxNDIxZUNjTHZLaDdKSWxQNlZO?=
 =?utf-8?B?NjBmcVV6aDlaTUlhdEZ3bElFOWdva1NlMXdVRUhKZC9md2ZhOWZrV2pyTXBn?=
 =?utf-8?B?SEZqeDdINFlOdGF4RG1kYmdudDFHdGxMLzg5ZXJiS05PZzhXZndOcG55VDZr?=
 =?utf-8?B?MU1lWHpEQ290NHQ4ZzVwN0k5ckVoOUxxS2FEb0QwR1c1NkptaDdQdVhwZlFp?=
 =?utf-8?B?MTdYREQyQmNMbmZ5bXJQa01oRlM4NlYxZGJRNWVxcURYZDhuNXkvVk53OVBq?=
 =?utf-8?B?YjZMWllRTXdrMU05OFhicnlzbWMvWld6aHFsUjFhbGpZdnFqclljVUxESkdh?=
 =?utf-8?B?am1heHR4Tnlubm5OUyt3SHBxY1YvWTF0WEpORnhVRU0vNDcxbUZuaEU5cGhh?=
 =?utf-8?B?Nm5Cdzc0YVpRbDJBd1BYY05sTlZuNCtzblIrOTk0V3VFWWRaVGFTNnJ5Z3Fn?=
 =?utf-8?B?UUdtMFpmdmFpeDJGNE5Jd0dBekdKVlNRZ1Y3NFE1eXI4M2RCTGRjaVFpRE5O?=
 =?utf-8?B?Q0dLYXYvK3VjVlVZT3M1UXlabGpHNHU5Skd1d0NTNHJKeUlPSlhlcnR5alc0?=
 =?utf-8?B?UVBpZEdLd3REY29IcEFRUUl5VkpZa0V4R0ZwcmJpdm1RamJmbWNuRmNjRExu?=
 =?utf-8?B?VnI5bWcwWkV4ZXRoUXR3dUg1VXlZQWFlZnA1eWNoc2NkQ1k3aFVQYWt5ZnNp?=
 =?utf-8?B?aUZ6TnU0MDN6aEVuOTVlbzYrMjV0Tm55anhwUTJvRHZGdUFRalYzZVZYOVdu?=
 =?utf-8?B?ckVmL3U0RUdtYlhiUUVHZ0VUbmVFTnF2ZVlPeXRkYmJablVoczdlTS9tUTNL?=
 =?utf-8?B?OXd4bWtpRlMyMEIxRmVTYTZVMkdsa3hYT0xyTDQyVGp4ODVFOUhYZFlZUXIx?=
 =?utf-8?B?UHFQWnRxdFc2ZnFNNC9iRmVHQzk2VmJxbEFadmdpMENKOE5CZW8xN3JjVkpS?=
 =?utf-8?B?T1lHcXZ5a0cxMGUwak5sZVFUTmlmcjMrWVVNUy81VGxmcEd5bFRiY0JRWkFI?=
 =?utf-8?B?all1d1JWeFJYSmNmc0RrNEFJNDdtbUVUVWNFZnBOOWhQR2dVOGF6OXlhei9l?=
 =?utf-8?B?bDlENzg4YTNXMjVyWVI0WkVTbFJnQ2k5bXhML2tOS0FvUXBxSFV6YU43T1Qw?=
 =?utf-8?B?N0FqamZIWi9NUGpWZFVSdVM0SExSNnZueUFUSTEzK2FDaXo1VFQzaS9uOE95?=
 =?utf-8?B?bVBOYVQ4bEpNVkZHazVPcG5jemZtWlRESE9QcXJUaExXbEkxUzdYbWhFQWZK?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fc06fd-1e72-47cd-46a7-08dcd298edc0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 19:35:44.7324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JRZH7U+2bytXAar6aQ8YNNu610vd+EMrh4lXU/bsxxtQECnyj7bCel4x+0O4A6mWy+3SxGVUxa0aID0haXcUz5z6XTGHjX8SJqaECDk938=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
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

On 9/11/2024 12:30, Souza, Jose wrote:
> On Wed, 2024-09-11 at 14:12 -0500, Lucas De Marchi wrote:
>> On Tue, Sep 10, 2024 at 01:17:11PM GMT, John Harrison wrote:
>>> On 9/10/2024 12:43, Lucas De Marchi wrote:
>>>> On Mon, Sep 09, 2024 at 06:31:41PM GMT, John Harrison wrote:
>>>>> On 9/6/2024 19:06, John Harrison wrote:
>>>>>> On 9/5/2024 20:04, Lucas De Marchi wrote:
>>>>>>> On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>>>>>>>> On 9/5/2024 18:54, Lucas De Marchi wrote:
>>>>>>>>> On Thu, Sep 05, 2024 at 01:50:58PM GMT,
>>>>>>>>> John.C.Harrison@Intel.com wrote:
>>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>>
>>>>>>>>>> There is a need to include the GuC log and other large
>>>>>>>>>> binary objects
>>>>>>>>>> in core dumps and via dmesg. So add a helper for dumping
>>>>>>>>>> to a printer
>>>>>>>>>> function via conversion to ASCII85 encoding.
>>>>>>>>> why are we not dumping the binary data directly to devcoredump?
>>>>>>>> As per earlier comments, there is a WiFi driver or some such
>>>>>>>> that does exactly that. But all they are dumping is a binary
>>>>>>>> blob.
>>>>>>> In your v5 I see you mentioned
>>>>>>> drivers/net/wireless/ath/ath10k/coredump.c, but that is a
>>>>>>> precedence for
>>>>>>> including it as is from the device rather converting it to ASCII85 or
>>>>>>> something else. It seems odd to do that type of conversion in kernel
>>>>>>> space when it could be perfectly done in userspace.
>>>>>> It really can't. An end user could maybe be expected to zip or
>>>>>> tar a coredump file before attaching it to a bug report but they
>>>>>> are certainly not going to try to ASCII85 encode random bits of
>>>>>> it. Whereas, putting that in the kernel means it is just there.
>>>>>> It is done. And it is pretty trivial - just call a helper
>>>>>> function and it does everything for you. Also, I very much doubt
>>>>>> you can spew raw binary data via dmesg. Even if the kernel would
>>>>>> print it for you (which I doubt), the user tools like syslogd
>>>>>> and dmesg itself are going to filter it to make it ASCII safe.
>>>>>>
>>>>>> The i915 error dumps have been ASCII85 encoded using the
>>>>>> kernel's ASCII85 encoding helper function since forever. This
>>>>>> patch is just a wrapper around the kernel's existing
>>>>>> implementation in order to make it more compatible with printing
>>>>>> to dmesg. This is not creating a new precedent. It already
>>>>>> exists.
>>>>>>
>>>>>>> $ git grep ascii85.h
>>>>>>> drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
>>>>>>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
>>>>>>> drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
>>>>>>> drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
>>>>>>> drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
>>>>>> And the list of drivers which dump raw binary data in a coredump
>>>>>> file is... ath10k. ASCII85 wins 3 to 1.
>>>>>>
>>>>>>
>>>>>>>> We want the devcoredump file to still be human readable.
>>>>>>>> That won't be the case if you stuff binary data in the
>>>>>>>> middle of it. Most obvious problem - the zeros in the data
>>>>>>>> will terminate your text file at that point. Potentially
>>>>>>>> bigger problem for end users - random fake ANSI codes will
>>>>>>>> destroy your terminal window if you try to cat the file to
>>>>>>>> read it.
>>>>>>> Users don't get a coredump and cat it to the terminal.
>>>>>>> =(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Lucas De Marchi
>>>>>> They might. Either intentionally or accidentally. I've certainly
>>>>>> done it myself. And people will certainly want to look at it in
>>>>>> any random choice of text editor, pager, etc. 'cos you know, it
>>>>>> is meant to be read by humans. If it is full of binary data then
>>>>>> that becomes even more difficult than simply being full of ASCII
>>>>>> gibberish. No matter what you are doing, the ASCII version is
>>>>>> safer and easier to look at the rest of the file around it.
>>>>>>
>>>>>> I don't understand why you are so desperate to have raw binary
>>>>>> data in the middle of a text file. The disadvantages are
>>>>>> multiple but the only advantage is a slightly smaller file. And
>>>>>> the true route to smaller files is to add compression like we
>>>>>> have in i915.
>>>>>>
>>>>>> John.
>>>>>>
>>>>> PS: Also meant to add that one of the important uses cases for
>>>>> dumping logs to dmesg is for the really hard to repro bugs that
>>>>> show up in CI extremely rarely. We get the driver to dump an error
>>>>> capture to dmesg and pull that out from the CI logs. Even if you
>>>>> could get binary data through dmesg, pretty sure the CI tools
>>>>> would also not be happy with it. Anything non-printable will get
>>>>> munged for sure when turning it into a web page.
>>>> I think that's the main source of confusion on what we are discussing.
>>>> I was not talking about dmesg at all. I'm only complaining about feeding
>>>> ascii85-encoded data into a *devcoredump* when apparently there isn't a
>>>> good reason to do so. I'd rather copy the binary data to the
>>>> devcoredump.
>>> But the intent is to dump a devcoredump to dmesg. It makes much sense
>> It seems like an awful idea to dump hundreds of MB to dmesg.  When we
>> talked about printing to dmesg it was about **GuC log** and on very
>> initial states of driver probe where we didn't actually have a good
>> interface for that. And the log wouldn't be so big. If we can already
>> capture the devcoredump, what would be the reason to dump to dmesg
>> (other than the non-valid "our CI captures dmesg, and doesn't
>> capture devcoredump", which should be fixed).
>>
>> If any sysadmin have their serial console flooded by such garbage there
>> are 2 reactions: 1) someone got in control of my machine; 2) something
>> went really bad with this machine. It's not "fear not, wait for it to
>> complete, it's just normal debug data I will attach to an issue in
>> gitlab".  And I'm mentioning a serial console here due to that
>> cond_resched() added, which is only needed because you are trying to do
>> in kernel space what should be in userspace.
>>
>> Oh well... looking at this the main reason to use ascii85 I can see is
>> because we already have parts of *our* devcoredump using it, and
>> userspace relying on that. That's new to me. Let's stop bringing dmesg
>> into this discussion.
>>
>>> to have a single implementation that can be used for multiple
>>> purposes. Otherwise you are duplicating a lot of code unnecessarily.
>>>
>>> And I still think it is a *very* bad idea to be including binary data
>>> in a text file. The devcoredump is supposed to be human readable. It
>> no, it's not. devcoredump doesn't dictate the format, it's up to the
>> drivers to do that. See their documentation.
>>
>>> is supposed to be obtained by end users and passed around. Having
>>> binary data in there just makes everything more complex and error
>>> prone. We want this to be as simple, easy and safe as possible.
>>>
>>>> For dmesg, there's a reason to encode it as you pointed out... but
>>>> no users shouldn't actually see it - we should be getting all of those
>>>> cases in CI. For the escape scenarios, yeah... better having it
>>>> ascii85-encoded.
>>>>
>>>> What you are adding to devcoredump also doesn't even seem to be an
>>>> ascii85 representation, but a multiple lines that should be concatenated
>>>> to form the ascii85 representation. For dmesg it makes sense. Not for
>>>> devcoredump.  We should also probabaly need a length field (correctly
>>>> accounting for the additional characters for each line) so we don't
>>>> have an implicit dependency on what's the next field to know how much to
>>>> parse.
>>> The decoding is pretty trivial given that line feeds are not part of
>>> the ASCII85 character set and so can just be dropped. Besides The
>>> output is already not 'pure' ASCII85 because the ASCII85 data is
>>> embedded within a devcoredump. There is all sorts of other text about,
>>> including on the start of the line. There are multiple ASCII85 blobs
>>> in there that need to be decoded separately. This is nothing new to my
>>> patch set. All of that is already there. And as per comments on the
>>> previous devcoredump patches from Matthew B, the object data can many
>>> hundreds of MBs in size. Yet no-one batted an eyelid when that was
>>> added. So why the sudden paranoia about adding a couple of MB of GuC
>>> log in the same form?
>> I suppose you are talking about commit 4d5242a003bb ("drm/xe: Implement capture of
>> HWSP and HWCTX").  Probably because I haven't seen that commit doing an
>> ascii85 encoding before, otherwise I'd have similar review feedback.
>>
>> Looking at this just now, so I will also have to balance the previous
>> users and existing userspace consuming it.
>>
>> +José, would it be ok from the userspace POV to start adding the \n?
>> Then we can at least have all fields in our devcoredump to follow the
>> same format. Are these the decoder parts on the mesa side?
>>
>> 	src/intel/tools/aubinator_error_decode.c
>> 	src/intel/tools/error2hangdump.c?
>>
>>   From a quick look, read_xe_data_file() already continues the previous
>> topic when it reads a newline, but the parsers for HWCTX and HWSP
>> seems to expect to to have the entire topic in a single line. But I may
>> be missing something.
> Sorry I'm not following up this thread.
> Add a '\n' where exactly?
To break very long ASCII85 streams across multiple lines. That will 
allow the devcoredump file to output via dmesg for the situations where 
reading from sysfs is not possible.

This patch is adding an ASCII85 encoding helper that is more friendly to 
output via dmesg. The patch does not currently change the existing 
ASCII85 encodings of VMs and hw contexts. However, the intention would 
be to update that code to use this helper eventually.

John.

>
>> Lucas De Marchi
>>
>>> And again, arbitrarily long lines (potentially many thousands of
>>> characters wide) in a text file can cause problems. Having it line
>>> wrapped gets rid of those potential problems and so is safer. Anything
>>> that reduces the risk of an error report being broken is a good thing
>>> IMHO. Robustness is worthwhile!
>>>
>>> John.
>>>
>>>> Lucas De Marchi
>>>>
>>>>> John.
>>>>>


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0FDD1CDD2
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC9010E1B4;
	Thu,  4 Dec 2025 04:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRI1T65g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E74510E1B4
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 04:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764822624; x=1796358624;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PDSck/+O6nIYiuSyMkfoM01lBNbq62ByU3DB6UpBDZs=;
 b=eRI1T65glUbjWWYgWo+ggx/06m4P09gxXv6uyjK4wdY2Ij3/0ZdVuUtn
 VQ4x7/0f68rACk1TZD3ldlQiNaIQgZ0VxZgRUXkN8VWZsJpC3FzxFfKFw
 7r5lxDbPSnnMob7Q6j1g99oJ6ajYRiPkgsXbLzuqxmtPq9WjzhFML8T7t
 lidjSxOvyuavsDdBx9eu60bPb769oxHti3bep9289CaJx4E/WqPa55tWZ
 VSOgq/MtLM7yFJDNX/ROJxjywVnwAEvYbAwulZ7DbtXjY7ebrVmtaK22g
 O/I6UJk/Ect7Lks9EE6sKHQgt0XDCf3Ybc24yAuIwFrqVXygpW6wfoW+C g==;
X-CSE-ConnectionGUID: FgnABq4lQ/6uYgwo+xLnRQ==
X-CSE-MsgGUID: omIaA2VXR+mwrvh5o6xMUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70686149"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="70686149"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 20:30:23 -0800
X-CSE-ConnectionGUID: QKQTP9yGRLKdVLnLKvF/aw==
X-CSE-MsgGUID: IlmWBj9JSOmhRQXquLgC9w==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 20:30:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 20:30:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 20:30:21 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 20:30:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcU0bj1qdIfXp77XSFPDDWfByogP9+ZOGmvmGT/zN+y0tRrB0iQXJbtU17fXoCHP6QutWaztcgIsgcqIQJOR5pNzqaUcuUhck4IbmM/BwFpWLWuRlN3qpQ5n4/Tl/r4fqEST7/6ytUaN3j9OW3Eu7ePwEhUt/S5X/VysReaVvK7cZFZ6txoctbxL2p5pmb8fmCOWJ3yDlrIq+lLoEvkvwydMfFHfZU3LXhe9N3r5PuAuhsoHDtK2sowr10YwTy0kn1EXCv7Tn5y9fPKq1dyP9dHPjSoOwhZ36BxU4z2v05h4R2F1D4htGak2K6GVqlsa9W3FFIF60exqKLmC5lpmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDSck/+O6nIYiuSyMkfoM01lBNbq62ByU3DB6UpBDZs=;
 b=hiboeDdpxKlHGtqLi430sfpIrczW/oIn9/GIXpu4rNfvm9HPTfON8syKlqBQduZ5gX1bPMQ9WQMHquGy2zKoOb1WUsvzludeN+AmAzIB5MlQclBtdm8Bsb1IPUcyFDooLQKKeH6zTbe1rJBAy5vZDbKvmhzVhPuilelk9oI7E+KvE9Cs33BE+WMo7zyCW43rXHTCT7v1v4IQY9ClekXx03hs1DB5X9Ac9UjXsFRaKh9M0+BzzBdx/tNI3RoynmXhbN2698vZiC5sAB7ZLFMrroKIn1IvpLdOforSeFW0y6y7HfHNUWEbUHp5maBnkl4LEgC67IJvLVzsidp9jC+P7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by BL4PR11MB8800.namprd11.prod.outlook.com (2603:10b6:208:5a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 04:30:14 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 04:30:14 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 2/2] drm/xe: expose PAT software config to debugfs
Thread-Topic: [PATCH v5 2/2] drm/xe: expose PAT software config to debugfs
Thread-Index: AQHcZKfN1JsktcmqYESgCDhe+kPMnrUQiu+AgABUoVA=
Date: Thu, 4 Dec 2025 04:30:14 +0000
Message-ID: <SA3PR11MB8046FC1CA452CD5ABFD81F8586A6A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251117230156.366860-1-x.wang@intel.com>
 <20251203225355.24972-1-x.wang@intel.com>
 <20251203225355.24972-2-x.wang@intel.com>
 <20251203231115.GQ4065316@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251203231115.GQ4065316@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|BL4PR11MB8800:EE_
x-ms-office365-filtering-correlation-id: 3f88f26d-750f-4d24-35f6-08de32edd1d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|42112799006|1800799024|376014|10070799003|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?QXVEQmtBVzR3QnNscTFNQkR1amo4UDh3bkhRa09LcGVCaGpueDNMOWZ3Y0V4?=
 =?utf-8?B?M2J6c0lzSXVwWTM5TzhvWkFRQW9lRzhHRngvNytQZGx0ZENQUHY4Ui9TQWNl?=
 =?utf-8?B?eDlRUW5vZ0dkTUZndHBudkNLV3NJOE1mSTd4TGZuRTA2VGFXaVYwMVNSZnN0?=
 =?utf-8?B?REhnSU1CZGRVd2hPZThMTW9pRFdldWc2U2QyTERJeUpFTUcyZFFxRWx1eThB?=
 =?utf-8?B?T21pT0xDbFFYVU12bnBBOS84eWxZWjZuekpwakZKd2szcGtNU0EzTFJTQm4r?=
 =?utf-8?B?by9ZU2lZcWlvYWplYmdISVJlMWliUkM2S3l6Nm9DU0dubmRQUTNFU0dXRzBQ?=
 =?utf-8?B?a2xad3h1ZHcydFpmVkdoQ2hTeGdSdU9jcHNDdUIwY0I3ZFJvc1NGNXc2WTQx?=
 =?utf-8?B?dUxaRGYzZEF6bzdDMVdqWVBmOEQ3SkJMckxoVmNubWNBUytmWUJvZU5BRzZP?=
 =?utf-8?B?Rjc2YkZna2VNdVUrczVWNzc2SWJxUGxYY2hFZ1pjbTRhQjJmYWpySUhxSk55?=
 =?utf-8?B?TjkvbzFkUThGMFFyZy9zWjgrbnZGcCtPQXNHdzQ1bzhnVzUxZE40ZXpZNlhu?=
 =?utf-8?B?VWpHS1VhZGlRUnB2NlVmSGZvM0tad29TWUNMbUhVS0xLQkIraTNaSTNxTnRS?=
 =?utf-8?B?cGJURDF2MndHR2VWRW5XUkpCWm1jMEUvNjg5TGg4Y3JPL1E3bk11VmsvdE56?=
 =?utf-8?B?MnhZL2MvaDJuOFdlWWRJVXJ2S24vRDJlbnVaYWRQb05rOGQzWUw4VU9zQmp1?=
 =?utf-8?B?RTdYRTBlMkFpNFBYZ3FDRDN5d1gxYXVjT2JhOWdpRCtrVEo5MVd4d3AxTkx2?=
 =?utf-8?B?WlpndC9nUk1wa1hVRDA3N3k4ek5Vd1RheVJRdCs5UUQvK2t5bE9McUk5ZGJY?=
 =?utf-8?B?RGRmYmJaSXk3NXRzMGY2Vjd2eGpaakJ0bjRRQUVGT2RWdWVJNTFrT2ZIRk5k?=
 =?utf-8?B?aEsxWmFNYUZBTTVpMTMvQ0ErQWdIRjE4NUM2TVVoaEtiWm1iaUc4MlZYdGV2?=
 =?utf-8?B?RHdKeUVMdXNlN0JJSWROUU9QVDRhN3IzcmRSNVVhb2o5WlNUbGtJVmFubzR1?=
 =?utf-8?B?VVJ2cEw4YmFDLzU3M0c3Tm9tUTdMWXBQTGQwcXRtRk94NGFpUGZWcnZyZVAw?=
 =?utf-8?B?Mkd2Vno5TWorOVNqT2tVcFJKc2tFVlpWNll0UDJJa1JIU2h0WElONkdYWHNS?=
 =?utf-8?B?ZTYzaGg4Si82eVFOY2l5aDZ5OFROVCtMUW5iYnBkWmlyTEZKQmM1cXQrYlhN?=
 =?utf-8?B?dlplMkxIZllxMG1ESlhVQW1NUVF6S3JaNW9oVTE4YmZKMFJiRlJzL1BjcnNn?=
 =?utf-8?B?RWpQT0QvYzUvN3lHcXF0SDI4ZmdVa210emttY2pqV0hablh2WWliR3h5Y2FC?=
 =?utf-8?B?dkgyei9RcXppcGwzMHJGcGtWMG5jUUc2RFVZeEtOeEx1QlJqeWtvZ3hsdHNV?=
 =?utf-8?B?OU9MVW14bUc3RForZUFCZ3F6bjZ6T2lONWVkKzFrVzExTnV6NUZ4UTAwOXVh?=
 =?utf-8?B?blVDVVU5K05BbGZvUW9VVk9yRStHNXRJTXpkUzVIcjZHV1o1OGZGa28xd0Z0?=
 =?utf-8?B?UmhONnBUTGZWcGRvWnA4aXltRDdMbTc1dEs1WTY0L1ZGb0xjQ1RlRHBNZkQ1?=
 =?utf-8?B?UEtyVGVOZ3ZuN2VSTzFMb1UvYmVzRU1lTlhVZTdub0RHUTZ1L3ZPbUdZYWxM?=
 =?utf-8?B?ZlBHdXUxWm9XMTFWZHZDMDRQbW1tUVQ5WFJYRlg5cXEwRkdSSE5veWp4SFcw?=
 =?utf-8?B?NElkUnRDMWJKZ1lrR1gzTWtCOVN2aE9Wd01qNGVhRVZLaDhSYitteUlNZ245?=
 =?utf-8?B?cDdwV0lDMGprc2oxQ2Eyb2JuWVhTRlQ4WnY0S2VtWk1KN2F0QmFkR1VVbGZI?=
 =?utf-8?B?THRmWERra0lleUx5QSs1T0plNUU5MG9YUU0vdzZ5ZlVvd0dZU3JHNXl2amsz?=
 =?utf-8?B?OWt2YXcwUDg3TjdKVXB2ZHhUSXBkL0VMZW9DOVJaVmlqYlpnM1NDMEowYjRx?=
 =?utf-8?B?aHZQaCtFSUc3TGw2L3ZNRVgrS0c5bkZ2bGMzNlh3Q1V5U1QvdzV0WVhqRkJw?=
 =?utf-8?Q?sf1wYu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3FIb0sxay9sc3lLR1dZeFlGM3NOdlcwSVRzZEFRc2V2MW5XVkdTVWl2bWVv?=
 =?utf-8?B?UW9ZNi9KeTJMd3hORllKVGlURnpyaUtuZU5IMmdCelhTejNGK2NnTXIydmli?=
 =?utf-8?B?d0Jla2QwZzBqcmx0eFZ5SVpldG9ESFRNOGtBbzlRZDdZM0tXWmZKNXI0SUxy?=
 =?utf-8?B?a3JiUmlLMnFSY2h1L2dIblVmSGNxTjkvYVJweDY1eDRINXp5UDNDWTByMkdG?=
 =?utf-8?B?NnJrZmRrWUJqT1hvaXZscGNtRlQ5a3BXbk54aHRNWkZvV1FleE9Gd2QyNUZV?=
 =?utf-8?B?TDJkVlQ1OWJIdDlqR0VvRC9JdkVSN2pSbm10TithdWdobW1RdFFnZFZXVDE1?=
 =?utf-8?B?TE94dWVVb0Iyc3NmTTBvOVMzd2NrajNqMktGVzBWOHo2ZkhEcHN5dnowbmpH?=
 =?utf-8?B?RWxRajFzbEdFMEQxaTdnTmpBK29icnV0VHROVzkzRExWeGU4SFlFenpEbitJ?=
 =?utf-8?B?MXNSTFBtQzM4aHJPT2N1bjBydW90bjlSQldLVWZCZUhOUWhNTWh6cmxhZTdU?=
 =?utf-8?B?TER5Um91RjUwc0djWjgxZyswcmxpbXZKZVlWbUUxcHg3a2hRUFRub0dQaC9T?=
 =?utf-8?B?LzhmZXhhbUEzL0FadUN0QkVQL2ZlWFdkNGxOOWZoblBOS3dQOTd6bldIRXlj?=
 =?utf-8?B?UDY0KzZOQVdJeVdjejhXUkIvYTNzQnhnU2ZvV3ZNNG5QNXMveXhhcEpnSmtC?=
 =?utf-8?B?aktxUnFwYWRZcVp0cmZ1a3RNcE8zMkluQTY1TWU2Ym42c3BrL3FzcllEYWZE?=
 =?utf-8?B?UC9NSWJCSFIzenhCUVZGdmRzbGZwazI1cTVqYUgxK0VyZjVOQ25IUWVydG9W?=
 =?utf-8?B?bEtIWEdYUmdGMGFrb09jb1BrUFFhdzdQR3FhL0tQblZTMlFnV1RFVUk5dEdz?=
 =?utf-8?B?blFKY21kMURJNXAra3Zhc2xxaUE1NWFkOXdMalZaTmQzUDA3L0Exa00rUEQv?=
 =?utf-8?B?R1V5d1lCaWJFamtmdVRjYldaZ3Nxb29UMDFZVkNKWUV2MUp6Y09rVS8wU1NW?=
 =?utf-8?B?OVpkYlQySDRabDdjdmZ2SlMxczhzTDJoWFdZOHVHUHNSUC9JSjMxNUdOdDZE?=
 =?utf-8?B?Q2FjQ0NINmtSTkE5WVUrd0dOaGZvY2xzRXRlcHBhSXRLYSt2enRja2FvUUJS?=
 =?utf-8?B?N2dQclByWklTUjdVUERFMjlZNmpFREhpcDU5QVBlanJZMFQvdExWNWpZbjlv?=
 =?utf-8?B?anphdVdXQjZtVmwzWmxkUlVoamJBaFczKzNkUVhUWHFMVDQ2V2ZuK21RWkV5?=
 =?utf-8?B?NjlzYnhmSk92TVlYeU9halY2K01KcWlEZStXSk9LQXM4ckZZT2JOSXY4Q3o1?=
 =?utf-8?B?cFJidmtvaVpNeTNoM1dSN2drTk9UaTllNmFVcWRsOHJmcGEvdDlFQkJMaWhL?=
 =?utf-8?B?bUhseW9DQ211S21SazVQS25Ldmt2TFVEWnJjbU05dkNMa2UxSkEySnJuRUlv?=
 =?utf-8?B?cnp3N25wVjNxQ1plRGZTbXpOWGkzNmZaLzNVZFEvSStjS0ViTGRhZC9lWFZL?=
 =?utf-8?B?OGdza0lMUmtHOEhZTldEM01Hd0NLaVZxY1IyZ1BGVUVKNCtjcmV2ZU1GUzN2?=
 =?utf-8?B?THBXUE4rQU5CL2VLRWhPUVo3REVpRzVrNG55NktSeW9jZEQrczFFTCtRTzc4?=
 =?utf-8?B?MXB2OHpqSzQzV3FRcHJOTUhXU2JhSkdyeTdKUE4rbEJNYnoxMzdBR3VWUkE3?=
 =?utf-8?B?RjU2bFEzTDJNNHg1d0NBTWFVQkxja3QzUERXbnNvU1pMN0JKVWxaM2Q2eDNQ?=
 =?utf-8?B?NnlpOXNhcW9KYVVBZi91bkptWGZ6TzA1REE4NVF1UEtxK20vVzVIczl6Y0xr?=
 =?utf-8?B?SFFLUTZUcU1SY1hWemNIUGVmT1BHcyszblM5UXd6ZXR6bWJSdVluSzJRRTQ1?=
 =?utf-8?B?djMrY0tiZXJ6aUZzNWVrbnd3N3MxNWxPYlQrYlhXNkh3RGJHM2JsdnhidHZ4?=
 =?utf-8?B?bFlFRUZqUFA2RFFGa2ZYWGFNZ2pLRkFobTFFUFVqdlh1aXE1NFIrajJyU0Yv?=
 =?utf-8?B?N3ZUNTdrNWZOMElDZEtYOWpHbnE0emx4K20zSWR0blArY2cyOS9ubzRzcTVT?=
 =?utf-8?B?MWswSlVXL0VYTlM2ZU5VcmdNWkh1OEJhdUlaTEo4bXY2NUZqRW95M2RRZFc3?=
 =?utf-8?B?andtazFLVW02MDJDL1FPemtDT3phVnJSYUFlbGh1dmk5N2pjWEdqUFdONWZQ?=
 =?utf-8?Q?zTAtpUbLitI1s4uv0HNRL4E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f88f26d-750f-4d24-35f6-08de32edd1d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 04:30:14.1888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+dwWzt4Ma9rmLxf0km+DQ2GxESIDZs6ogws6Ttpe33PegazTe2GXaG4E9H5DhGv/qsvK0moKlEIDUHp+YyakA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8800
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9wZXIsIE1hdHRoZXcg
RCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJl
ciAzLCAyMDI1IDE1OjExDQo+IFRvOiBXYW5nLCBYIDx4LndhbmdAaW50ZWwuY29tPg0KPiBDYzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBMaW4sIFNodWljaGVuZyA8c2h1aWNoZW5n
LmxpbkBpbnRlbC5jb20+Ow0KPiBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IE5pa3Vs
YSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgQ2F2aXR0LA0KPiBKb25hdGhhbiA8am9u
YXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAyLzJdIGRy
bS94ZTogZXhwb3NlIFBBVCBzb2Z0d2FyZSBjb25maWcgdG8gZGVidWdmcw0KPiANCj4gT24gV2Vk
LCBEZWMgMDMsIDIwMjUgYXQgMTA6NTM6NTVQTSArMDAwMCwgWGluIFdhbmcgd3JvdGU6DQo+ID4g
VGhlIGV4aXN0aW5nICJwYXQiIGRlYnVnZnMgbm9kZSBkdW1wcyB0aGUgbGl2ZSBQQVQgcmVnaXN0
ZXJzLiBVbmRlcg0KPiA+IFNSLUlPViB0aGUgVkYgY2Fubm90IHRvdWNoIHRob3NlIHJlZ2lzdGVy
cywgc28gdGhlIGZpbGUgdmFuaXNoZXMgYW5kDQo+ID4gdXNlcnMgbG9zZSBhbGwgUEFUIHZpc2li
aWxpdHkuIEFkZCBhIFZGLXNhZmUgInBhdF9zd19jb25maWciIGVudHJ5IHRvDQo+ID4gdGhlIFZG
LXNhZmUgZGVidWdmcyBsaXN0LiBJdCBwcmludHMgdGhlIGNhY2hlZCBQQVQgdGFibGUgdGhlIGRy
aXZlcg0KPiA+IHByb2dyYW1tZWQsIHJhdGhlciB0aGFuIHBva2luZyBIVywgc28gUEYgYW5kIFZG
IGluc3RhbmNlcyBwcmVzZW50IHRoZQ0KPiA+IHNhbWUgdmlldy4NCj4gPg0KPiA+IFRoaXMgbGV0
cyBJR1QgYW5kIG90aGVyIHRvb2xzIHF1ZXJ5IHRoZSBQQVQgY29uZmlndXJhdGlvbiB3aXRob3V0
DQo+ID4gY2FycnlpbmcgcGxhdGZvcm0tc3BlY2lmaWMgdGFibGVzIG9yIG1pcnJvcmluZyBrZXJu
ZWwgbG9naWMuDQo+ID4NCj4gPiB2MjogKEpvbmF0aGFuKQ0KPiA+IC0gT25seSBhcHBlbmQgIigq
ID0gcmVzZXJ2ZWQgZW50cnkpIiB0byB0aGUgUEFUIHRhYmxlIGhlYWRlciBvbiBYZTIrDQo+ID4g
ICBwbGF0Zm9ybXMgd2hlcmUgaXQgYWN0dWFsbHkgYXBwbGllcy4NCj4gPiAtIERlZHVwbGljYXRl
IHRoZSBQVEEvQVRTIG1vZGUgcHJpbnRpbmcgYnkgaW50cm9kdWNpbmcgdGhlIHNtYWxsDQo+ID4g
ICBkcm1fcHJpbnRmX3BhdF9tb2RlKCkgaGVscGVyIG1hY3JvLg0KPiA+DQo+ID4gdjM6IChNYXR0
KQ0KPiA+IC0gUHJpbnQgSURYW1hFX0NBQ0hFX05PTkVfQ09NUFJFU1NJT05dIG9uIGV2ZXJ5IFhl
MisgcGxhdGZvcm0gc28gdGhlDQo+ID4gICBkdW1wIGFsd2F5cyByZWZsZWN0cyB0aGUgdmFsdWUg
dGhlIGRyaXZlciBtaWdodCB1c2UgKGV2ZW4gaWYgaXQgZGVmYXVsdHMNCj4gPiAgIHRvIDApIGFu
ZCBmdXR1cmUgSVAgcmV2aXNpb25zIGRvbuKAmXQgbmVlZCBleHRyYSBjb25kaXRpb24gdHdlYWtz
Lg0KPiA+DQo+ID4gdjQ6DQo+ID4gLSBEcm9wIHRoZSBkcm1fcHJpbnRmX3BhdF9tb2RlIG1hY3Jv
IGFuZCBpbnRyb2R1Y2UgYSByZWFsIGhlbHBlcg0KPiA+ICAgeGUyX3BhdF9lbnRyeV9kdW1wKCku
IChKYW5pKQ0KPiA+IC0gUmV1c2UgdGhlIGhlbHBlciBhY3Jvc3MgYWxsIFBUQS9BVFMvUEFUIGR1
bXBzIGZvciB4ZTIrIGVudHJpZXMgdG8ga2VlcA0KPiA+ICAgb3V0cHV0IGZvcm1hdCBpZGVudGlj
YWwuDQo+ID4NCj4gPiB2NTogKE1hdHQpDQo+ID4gLSBTcGxpdCB0aGUgb3JpZ2luYWwgcGF0Y2gg
aW50byB0d286IG9uZSBmb3IgcmVmYWN0b3JpbmcgaGVscGVycywgb25lIGZvcg0KPiA+ICAgdGhl
IG5ldyBkZWJ1Z2ZzIGVudHJ5Lg0KPiA+DQo+ID4gQ0M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3Vs
YUBpbnRlbC5jb20+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9w
ZXJAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFhpbiBXYW5nIDx4LndhbmdAaW50ZWwu
Y29tPg0KPiA+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBp
bnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9kZWJ1Z2Zz
LmMgfCAgMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYXQuYyAgICAgICAgfCA1OSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BhdC5oICAgICAgICB8ICAxICsNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25z
KCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVn
ZnMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVnZnMuYw0KPiA+IGluZGV4
IDdjM2RlNjUzOTA0NC4uZTRmMzhiNTE1MGZjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9kZWJ1Z2ZzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfZGVidWdmcy5jDQo+ID4gQEAgLTIwOSw2ICsyMDksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9pbmZvX2xpc3QNCj4gdmZfc2FmZV9kZWJ1Z2ZzX2xpc3RbXSA9IHsNCj4gPiAgCXsgImRl
ZmF1bHRfbHJjX3ZjcyIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaG93X3dpdGhfcnBtLCAuZGF0
YSA9DQo+IHZjc19kZWZhdWx0X2xyYyB9LA0KPiA+ICAJeyAiZGVmYXVsdF9scmNfdmVjcyIsIC5z
aG93ID0geGVfZ3RfZGVidWdmc19zaG93X3dpdGhfcnBtLCAuZGF0YSA9DQo+IHZlY3NfZGVmYXVs
dF9scmMgfSwNCj4gPiAgCXsgImh3Y29uZmlnIiwgLnNob3cgPSB4ZV9ndF9kZWJ1Z2ZzX3Nob3df
d2l0aF9ycG0sIC5kYXRhID0NCj4gaHdjb25maWcNCj4gPiB9LA0KPiA+ICsJeyAicGF0X3N3X2Nv
bmZpZyIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaW1wbGVfc2hvdywgLmRhdGEgPQ0KPiA+ICt4
ZV9wYXRfZHVtcF9zd19jb25maWcgfSwNCj4gPiAgfTsNCj4gPg0KPiA+ICAvKiBldmVyeXRoaW5n
IGVsc2Ugc2hvdWxkIGJlIGFkZGVkIGhlcmUgKi8gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3BhdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jIGluZGV4DQo+
ID4gYjgxNDY3MjRhNjBlLi4yMWYwNTNjNDE4OTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3BhdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5j
DQo+ID4gQEAgLTU4MSwzICs1ODEsNjIgQEAgaW50IHhlX3BhdF9kdW1wKHN0cnVjdCB4ZV9ndCAq
Z3QsIHN0cnVjdA0KPiA+IGRybV9wcmludGVyICpwKQ0KPiA+DQo+ID4gIAlyZXR1cm4geGUtPnBh
dC5vcHMtPmR1bXAoZ3QsIHApOw0KPiA+ICB9DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogeGVf
cGF0X2R1bXBfc3dfY29uZmlnKCkgLSBEdW1wIHRoZSBzb2Z0d2FyZS1jb25maWd1cmVkIEdUIFBB
VCB0YWJsZQ0KPiBpbnRvIGEgZHJtIHByaW50ZXIuDQo+ID4gKyAqIEBndDogdGhlICZ4ZV9ndA0K
PiA+ICsgKiBAcDogdGhlICZkcm1fcHJpbnRlcg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm46IDAg
b24gc3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4NCj4gPiArICov
DQo+ID4gK2ludCB4ZV9wYXRfZHVtcF9zd19jb25maWcoc3RydWN0IHhlX2d0ICpndCwgc3RydWN0
IGRybV9wcmludGVyICpwKSB7DQo+ID4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hl
KGd0KTsNCj4gPiArCWNoYXIgbGFiZWxbUEFUX0xBQkVMX0xFTl07DQo+ID4gKw0KPiA+ICsJaWYg
KCF4ZS0+cGF0LnRhYmxlIHx8ICF4ZS0+cGF0Lm5fZW50cmllcykNCj4gPiArCQlyZXR1cm4gLUVP
UE5PVFNVUFA7DQo+ID4gKw0KPiA+ICsJZHJtX3ByaW50ZihwLCAiUEFUIHRhYmxlOiVzXG4iLCBH
UkFQSElDU19WRVIoeGUpID49IDIwID8gIiAoKiA9DQo+IHJlc2VydmVkIGVudHJ5KSIgOiAiIik7
DQo+ID4gKwlmb3IgKHUzMiBpID0gMDsgaSA8IHhlLT5wYXQubl9lbnRyaWVzOyBpKyspIHsNCj4g
PiArCQl1MzIgcGF0ID0geGUtPnBhdC50YWJsZVtpXS52YWx1ZTsNCj4gPiArDQo+ID4gKwkJaWYg
KEdSQVBISUNTX1ZFUih4ZSkgPj0gMjApIHsNCj4gDQo+IEkgdGhpbmsgd2UncmUgbWlzc2luZyBh
ICJHUkFQSElDU19WRVJ4MTAwKHhlKSA9PSAzNTExIiBjaGVjayBhdCB0aGUgdG9wIG9mDQo+IHRo
aXMgbGFkZGVyIHRoYXQgd291bGQgdXNlIHRoZSB4ZTNwX3hwYyBkdW1waW5nIGZ1bmN0aW9uLg0K
PiANCj4gRm9yIGNvbnNpc3RlbmN5IHdpdGggeGVfcGF0X2luaXRfZWFybHkoKSdzIGxvZ2ljLCB5
b3UgbWlnaHQgd2FudCB0byBtYWtlIHRoaXMNCj4gY29uZGl0aW9uICJHUkFQSElDU19WRVIoeGUp
ID09IDMwIHx8IEdSQVBISUNTX1ZFUih4ZSkgPT0gMjAiIHNvIHRoYXQNCj4gYm90aCBhcmUgdXNp
bmcgdGhlIHNhbWUgc2VsZWN0aW9uIGxvZ2ljLg0KPiANCkkgaGF2ZSBtYWRlIHRoZSAgeGUzcF94
cGMgZHVtcGluZyBmdW5jdGlvbiB1c2luZyB0aGUgc2FtZSBmb3JtYXQgYXMgdGhlIHhlMl9kdW1w
IGluIHRoZSBmaXJzdCBwYXRjaCwgc28gaGVyZSB3ZSBjb3VsZCBqdXN0IHVzZSB0aGUgIEdSQVBI
SUNTX1ZFUih4ZSkgPj0gMjAuDQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4gKwkJCXhlX3BhdF9pbmRl
eF9sYWJlbChsYWJlbCwgc2l6ZW9mKGxhYmVsKSwgaSk7DQo+ID4gKwkJCXhlMl9wYXRfZW50cnlf
ZHVtcChwLCBsYWJlbCwgcGF0LCAheGUtDQo+ID5wYXQudGFibGVbaV0udmFsaWQpOw0KPiA+ICsJ
CX0gZWxzZSBpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfTUVURU9STEFLRSkgew0KPiA+ICsJ
CQl4ZWxwZ19wYXRfZW50cnlfZHVtcChwLCBpLCBwYXQpOw0KPiA+ICsJCX0gZWxzZSBpZiAoeGUt
PmluZm8ucGxhdGZvcm0gPT0gWEVfUFZDKSB7DQo+ID4gKwkJCXhlaHBjX3BhdF9lbnRyeV9kdW1w
KHAsIGksIHBhdCk7DQo+ID4gKwkJfSBlbHNlIGlmICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9E
RzIgfHwNCj4gR1JBUEhJQ1NfVkVSeDEwMCh4ZSkgPD0gMTIxMCkgew0KPiA+ICsJCQl4ZWxwX3Bh
dF9lbnRyeV9kdW1wKHAsIGksIHBhdCk7DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJcmV0dXJu
IC1FT1BOT1RTVVBQOw0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoeGUtPnBh
dC5wYXRfcHRhKSB7DQo+ID4gKwkJdTMyIHBhdCA9IHhlLT5wYXQucGF0X3B0YS0+dmFsdWU7DQo+
ID4gKw0KPiA+ICsJCWRybV9wcmludGYocCwgIlBhZ2UgVGFibGUgQWNjZXNzOlxuIik7DQo+ID4g
KwkJeGUyX3BhdF9lbnRyeV9kdW1wKHAsICJQVEFfTU9ERSIsIHBhdCwgZmFsc2UpOw0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiArCWlmICh4ZS0+cGF0LnBhdF9hdHMpIHsNCj4gPiArCQl1MzIgcGF0ID0g
eGUtPnBhdC5wYXRfYXRzLT52YWx1ZTsNCj4gPiArDQo+ID4gKwkJZHJtX3ByaW50ZihwLCAiUENJ
ZSBBVFMvUEFTSUQ6XG4iKTsNCj4gPiArCQl4ZTJfcGF0X2VudHJ5X2R1bXAocCwgIlBBVF9BVFMg
IiwgcGF0LCBmYWxzZSk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJZHJtX3ByaW50ZihwLCAiQ2Fj
aGUgTGV2ZWw6XG4iKTsNCj4gPiArCWRybV9wcmludGYocCwgIklEWFtYRV9DQUNIRV9OT05FXSA9
ICVkXG4iLCB4ZS0NCj4gPnBhdC5pZHhbWEVfQ0FDSEVfTk9ORV0pOw0KPiA+ICsJZHJtX3ByaW50
ZihwLCAiSURYW1hFX0NBQ0hFX1dUXSA9ICVkXG4iLCB4ZS0NCj4gPnBhdC5pZHhbWEVfQ0FDSEVf
V1RdKTsNCj4gPiArCWRybV9wcmludGYocCwgIklEWFtYRV9DQUNIRV9XQl0gPSAlZFxuIiwgeGUt
DQo+ID5wYXQuaWR4W1hFX0NBQ0hFX1dCXSk7DQo+ID4gKwlpZiAoR1JBUEhJQ1NfVkVSKHhlKSA+
PSAyMCkgew0KPiA+ICsJCWRybV9wcmludGYocCwgIklEWFtYRV9DQUNIRV9OT05FX0NPTVBSRVNT
SU9OXQ0KPiA9ICVkXG4iLA0KPiA+ICsJCQkgICB4ZS0+cGF0LmlkeFtYRV9DQUNIRV9OT05FX0NP
TVBSRVNTSU9OXSk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5oIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3BhdC5oDQo+ID4gaW5kZXggYjg1NTkxMjA5ODllLi41NzQ5YTQ4OGQ5YTkgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5oDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BhdC5oDQo+ID4gQEAgLTQ5LDYgKzQ5LDcgQEAgdm9pZCB4ZV9w
YXRfaW5pdF9lYXJseShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7ICB2b2lkDQo+ID4geGVfcGF0X2lu
aXQoc3RydWN0IHhlX2d0ICpndCk7DQo+ID4NCj4gPiAgaW50IHhlX3BhdF9kdW1wKHN0cnVjdCB4
ZV9ndCAqZ3QsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCk7DQo+ID4gK2ludCB4ZV9wYXRfZHVtcF9z
d19jb25maWcoc3RydWN0IHhlX2d0ICpndCwgc3RydWN0IGRybV9wcmludGVyICpwKTsNCj4gPg0K
PiA+ICAvKioNCj4gPiAgICogeGVfcGF0X2luZGV4X2dldF9jb2hfbW9kZSAtIEV4dHJhY3QgdGhl
IGNvaGVyZW5jeSBtb2RlIGZvciB0aGUNCj4gPiBnaXZlbg0KPiA+IC0tDQo+ID4gMi40My4wDQo+
ID4NCj4gDQo+IC0tDQo+IE1hdHQgUm9wZXINCj4gR3JhcGhpY3MgU29mdHdhcmUgRW5naW5lZXIN
Cj4gTGludXggR1BVIFBsYXRmb3JtIEVuYWJsZW1lbnQNCj4gSW50ZWwgQ29ycG9yYXRpb24NCg==

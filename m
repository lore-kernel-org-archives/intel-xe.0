Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81887EEC2A3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413A610E453;
	Mon, 23 Feb 2026 22:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOK8YBEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE6E10E453
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771885734; x=1803421734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ngqCTzhyTNey10GGzah6OxUA/FDwx4YGdtxrZyBiZ/g=;
 b=nOK8YBEaZb3e4Co9hxhJbj1CJdXgzxvHoNQ907l1xWErZ80bRWrYsXHa
 Oyf9rf1EQ55BJpDlAf8pQXsBAkQhhDFv2ICBGxQHOEx244E5jJ/dm+jw/
 wq9+mZk4VLrlQcxY+zONll0jmGXCw+K8AzqjGdXfbJ4I4s5EbkwsY//yL
 0bIfNwamtpGc+XyFxOGGCeG2SZBGi0HZ85m0Q6Kzl5BSW6MhENqGYr/0P
 wwCw0nWG4R/F8WB20BnDAziSa5IxYN9D0gBxW5Ff/zZooKf3Yp9aKjNN+
 W3s4yDVKcQ4m+j7Lh3vpr7x1ZLO1fT5WifJU/F3xXFemdpj+9Jh2rRmHi w==;
X-CSE-ConnectionGUID: BFgjBexPT+SOOSTCWdd5HA==
X-CSE-MsgGUID: dN/VTZ6GSiah03t10PCqZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90300454"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="90300454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:28:54 -0800
X-CSE-ConnectionGUID: D8WdlwSJSwCFEstJZ6bVJw==
X-CSE-MsgGUID: CGY5DZPIR1+e2y7sRvVTWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="219224765"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:28:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:28:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:28:53 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:28:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdFuOn30rTmcnR9kmaTRObq1YuUYxRm9v5S5pv/pgJfSS0oUWxSfYf/Iqkd34DVMuTvVb8AsvtNO+KGnB/+KJ6XsEFseCQp0G7C9aQGjx2HgIkusrwn0aeURRLoORWLIc9zg9XmNQRDc4r/YPA8ulKIjW8HVMu8eCTbI7L0VdmIh8qdYKWtFC7yAMjk5q/mqdfWZtzI+07wJBRbMBaB1dYGdRa8AC9ouudhS63oUDw0vAIBkX+nOWr5Pk1iMAz6vKpwD5j/D31rx65Psrum2xJTeD3+U8yJU02OZ5IU5mg+eU09V8FyhkUH+SA6ynZE0wTfkI0aJuyT6EAy2UiCulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngqCTzhyTNey10GGzah6OxUA/FDwx4YGdtxrZyBiZ/g=;
 b=eXmeHnZPlkrk6Qe/DPwFGZpy11fK9DbkFQGI91ao5E3CsDYk2QrXFfX/G+0/O+B4KNOcfZxYmZvfeJsBriaeCmdcf1fUYPTw5EJle0Jqgn3Fwp3CycyA3UUByKSQpSR33nqLf1bJHYtE0vKw/7nasxdHmxpBCuK+SMJAB669jOc9K/krfATwPLe1CpfvBNEc3fq/9+psVsvbccKgSP+kHRl0fI/DRxr1J+azcRt2p9NML+RcXVijMLmPNLZEbUNpPbZN5lUA0gYQQPNp56hjBA+3pM7+/Av5v5+fHtvmfs5tMguRQ3HHIVmoWSXBrV78xDSmXJJhmkZOno4dAGEE5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 by BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Mon, 23 Feb
 2026 22:28:49 +0000
Received: from PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::c60b:e0df:51cf:cea4]) by PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::c60b:e0df:51cf:cea4%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:28:49 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Charles, Daniel"
 <daniel.charles@intel.com>, "Yang, Fei" <fei.yang@intel.com>, "Mrozek,
 Michal" <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe: Document exec queue priority rules
Thread-Topic: [PATCH] drm/xe: Document exec queue priority rules
Thread-Index: AQHcpQrd01hOiXbwFUuhh0uoascmT7WQz8oAgAAEwACAAAIMAIAABuAA
Date: Mon, 23 Feb 2026 22:28:49 +0000
Message-ID: <43a0a52273bc4f716450b3ef782fbaf86a70732c.camel@intel.com>
References: <20260223212442.8923-1-stuart.summers@intel.com>
 <aZzJJiWLHYn59O1G@lstrano-desk.jf.intel.com>
 <73fc07785ffc41b2ca598178aa1601c9ba867ee8.camel@intel.com>
 <aZzO2tI/ifdv37Ul@lstrano-desk.jf.intel.com>
In-Reply-To: <aZzO2tI/ifdv37Ul@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5577:EE_|BY1PR11MB8031:EE_
x-ms-office365-filtering-correlation-id: 2011c8ae-de0b-4c2b-b22d-08de732aea89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?R2QyNVl6b3U5S3ZCMk1TSWVIenhZTTE2MG11LzNIdGVFSS9PQXJUcy91aHl0?=
 =?utf-8?B?QlIwdmtpa0h3eHI3QThoUWs2U3dHbzQ2cWZLYS83SUFJencyOEpkb2NaRUk4?=
 =?utf-8?B?ZmtoNXk4eWdNWFhrbkpTT3VMNCs0UEcybE1UK1JpdWNXUFQzd05KdDhHU042?=
 =?utf-8?B?c2sxWUU1MjFTV2JPYTJJNm0xeFJTUHM1Z1BRbS9FSDB6YWpoNjRldDFPZVNi?=
 =?utf-8?B?cU11YkZsT3JiR284SEwvNXdtRi9IYmJrQ0llVGRadGM5TGpKMXF2S29rVWh0?=
 =?utf-8?B?N051dy9QaDZjbmpwZGRKRFk5aTBWdHBqRmM3REQwL0hmeEJoOFpPOWxUOVRT?=
 =?utf-8?B?N1laS2MxSi9nUU5taVFsTGdIL2ltdVRmM1NYTmg1cUp5cVg5cWZjaHh0TkZh?=
 =?utf-8?B?WmtwMncxNDNhL2ZpTGVKOU5vMmkyK3RRQlRHSHoyYmFxUDJYVlkrVFVhdEY3?=
 =?utf-8?B?WUxqMG12RzBNNktYR2Zvck1KTlQ5eXEvMTRPOFN0MVd5Rk9qKzBoQnBGOVlz?=
 =?utf-8?B?RHNmWk1KV3JXRmJ1c1g4azZsNEkwUE9ORHA4REpkMjNHUnZOdlZaT1hHQWJX?=
 =?utf-8?B?S21PcmNLdTRzWFNzYXgrNWNyRm44RXdvaVZBZklVSDhHOURsb0xoTWZSVklM?=
 =?utf-8?B?b1VOWFVFdUdYcWEyOVZSazBqUzNpeE5wb0F5aWdvYm5mUzFBK1p1eGVyWWVR?=
 =?utf-8?B?TjA5S3VuMnAva012V3ZLL3NWS1lHRW9JN21CdFhaNkFVZkRkakVmelZ2c212?=
 =?utf-8?B?cWFiMlNCTW5VdlNtb1luVkp1N2VwVEduM0ZBT1UzMjBLN2Y3cU93ekllQXAx?=
 =?utf-8?B?MVNPb3VQL0JKbnUyMW5rMXBCQUhtWjJVM25BaEhES3lzd0N1RXdldFFvY3FB?=
 =?utf-8?B?WGhYejdWbWZ5b0pNTGErek1uZFpCeDBaV21QYTJ0MC9TMktjenVlQXd4bDRu?=
 =?utf-8?B?SXdDRXVZS3JEWG9ETWhpVVM2ajFPSVFKOS9qdTlIeE1XNUJnclN1bkN4NFlM?=
 =?utf-8?B?bXpkQ1Zzdmt5RDR6R2RMMEJsVVYzWWdDQ2piWEZyYmdEY0tUWlkxWHVYWmQ1?=
 =?utf-8?B?bVF3OHI3SFBqa3F3cVlpK2dtaGJXWGkySkpyOE9NTXU2TE9jL1lZM2hhUDMv?=
 =?utf-8?B?Q3drWXBXa0xOcnNCQ0N0QkU1L2luQXlFNGJhcjgvNTNzZEZhWGd4enkxcTdx?=
 =?utf-8?B?bFc5WjNNYzJueGkxMnVEOGI3cUZkRjRwclVldUdPb0pYaWNwUjR4cXRSVjJM?=
 =?utf-8?B?cTJ6VERDRGtSWTIvWGU1SUYwMTgxTEw0U0Z6M3UxSlFQM1FvYnY3Mkxoendo?=
 =?utf-8?B?UEtRTXN2NlJWQjBrU2VESUhNMXdsTmZtcFkyZ3c2K05BV3FLMlhMYXYycTZ4?=
 =?utf-8?B?a2RxeHBkR1ZVL0hsQjVtdk5hU0k0WU1Tc0svSEtlRWpzR20ySVBSRElPRzNB?=
 =?utf-8?B?cWZaazVZUTlDakJHKzBHcWREaDhJekJxZ09IT1NMd3c0Syt5djNaa2U2TkJy?=
 =?utf-8?B?dW9mZ2RzYitFNDIxTHR5ZFlUR00weWVRZEpiNjU1TTZJa2V1b1Z3c2FnN05s?=
 =?utf-8?B?S2d0ZlhtZDk5MGVCVkRJU3hFWTZYb3BvTEp3c0tySGpMNzRSdDdpbDFUT0cz?=
 =?utf-8?B?UGNldWQ2N2NNdFdLNnRzY1pQLzRUeVgrTkw3ZDg1QjhEN05SdHZQOUpCNmkr?=
 =?utf-8?B?d3p6WWFLMVhYK2ZGSHBnb2IzK0NXaG1IMFc0TFZrdnlUeHNiNFlGQk1QdGpM?=
 =?utf-8?B?U3BBZ2RZNHBRUzFYUkgxMnREMHFxUEk0blR6aTBxcmZVNHFHOCtsa0o3TGhN?=
 =?utf-8?B?TzliSk92bmVyaXlWd09zK1RGd1RtYjhzRjY2R29TbUlPNVFsbjRPQnpNUnJh?=
 =?utf-8?B?TlovWlVTbTFqUXJkR0FGZ1JxTkdpNFE5QnBWOUdibDhCdGJCb0piV2E2TnRM?=
 =?utf-8?B?b1o4WWluNklRb05MRGtDdFFMRnZQS2U0bWtJalJFSE03R2NOemYvRUtiVjF4?=
 =?utf-8?B?YWdsaGkyWjlncks1WllKTTY2K3doMlV4WmpFYloyVlZuaGkxYmJOb2pHUlVv?=
 =?utf-8?B?V0UrcW1iZzJJMGljcmhGSG1xcGhUUHNxUXR1cStidXFCcUJ6VVd2NHMvVTNU?=
 =?utf-8?B?bldobGRxeExha0J5V055NUtpMWk5WXJMUDBzNFNNOXV4a3gwZG51RHp0YkMz?=
 =?utf-8?Q?I0TXduJd4VCfAHbWdWBp0t0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5577.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTBrd3pFcGVtcFcvWVBUTlNCS0VTOUN1NTM4QStaRXh6dDJJMnFDbDJDSm5G?=
 =?utf-8?B?eUFpQk1DU2RMQ2x3V0pOZWNVYVFMSEY4cHNKQ2xJcWQ5NkhuUGtqcm1lTnMw?=
 =?utf-8?B?ZTFyL0UvOUtaeklPQk1XNzl5dG5yb1Nocm9ibDRld3loMVZyOUhaeTMxMnhu?=
 =?utf-8?B?VE1QaHBqWlVZV2JHMTJUYzV5Rk0ySVczV0JxYXZPaDZSRzNER1FHNzA3TFd3?=
 =?utf-8?B?alRUWksyOVdOT1hRQ2JZejNYbG1Yd0VzSUhTN2p3eDJNUjBaODdwVHNSbi9y?=
 =?utf-8?B?akdXS2QzL1QvcUNnbW5BbXF0Q1lTWHh5QnBmOGRsaEJwcTB5UUNnTk00S2Vl?=
 =?utf-8?B?OXhxNUU5L0h0elRXVzRRNWJ3U1NPT3cxSUZOUXVVNzlibTV4YVlCdTJ1dFJ2?=
 =?utf-8?B?OUsvTHZ1VTMrU3IrcE94dkd3Nlh5OFhTdkJCQVBzUjRORkN2QXRHbG1MRHkv?=
 =?utf-8?B?LzBDRi9TSTVJWFFTRm9aZG8zNVNVRFUwejBldURBdms2bGcwdDQzOGtsZ3VY?=
 =?utf-8?B?elFrUy82ejAzcWxSeEEwVDE2dzRkUkNZZGkxTXhjTU4vc2p4Nnd6YmJ0YVRx?=
 =?utf-8?B?TE5ING4vbC9Eelh2WlcwL2VQektwZ3ZsYzVTV3FWZHd6Wk8rRUM4RHAraXhV?=
 =?utf-8?B?RGZQeFpMU0tkcGtTSnNUSHZTT1RITkxYUVFzUWl5RDBNNklxc1ZYenVMVXdp?=
 =?utf-8?B?dGY1WEhMUjlUN05iSkZlTWJ2YkppTUUxRFRIaUFCU3dDVWRnYjZnYkpaZ282?=
 =?utf-8?B?N2tmaDRZUC9SM0FsTWNwTVVBYjR0RmlhRFlGSXdGR3dSK3N4MC8vMURDTjBX?=
 =?utf-8?B?cUQ5czJNT1NqWm16aEoxZmQxK0lWWnN5eGh1VC9hN1FMMWRicHpwMjk1cmtZ?=
 =?utf-8?B?YWxhRTdUNmVDZGZSSE5LYWJFQU1Tckh6S1FhOCtGYWFYMFh1ek9xbndrdDdj?=
 =?utf-8?B?MWVaVzdneVNtWVliU3ZVREpBS0V0ckZ4NVdqSzFoSWhQZkhJTGhDR0IzSHJp?=
 =?utf-8?B?SFExNGNZK0EvWTdiaFk2ZzFCcW5RYXBWcVJncGpFU25vTGVlckVzN2N5aVNx?=
 =?utf-8?B?UVpaMHdmQmZGUURjQ2c0UktpR1BPcjFMSExQRXZJck9VRG1jcXpwVW1BeUky?=
 =?utf-8?B?MHBPV3ZKWUl6RkUzaW1tSTljc0VVZWRGZDhkOXNGbklTQTE0TTZYVm1EaGNU?=
 =?utf-8?B?T0JpRUI4eDlhMHRaWWpTQzBEbFRPYXluQ3kxZ1ZIdGx6WTRQM0I0UXllSW5Y?=
 =?utf-8?B?L3J4MjJOODB1Tzd3bmgvOCtiUFZUZjh1K0UvQ2VBUzVwT2NIV2xFVEFvd2Jl?=
 =?utf-8?B?V0w3NnJ5WUFJQzBJUHpUeDdyOVU5cUx0WFZpRGVTaWJiUTQ1QW9wYlhDR2tu?=
 =?utf-8?B?VE0rU21jWDg5OEFlVFluQ2ZSNVM3Rnl1Q3E3eVRES1BvRjhVcW5aeldUeE9Q?=
 =?utf-8?B?bHoxWnhJaUY1ME9lbUppemY4czNveldJYjJ6WUw4Zjc1ZStvU0dTbFF4MFpz?=
 =?utf-8?B?WUpUcEFzaitNanhTT1g2Y0VVd3F6WHhFeWo3dHVZOUsycjB3YW45OHZ3Nmky?=
 =?utf-8?B?TGptMWFrVUNuQWtqaXltYzBEYzBZRUxYMVRQMEpNYU9OMngyK0NjVUVES3A4?=
 =?utf-8?B?WjUyVUZWUjdsYmIwTHl4T2VZQ0daTDZBMENqYUNMK0o4YmVpbXBYOHlxOXFi?=
 =?utf-8?B?VFBxV2Q1bVd5aVVVZjhETXRBZ0xXazhjZktTMXpIcHNzR1o1VHVhc25BVTVk?=
 =?utf-8?B?RjVYL1JCd1A1eVZWaGp2NXZ5WUZ5T2IwOUJXWmZkNFluWWYvck5ncWlZSk5k?=
 =?utf-8?B?WWFGcSthalZjaThFMU1Nd2NQMkVnOW1zYkdOY0VWVHEzUGVCRXpzbS9haThk?=
 =?utf-8?B?RkwvcndrbXFsVGJvZkJ6c0NhVU9IU21YU3hTaHB2c1F1NkJpdW5OVHBuVDds?=
 =?utf-8?B?UFZxTThaZWFDakpYaG9YRHA3bjlldUNpc2hDekI0MURVVHR2SkJuKzlrRVhJ?=
 =?utf-8?B?S1BNbklCVWhEcmhUSlJ5TzhtbGVrOEt4N29IVkNua2o2LzVTdVE1U21CWi9m?=
 =?utf-8?B?U3JnbjlCWHh3bEVxOWJuckQ0aTF3QWwrS0s4eVl0b3A5NmpHV2NTYW9oelVO?=
 =?utf-8?B?b0t3YUJpb3h2S0VYWFBWelVTMFJjMEVjRUZPSm5kQm85N0s4Z05ydi9XRHhq?=
 =?utf-8?B?MTVkVVI5dS9Qa2pXUk5sYUtzZFVWMjZVamJ2VXhzazMzc0J6R01oMjFwcmJp?=
 =?utf-8?B?dHBqTjNENTNkTWtBTG5ic0VPODhJOUlrUjAxYzZ2K21YbE9BNXk2L0ZPajVF?=
 =?utf-8?B?UE84OUpaMGxUZUJIZzBZeERqVkZMQ3hWTmJqc3lHUUFJZ1dmdXhrQnhzU0p3?=
 =?utf-8?Q?/69X5RJVF7vyBjuw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44CB5A9D317D3949954D53A73F0DC7A4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5577.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2011c8ae-de0b-4c2b-b22d-08de732aea89
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 22:28:49.3466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Op5ZtP4zc42L/foNru9U0CzRgJRJ6zNbNp20JgrDSFGmPy/Msdl2Ao1RXMtR+YQTMgr6ppnq+d20SugxTa8QiFV7HbM1eFwVJisXo9sIhXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8031
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

T24gTW9uLCAyMDI2LTAyLTIzIGF0IDE0OjA0IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIEZlYiAyMywgMjAyNiBhdCAwMjo1Njo1M1BNIC0wNzAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDI2LTAyLTIzIGF0IDEzOjM5IC0wODAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgMDk6MjQ6NDJQTSAr
MDAwMCwgU3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+ID4gPiA+IEFkZCBzb21lIGRvY3VtZW50YXRp
b24gYXJvdW5kIGhvdyB0aGUgR3VDIHdpbGwgZW1wbG95DQo+ID4gPiA+IHRoZSB4ZV9leGVjX3F1
ZXVlIHByaW9yaXRpZXMgcHJvdmlkZWQgYnkgdXNlcnNwYWNlDQo+ID4gPiA+IGFwcGxpY2F0aW9u
Lg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFy
dC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaCB8IDI0DQo+ID4gPiA+ICsrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+
ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNf
cXVldWVfdHlwZXMuaA0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVl
X3R5cGVzLmgNCj4gPiA+ID4gaW5kZXggMzc5MWZlZDM0ZmZhLi5hZWZlYmZjNjk5NmUgMTAwNjQ0
DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgN
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0K
PiA+ID4gPiBAQCAtMjIsNiArMjIsMzAgQEAgc3RydWN0IHhlX2d1Y19leGVjX3F1ZXVlOw0KPiA+
ID4gPiDCoHN0cnVjdCB4ZV9od19lbmdpbmU7DQo+ID4gPiA+IMKgc3RydWN0IHhlX3ZtOw0KPiA+
ID4gPiDCoA0KPiA+ID4gPiArLyoqDQo+ID4gPiA+ICsgKiBlbnVtIHhlX2V4ZWNfcXVldWVfcHJp
b3JpdHkgLSBFeGVjIFF1ZXVlIHByaW9yaXR5IHZhbHVlcw0KPiA+ID4gPiArICoNCj4gPiA+ID4g
KyAqIFhlS01EIHVzZXMgR3VDIGFzIHRoZSBwcmltYXJ5IHN1Ym1pc3Npb24gdmVoaWNsZSB0byBI
Vy4NCj4gPiA+ID4gKyAqIEd1QyBoYXMgNCBwcmlvcml0eSBsZXZlbHMgdGhhdCByb3VnaGx5IG1h
cCB0byB0aGUgNCBsZXZlbHMNCj4gPiA+ID4gKyAqIHNob3duIGhlcmUgYnV0IGluIHJldmVyc2Ug
b3JkZXIuIEd1QyBzY2hlZHVsZXIgdXNlcyB0aW1lDQo+ID4gPiA+ICsgKiBzbGljaW5nIHRvIGRl
dGVybWluZSBob3cgbG9uZyBhIHF1ZXVlIHNob3VsZCByZW1haW4gb24gdGhlDQo+ID4gPiA+ICsg
KiBjb21tYW5kIHN0cmVhbWVyIGJlZm9yZSBpc3N1aW5nIGEgcHJlZW1wdGlvbiByZXF1ZXN0IHRv
DQo+ID4gPiA+ICsgKiBhbGxvdyBleGVjdXRpb24gb2YgYW5vdGhlciBxdWV1ZS4NCj4gPiA+ID4g
KyAqDQo+ID4gPiA+ICsgKiBUaGUgZm9sbG93aW5nIHJ1bGVzIHNob3VsZCBiZSBjb25zaWRlcmVk
IGJ5IGFwcGxpY2F0aW9ucw0KPiA+ID4gPiArICogZW1wbG95aW5nIHRoZXNlIHF1ZXVlIHByaW9y
aXRpZXM6DQo+ID4gPiANCj4gPiA+IEkgZG9u4oCZdCB0aGluayB0aGlzIGlzIGNvcnJlY3QsIGJ1
dCBEYW5pZWxlIG9yIHNvbWVvbmUgb24gdGhlIEd1Qw0KPiA+ID4gdGVhbQ0KPiA+ID4gY2FuIGNv
cnJlY3QgbWUgaWYgSeKAmW0gd3JvbmcuDQo+ID4gPiANCj4gPiA+IE15IHVuZGVyc3RhbmRpbmcg
aXM6DQo+ID4gPiANCj4gPiA+IC0gUXVldWVzIGF0IHRoZSBzYW1lIHByaW9yaXR5IGFyZSB0aW1l
c2xpY2VkLiBUaGUgdGltZXNsaWNlDQo+ID4gPiBxdWFudHVtDQo+ID4gPiBjb250cm9scyBob3cg
bG9uZyBlYWNoIHF1ZXVlIGdldHMgdG8gcnVuIGJlZm9yZSBhIHByZWVtcHQgaXMNCj4gPiA+IGF0
dGVtcHRlZC4NCj4gPiA+IA0KPiA+ID4gLSBRdWV1ZXMgd2l0aCBhIGhpZ2hlciBwcmlvcml0eSB0
aGFuIHRoZSBvbmUgY3VycmVudGx5IHJ1bm5pbmcNCj4gPiA+IGltbWVkaWF0ZWx5IHByZWVtcHQg
dGhlIGxvd2VyIHByaW9yaXR5IG9uZXMuIFRoZSBwcmVlbXB0aW9uDQo+ID4gPiBxdWFudHVtDQo+
ID4gPiBjb250cm9scyBob3cgbG9uZyB3ZSB3YWl0IGJlZm9yZSB0aGUgbG93ZXIgcHJpb3JpdHkg
cXVldWUgaXMNCj4gPiA+IHJlc2V0IGlmDQo+ID4gPiBpdCBkb2VzbuKAmXQgcmVzcG9uZCB0byBh
IHByZWVtcHQuDQo+ID4gPiANCj4gPiA+IC0gSWYgYSBxdWV1ZSBpcyBydW5uaW5nIGF0IGEgaGln
aGVyIHByaW9yaXR5LCB0aG9zZSB3aXRoIGxvd2VyDQo+ID4gPiBwcmlvcml0eQ0KPiA+ID4gbmV2
ZXIgZ2V0IHNjaGVkdWxlZC4NCj4gPiA+IA0KPiA+ID4gVGhpcyBpcyB3aHkgc2V0dGluZyBISUdI
IGlzIGRhbmdlcm91cyDigJQgaXQgY2FuIGNvbXBsZXRlbHkgc3RhcnZlDQo+ID4gPiBvdXQNCj4g
PiA+IG90aGVyIHF1ZXVlcywgd2hpY2ggaXMgd2h5IHdlIGRvbuKAmXQgbGV0IHVucHJpdmlsZWdl
ZCB1c2Vyc3BhY2UNCj4gPiA+IHNldA0KPiA+ID4gaXQuDQo+ID4gDQo+ID4gU28gdGhpcyBpcyB0
aGUgb2JzZXJ2ZWQgYmVoYXZpb3IgYW5kIHdoYXQgd2UgaGFkIGJlZW4gdG9sZCBpcyB0aGUNCj4g
PiBpbnRlbnQgZnJvbSB0aGUgYXJjaGl0ZWN0cy4gQnV0IHlvdSdyZSByaWdodCBJIGRvbid0IHNl
ZSBhbnkNCj4gPiBleHBsaWNpdA0KPiA+IGRvY3VtZW50YXRpb24gb24gdGhlIEd1QyBzaWRlIGFi
b3V0IHRoaXMuIExldCBtZSBkaWcgYW5kIGdldCBiYWNrDQo+ID4gaGVyZQ0KPiA+IGJlZm9yZSB3
ZSBtYWtlIGFueSBjaGFuZ2VzIGhlcmUuLi4NCj4gPiANCj4gDQo+IEkgd291bGQgZG91YmxlIGNo
ZWNrIGFzIEknbSBuZWFyIHBvc2l0aXZlIHdoYXQgSSB3cm90ZSBhYm92ZSB3YXMNCj4gY29ycmVj
dA0KPiBhdCBsZWFzdCB3aGVuIHRoZSBuZXcgR3VDIGludGVyZmFjZSAodjY5IG1ham9yIHZlcnNp
b24pIHdhcw0KPiBpbXBsZW1lbnRlZC4NCj4gT2ZjIHRoaXMgY291bGQgaGF2ZSBjaGFuZ2VkIGlu
IHRoZSBsYXN0IDUgeWVhcnMgdGhvdWdoLg0KDQpPayB0aGVyZSdzIGEgbmV3KGlzaCkgeWllbGQg
cG9saWN5IHRoYXQgY292ZXJzIHRoaXMgaW4gdGhlIEd1QyBzcGVjIGJ1dA0KaXQgbG9va3MgbGlr
ZSBieSBkZWZhdWx0IHRoaXMgaXMgbm90IGVuYWJsZWQgKGFuZCBvZiBjb3Vyc2Ugd2UgYXJlbid0
DQpjb25maWd1cmluZyB0aGlzIGluIHRoZSBLTUQgdG9kYXkpLiBJJ20gdHJhY2tpbmcgZG93biB0
aGUgcmVxdWlyZW1lbnQNCmhlcmUuIElmIHdlIG5lZWQgdGhpcyBjaGFuZ2UgSSdsbCBpbmNsdWRl
IHRoZSBkb2N1bWVudGF0aW9uIGZyb20gdGhpcw0KcGF0Y2ggd2l0aCB0aGF0IHlpZWxkIHBvbGlj
eSBjaGFuZ2UgaW4gdGhlIGRyaXZlciBzbyBpdCdzIGNsZWFyLg0KT3RoZXJ3aXNlIEkgYWdyZWUg
d2l0aCB3aGF0IHlvdSBzYWlkLiBMZXQncyBob2xkIG9uIHRoaXMgcGF0Y2ggdW50aWwNCnRoZW4u
DQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiBNYXR0IA0KPiANCj4gPiBUaGFua3MsDQo+ID4g
U3R1YXJ0DQo+ID4gDQo+ID4gPiANCj4gPiA+IE1hdHQNCj4gPiA+IA0KPiA+ID4gPiArICrCoCAt
IEEgSElHSCBwcmlvcml0eSByZXF1ZXN0IHdpbGwgcHJlZW1wdCBhIE5PUk1BTCBhbmQgTE9XDQo+
ID4gPiA+ICsgKsKgwqDCoCBwcmlvcml0eSByZXF1ZXN0IHdoZW4gc3VibWl0dGVkIGFuZCBiYXNl
ZCBvbiB0aGUgdGltZQ0KPiA+ID4gPiArICrCoMKgwqAgc2xpY2UgcXVhbnR1bS4NCj4gPiA+ID4g
KyAqwqAgLSBBIE5PUk1BTCBwcmlvcml0eSByZXF1ZXN0IHdpbGwgcHJlZW1wdCBhIExPVyBwcmlv
cml0eQ0KPiA+ID4gPiArICrCoMKgwqAgcmVxdWVzdCB3aGVuIHN1Ym1pdHRlZCBhbmQgYmFzZWQg
b24gdGhhdCB0aW1lIHNsaWNlDQo+ID4gPiA+ICsgKsKgwqDCoCBxdWFudHVtIGJ1dCB3aWxsIG5v
dCBwcmVlbXB0IGEgSElHSCBwcmlvcml0eSByZXF1ZXN0DQo+ID4gPiA+ICsgKsKgwqDCoCB1bnRp
bCB0aGF0IHRpbWUgc2xpY2UgcXVhbnR1bSBoYXMgYmVlbiByZWFjaGVkLg0KPiA+ID4gPiArICrC
oCAtIEEgTE9XIHByaW9yaXR5IHJlcXVlc3Qgd2lsbCBuZXZlciBwcmVlbXB0IGVpdGhlciBhDQo+
ID4gPiA+ICsgKsKgwqDCoCBNRURJVU0gb3IgSElHSCBwcmlvcml0eSBjb250ZXh0Lg0KPiA+ID4g
PiArICrCoCAtIEN1cnJlbnRseSBLRVJORUwgbGV2ZWwgcHJpb3JpdHkgaXMgcmVzZXJ2ZWQsIGFz
IHRoZSBuYW1lDQo+ID4gPiA+ICsgKsKgwqDCoCBzdWdnZXN0cywgZm9yIGtlcm5lbC1zdWJtaXR0
ZWQgcXVldWVzIG9ubHkuDQo+ID4gPiA+ICsgKi8NCj4gPiA+ID4gwqBlbnVtIHhlX2V4ZWNfcXVl
dWVfcHJpb3JpdHkgew0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgWEVfRVhFQ19RVUVVRV9QUklP
UklUWV9VTlNFVCA9IC0yLCAvKiBGb3IgZXhlY2xpc3QNCj4gPiA+ID4gdXNhZ2UNCj4gPiA+ID4g
b25seSAqLw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgWEVfRVhFQ19RVUVVRV9QUklPUklUWV9M
T1cgPSAwLA0KPiA+ID4gPiAtLSANCj4gPiA+ID4gMi4zNC4xDQo+ID4gPiA+IA0KPiA+IA0KDQo=

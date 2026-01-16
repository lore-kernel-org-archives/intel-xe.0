Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E000C982C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 21:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B20C10E0F4;
	Fri, 16 Jan 2026 21:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UX8Jdg6X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F7B10E0F4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 21:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768597682; x=1800133682;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4UV6+1v0MU3PqZJYzx7h8OpdgvYgH3zOsizy8stz7Bk=;
 b=UX8Jdg6X3eJEVyg6oA5TdtMPuuFWI4NtjBn5EuwmTLJNaR887boDD0rP
 qhZdeEfaaD+Ziv9Y9aYnkOH7aubEVHIYD9KuNERsK3Wjt1BZBKDIkm/iB
 MNweGScVlibW6SCCnWvMDNX9L9Nh4OXNBZlcmoVnBN7Lmipn4Ob8a5v8k
 GbaXARva/tETw/FJxf9k/1ZYtkxaGPwBzfO304dvHbVWG1fWj8q4ewv6S
 cERVZ0+3GqIG13TYrdn0zs7XBXnP64EOaO2U/zxt9KYHxbYRwlJtJ5UCf
 QbssX1chcUZOIu+QUVreWYWfz4FBKfDeHQe3qtd+c8wX2Peyi0JIhPzlb g==;
X-CSE-ConnectionGUID: ySSNWHWiQAGRDpeloLWIVQ==
X-CSE-MsgGUID: OUu2GV8KTSGh4Ol6MR9cHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69118987"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69118987"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:08:01 -0800
X-CSE-ConnectionGUID: rI96HQNDSAGcAbJXU2W3Bw==
X-CSE-MsgGUID: 8URX/W5VR5WHZDukCjzGNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204568164"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:08:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:08:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 13:08:00 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:08:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBrR+f1Hf1J5G/QY+MyIcFq0qD+t52A7ccG1b/9rDuBB+YeSAqbM6dxwrOK1pLf+Hs1WD25BoPRFWS6qOSz8/mlgGPTil9vgmThIxX5DtJwi4bCQkmY70ak6V6crjC5XionH7Hz1SJFd71bqUIegTD71e8jPvxUM7hHNGss0S7fr8erV1YtxO1Q09X1Y5TddJ7kyES2homGPK1LHR5HxoDVJvmCRgXIcB9kDCbI4T2Rr0EhwBA/Z8gP0hTXthIN7UPPo7bRUV7ihfB2B8a9hrSYqZIdZDqkUtB/nYj2Yqbak7+YeT6MrKOLDA5Yt18auvAgJ9gWnrflAjplFo2RevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UV6+1v0MU3PqZJYzx7h8OpdgvYgH3zOsizy8stz7Bk=;
 b=Vg0gdxEfv9/bpU5tofRAqY5cSu7Q6BBxsScVRZsNOtq0Ml0tAlowhTPIdQOlL8+F458LhdcPnAkj6GTQN2cLo9PSou5k2SlgDMK9EKnrzG0NuD86l77pLasdVOH+uT9Q8NJjTISlLOPhrna+i37ndfIzitG1eAt2fJf0nH5GguXKmAMzRkmA2R7+nSL4Qrfc6gQg8WtZD+3ICcTNFmtbjxe9P/jyk77U5mQhzgOJVEFAzQmrh61WOEN6DRkO13O9y9d15eDL8Ek/v1sf/C7mTUDiDYeWXCtER89QCl+C6sau08nX3WbWHODN+a5o5zgY3Lcjb2N45DpEFWhH4fougQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB8599.namprd11.prod.outlook.com (2603:10b6:510:2ff::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.4; Fri, 16 Jan 2026 21:07:58 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 21:07:58 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Thread-Topic: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Thread-Index: AQHchbhao8aAyblFs0mVvuwtOV2/17VUjk2AgAAHoYCAAG0bgIAANJyAgAAOywCAAAZ+AA==
Date: Fri, 16 Jan 2026 21:07:57 +0000
Message-ID: <c71e46b5f818f3ef5c1d255b65d6fe4b7489804c.camel@intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWoPKWxu7zIqZPog@fdugast-desk>
 <c0d127d4-4219-4d92-8398-e971a815822f@intel.com>
 <7379f92d177312e90ff27df2a088897a1da920cc.camel@intel.com>
 <aWqjOp2yaIIxI287@lstrano-desk.jf.intel.com>
In-Reply-To: <aWqjOp2yaIIxI287@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB8599:EE_
x-ms-office365-filtering-correlation-id: 4e2f33c9-2480-41f4-d922-08de5543533a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aitrbXJlZFdQSUJUZ0htNnY5bXVTRTFWRlhIVmY1U1VhV1pENitaR3l2bnFQ?=
 =?utf-8?B?YkJtamFxTDluend0c1BoV2pvTGJiN3NleURCck5wQzlDRU1raGtoK3JSSHBR?=
 =?utf-8?B?ZGYzcU9PSGFzUzVnaWttYW1jQU92K3BpMjJCS3N4bTdHRjVweUpHc1Q5bGcz?=
 =?utf-8?B?Uk5nU3VEMUt3d2NvTEhES0V6YmNaY1RNMllkTHdQY0hJbFFHbm02UGFTSS9j?=
 =?utf-8?B?SjMyeEl0alBGaG1MKzRTSVlxcVE0NjVVK3RFa1IzTXJqQWlBN1FTUGZKaTlX?=
 =?utf-8?B?TmQwQWgvcTdtYnpKODliNm80TlJjZ1hGWjY0Ri9QeitZcXdtWnF1L1d5VFlW?=
 =?utf-8?B?TjhEZU13aDZ2MXVtR0pPWXFyd09sOWNZMWVIdDNmV25Pc3hrclBGcktNZ0I0?=
 =?utf-8?B?ZVZoVDZDOWkxNFlPdFhjMG5IVjFSdmVOanlCQ1pMU1djU2VPMnZCSVl4UXVE?=
 =?utf-8?B?bWdmS2JOTGFuMlZlNE9SUjBnY2pQTXhvWTJ2WDNQQmtmMTk4dmYwWnJVaWdy?=
 =?utf-8?B?U25zTUd0Yy83RG42ckJ0KzE0OTVTcHBMMWdZZmJEOFJDV1Vya05ZMTVFRUxw?=
 =?utf-8?B?TkpwR2hNNmZYOXJsVVQrc3UvZnFTUWlkRjNCNC9PREF0d29iTTJFS0kxTVg4?=
 =?utf-8?B?b0lPTjNwRGR4ZDRaNTl0UGh5UkFNcndBS0x6bjJ4RUtwUXFML1lhUzFiVGhF?=
 =?utf-8?B?U1l4ZS9pRzExMVkrRnRRb294NmpDbTRaZGhrREcrc1p1RlNJVG1jbkJPMWwz?=
 =?utf-8?B?aGkxdm5SRS9GTkFCYWVDZkdsQUIyd1JFdld1OWZpZlUwR2xMeHlDaUZjQkg2?=
 =?utf-8?B?K3JZRDVvWXRDc3Q0ZjN1ZlBtcjZIZXppZ2lobzUyOFIzb3F5a2RIQ0ZHSjJx?=
 =?utf-8?B?WUE0TldXcHI2SUNkaXIzaXUwWHNQU0hVRyswYXE0dmhLaXI4ZEhUZFpxVE41?=
 =?utf-8?B?bkxWRUpKMG1SMEllQXdrYWFSSzFyZzB5dFEzTW1yalZOVERRNGo3NkRkZGk4?=
 =?utf-8?B?RUwyZ3JGcGI5Q202b1hpSmVSZDhzdzhrQUY4RGVGN2I1ejV1MUc4Qi9Zamow?=
 =?utf-8?B?MVR3b08wYTkrUzNnL2hMK3NEZ0NYNXpNbjFFOFlXUGp5d1FFUk1TYlN2b3NH?=
 =?utf-8?B?aVFrRXo2d1lBc2lSaTZVWktRSkEvV1d1V0dVdktpYUp6SHlsQ3NmY3hYeDZ0?=
 =?utf-8?B?VWQrcWlMZFhyb2NNREg1WG9nVDFCWXZHcHJGa0JzSkNNOTRyaTJLemNKOTJq?=
 =?utf-8?B?QUw4T1JCVTBFbkE2Z251S3I2Qlo3YklyZGlaNzYyOHhvNXhzOHRPWU9DMSt3?=
 =?utf-8?B?VXczd29NdnhZUGlYZjdMYUR3WEtHbUJBdTVVaHFNdkpmbzJMWDYyNUJ0SHBa?=
 =?utf-8?B?cFhFWEZVVHhHZlFSTHhWTTl4ZlcvSkUxT0FBYkYvQlp1QlFsQ3JkeER4eFFV?=
 =?utf-8?B?aU1Mc0N2TkFGNnpvZkl3Zklpck9oMmJMZ2hIOW9ZY1p5YVJxSTcvUGZTbzBq?=
 =?utf-8?B?Tmt4MDBOeW51ZTNWNGxXV1RkdEcvT09CWXh2QUFJcEw2RW5IeWFmS2hZS3Iw?=
 =?utf-8?B?REZUN2MwOEF4bnpMcHJteVNqaTE1a2hFalN1WittRmZ2OHFiTHlVa01qQmFH?=
 =?utf-8?B?NEsycC9RTHpaU2RzTjYrOXNWRU1jQ2FydDBpbGhqZTlxS0Q3V0lhQ3k4aG42?=
 =?utf-8?B?dTNURjFSTEpSVG9sbk5zVStMOXVPd0RuaTJydXJTZE9KREJERzJsRHlWWHBn?=
 =?utf-8?B?ZlBZcjBNL1RBZXZtSTJDZEQzb04rdVVwQ2MxZ3Y3MmFadUZYTklQM1k1aFcy?=
 =?utf-8?B?YnNrOXBrQlhOUmRULzZWdDM5UkxDT3d4S1YyWEZuUGI0cEg1Sy9MOFdMWUwz?=
 =?utf-8?B?L0FnUWdnTUZHc1RiOHBhaVkvUUZlNDF1MDlibGdKZnRlTExIYkVOQ0l5Vzhw?=
 =?utf-8?B?QzRtZ0QzS0lUOFNXcFh0UWZqWWorT09DSytlSGMwZlpJVGlLdmFBVGhLNG1S?=
 =?utf-8?B?Zk5iRit0NEZvWUhIQVFJWkFrNmw3UDUwcTdtbTlSa2R5SVc1VmhaUTRVaG91?=
 =?utf-8?B?SkhyY1M2MDc2SFo5MmV1TVRZejB0ZzZWeGhjNVZHOWlzdm5NWDNzR0tFeGxy?=
 =?utf-8?B?ZlR1R0VLL212dWJZejBWeUZNVm9OQ3VqVWRiL3JrUm1XSG03ZWpnUnVkNklZ?=
 =?utf-8?Q?y/yUpLFspj6vjPbAD3xayiw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFRIY3dlc2pJSGFUQktuUmNpaTBobmdManpFNVpubnI1ajl5alNBbUU1ZGll?=
 =?utf-8?B?NE5HditUMlZrb2ZlNjBCNkhHMDFleXBpbElmUnU3SWxVZzc2WkUzTVkyQmZV?=
 =?utf-8?B?MWoyKzJPa0JLOFZ4UkJKZnMzMGlUVndlRlBuemxybm9YQ2VxbmhRbVZwQ29X?=
 =?utf-8?B?NTZyRitYSVMvNzhkelEvRTQxQjdKbUVLQ2lOTFJWRi90UkRyQjFZRTVXZGtF?=
 =?utf-8?B?NnpjVklWV2FxKzMxbjJobjA1OUNibVgrWHk4YmExTVBtcmJOejFLUnhzQkRG?=
 =?utf-8?B?MWZGUzZ2WG4vWDRHdW9XbDJhZm1yRUlRYzRIcFRrWWxHWWNWbDl5bXR5b1da?=
 =?utf-8?B?bnh0OHZGODVSNmNHSXd2SXB4ZWxmRkpGOCt2dmlFTzFnMEt3a1hQSnFLbyto?=
 =?utf-8?B?RlByejJoQjFKcVV5QlpsS2VRQzJIakVtYmlwb0pCeTlVTG1ZVVdheFFuWkhT?=
 =?utf-8?B?aE9waFRKdFdtejkrRW03aGV1NnFFZ3Q0dGlPU0NUSDdhLzNjSlJMS1FSek1p?=
 =?utf-8?B?aksxUVdlSnVIekdSemVoUGErcjBuNUVuT0k2Sm9wMDhlVjRDMXgrbmQxVStY?=
 =?utf-8?B?OTN1U05nNmJ1Ymw4SGtVZlliRlIwM0kwQ1I2aUdKVDRKQ3RQcnhrbVh3bys0?=
 =?utf-8?B?bGNtYWNCOElib1gzQ21NTU5iUGVuMmpmU2MreTNyL1dRanBNZzdKR2hRbDZ1?=
 =?utf-8?B?Tmo5bXMrOFhvQU54RHlsQloxQ29XeHAwdlY3ZmRQRTQxN3ErN0NNYmpoZytw?=
 =?utf-8?B?emRIU0dIdWtaaE9QVXlvN244ejNDTElQc2ZEcGtQVkxndlNsY0JGaDYycTg0?=
 =?utf-8?B?RlI2akhYNzgrMVJNK0dVUnZSOWRNcnJCalR0VEpOaDhkWXpuOGdnQjdSaHJ0?=
 =?utf-8?B?Sjg1a0tKSjE1ZStXUFJzTDV1MW4xeDBxdVBzckRuNFBxTGpTUUdrL0ZibGFO?=
 =?utf-8?B?QkVYUGZzSU44ZksxVXBnU2hNbkIwZm40SVYxZFo1OWVhKzVlenZlSUtSd1J0?=
 =?utf-8?B?ZUhyRW9xWkU4cm9WOEkrSzBWNmFNVTNzbkxhMUNaZGNBaDBjbVFSMUdCZ1V2?=
 =?utf-8?B?cGowaFM4Q3lOdGcxR0lJNFE5YzB1K3ZjU0hBYzFuNjhjUllUZkd6WlhBNy82?=
 =?utf-8?B?VkxGQVhHeERkMzBXZFF1MEoveU5KeU85N01FdDErS2doc3JHTGhnblhqTjBr?=
 =?utf-8?B?R2hxUjlRL0dTVjVZSHAwNlZiZHh6WFJjaVpvbFdYZTRwNEFPczlYSWxnOWVq?=
 =?utf-8?B?Z0hmSHdJZWlVb0JkWDZRMUJaQ3FUamQzeHp0Y3NIYlRiblM1dm4rQTh0ZGRv?=
 =?utf-8?B?UkJ1TTVxY0xxNldSYTRkaUFMa1k4anMrWWlNa3liSVMrVXlLRERidU41UlVK?=
 =?utf-8?B?eUhOeUNBN0ZtSlBFUkFJWnhFWnEvQURLbEl2OU5jRW1IeW1SOU1LL1UvQTky?=
 =?utf-8?B?S2d6RXBkNjBKeHdhcUQyZnk1WXYyYkthQkQ5RDBnMXl2VmRvKzVDMGNSSjda?=
 =?utf-8?B?QzlqTXl0aXJ6a3dFWDBaVEVvMDVvN2sxYnRNcGtTcmdNMjFRRW1zMGk3T2ov?=
 =?utf-8?B?bXhzVi9WTUliTTAwQXd6Z3RxdDV2aHk3bjB2c2dtME5tWmsrRUpJeWI3ai9N?=
 =?utf-8?B?WlBuQkMyam1uZTRQb1ZoWUk1VlFST2t5T3RzMDlzMXdsa3dwbUd6VUErK1hS?=
 =?utf-8?B?UTNvdFRkeHQ4a2x3bUV1c0N0emU0NVRacG1weDhjSDJ5YVMvNXFaYnZVSkpV?=
 =?utf-8?B?ZEI1SlIzTnU5U1lHRzd4VEVvS3FSNGlIeVZCQTJ5L0VSdkM3bk1pZ0U1K0h0?=
 =?utf-8?B?S2dvbGsxbzhSamoyU2plRFZNcTdtQ0VJVnY1TTJNWTBXOVp0NENxUXhuOWRP?=
 =?utf-8?B?d2xNUCs5cTRLQjh5ZmtyUkNLTFJIUXdId2g1SW9Pei9GM2RNTkJ4TTE1bEdT?=
 =?utf-8?B?T0NMTlZFZklOa0hTSDAyNjc5MUp2N3hwSkkvNVBmeTNFbFI3MkdON1BQaGdF?=
 =?utf-8?B?U2FXeFZicjF1dmJxWnh6U3U4VXdwVDZUZXUyb2pvYndYNGIyM0xyV2ZVWHBI?=
 =?utf-8?B?c3NnKzNsbnNBdmpWN2wwUERlVnFsUUlSLzY5OWxJV05RMWtkQjVsYmZUMkRl?=
 =?utf-8?B?Y3ZFcTRydWkrNWpvMlJ3RTJaS1RYaWRjVzFYenN5clU3UUorak1sN1V5WE1z?=
 =?utf-8?B?NEd6TGpVYm84VDZ3ZGZ0RTN0MGtnK3lNK2lSNVVOWTlKRHoyeTFlOFdDL3Iy?=
 =?utf-8?B?YzZWMFBWVVp0ZElsQ2UyOVlqMnhWekQ4RWN0cURwdE1MMmpXb0wraE1KdGRy?=
 =?utf-8?B?b3hIZzk3eVJzcDVPMTZPTXZxc0tpcmgzUHM2SW9YM0lURW1KVmdpczYxRWx5?=
 =?utf-8?Q?rhs5kZhcewui1FPU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CBA96BF955AE04A89343D86650B6B4A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2f33c9-2480-41f4-d922-08de5543533a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 21:07:58.0478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6EiccaiLKLD9q2tfxKwMzG/6YdBdDKiZGuUtJ783TD6H+raTf+ZcwhEwCETHF+jDskbxKHShDO5EPLYR0213j4LV6v94YbyukUTzSM5r12g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8599
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

T24gRnJpLCAyMDI2LTAxLTE2IGF0IDEyOjQ0IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBGcmksIEphbiAxNiwgMjAyNiBhdCAxMjo1MTo0NlBNIC0wNzAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDI2LTAxLTE2IGF0IDA4OjQzIC0wODAwLCBEYW5pZWxl
IENlcmFvbG8gU3B1cmlvIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IE9uIDEvMTYvMjAy
NiAyOjEyIEFNLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6DQo+ID4gPiA+IE9uIEZyaSwgSmFuIDE2
LCAyMDI2IGF0IDEwOjQ1OjM5QU0gKzAxMDAsIFpiaWduaWV3IEtlbXBjennFhHNraQ0KPiA+ID4g
PiB3cm90ZToNCj4gPiA+ID4gPiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCAwNDo0NTo0NlBNIC0w
ODAwLCBNYXR0aGV3IEJyb3N0DQo+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiBJZiBhIGJh
dGNoIGJ1ZmZlciBpcyBjb21wbGV0ZSwgaXQgbWFrZXMgbGl0dGxlIHNlbnNlIHRvDQo+ID4gPiA+
ID4gPiBwcmVlbXB0DQo+ID4gPiA+ID4gPiB0aGUNCj4gPiA+ID4gPiA+IGZlbmNlIHNpZ25hbGlu
ZyBpbnN0cnVjdGlvbnMgaW4gdGhlIHJpbmcsIGFzIHRoZSBsYXJnZXN0DQo+ID4gPiA+ID4gPiBw
b3J0aW9uIG9mIHRoZQ0KPiA+ID4gPiA+ID4gd29yayAodGhlIGJhdGNoIGJ1ZmZlcikgaXMgYWxy
ZWFkeSBkb25lIGFuZCBmZW5jZSBzaWduYWxpbmcNCj4gPiA+ID4gPiA+IGNvbnNpc3RzIG9mDQo+
ID4gPiA+ID4gPiBvbmx5IGEgZmV3IGluc3RydWN0aW9ucy4gSWYgdGhlc2UgaW5zdHJ1Y3Rpb25z
IGFyZQ0KPiA+ID4gPiA+ID4gcHJlZW1wdGVkLA0KPiA+ID4gPiA+ID4gdGhlIEd1Qw0KPiA+ID4g
PiA+ID4gd291bGQgbmVlZCB0byBwZXJmb3JtIGEgY29udGV4dCBzd2l0Y2gganVzdCB0byBzaWdu
YWwgdGhlDQo+ID4gPiA+ID4gPiBmZW5jZSwgd2hpY2gNCj4gPiA+ID4gPiA+IGlzIGNvc3RseSBh
bmQgZGVsYXlzIGZlbmNlIHNpZ25hbGluZy4gQXZvaWQgdGhpcyBzY2VuYXJpbw0KPiA+ID4gPiA+
ID4gYnkNCj4gPiA+ID4gPiA+IGRpc2FibGluZw0KPiA+ID4gPiA+ID4gcHJlZW1wdGlvbiBpbW1l
ZGlhdGVseSBhZnRlciB0aGUgQkIgc3RhcnQgaW5zdHJ1Y3Rpb24gYW5kDQo+ID4gPiA+ID4gPiBy
ZS0NCj4gPiA+ID4gPiA+IGVuYWJsaW5nIGl0DQo+ID4gPiA+ID4gPiBhZnRlciBleGVjdXRpbmcg
dGhlIGZlbmNlIHNpZ25hbGluZyBpbnN0cnVjdGlvbnMuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+IEZpeGVzOiBkZDA4ZWJmNmMzNTIgKCJkcm0veGU6IEludHJvZHVjZSBhIG5ldyBEUk0gZHJp
dmVyDQo+ID4gPiA+ID4gPiBmb3INCj4gPiA+ID4gPiA+IEludGVsIEdQVXMiKQ0KPiA+ID4gPiA+
ID4gQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8NCj4gPiA+ID4gPiA+IDxkYW5pZWxlLmNlcmFv
bG9zcHVyaW9AaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gQ2M6IENhcmxvcyBTYW50YSA8Y2FybG9z
LnNhbnRhQGludGVsLmNvbT4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJv
c3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4g
PiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYyB8IDkgKysrKysrKysrDQo+ID4g
PiA+ID4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMu
Yw0KPiA+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiA+ID4g
PiA+ID4gaW5kZXggYTFmZDk5ZjJkNTM5Li5jZDY0NWVlNDAwYjkgMTAwNjQ0DQo+ID4gPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiA+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4gPiA+ID4gPiA+IEBAIC0yODIs
NiArMjgyLDkgQEAgc3RhdGljIHZvaWQNCj4gPiA+ID4gPiA+IF9fZW1pdF9qb2JfZ2VuMTJfc2lt
cGxlKHN0cnVjdA0KPiA+ID4gPiA+ID4geGVfc2NoZWRfam9iICpqb2IsIHN0cnVjdCB4ZV9scmMg
KmxyYw0KPiA+ID4gPiA+ID4gwqAgDQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaSA9IGVt
aXRfYmJfc3RhcnQoYmF0Y2hfYWRkciwgcHBndHRfZmxhZywgZHcsIGkpOw0KPiA+ID4gPiA+ID4g
wqAgDQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiBEb24ndCBwcmVlbXB0IGZlbmNlIHNp
Z25hbGluZyAqLw0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgZHdbaSsrXSA9IE1JX0FSQl9P
Tl9PRkYgfCBNSV9BUkJfRElTQUJMRTsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBpZiAoam9iLT51c2VyX2ZlbmNlLnVzZWQpIHsNCj4gPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaSA9IGVtaXRfZmx1c2hfZHcoZHcsIGkpOw0KPiA+
ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpID0gZW1pdF9zdG9yZV9p
bW1fcHBndHRfcG9zdGVkKGpvYi0NCj4gPiA+ID4gPiA+ID4gdXNlcl9mZW5jZS5hZGRyLA0KPiA+
ID4gPiA+ID4gQEAgLTM0Nyw2ICszNTAsOSBAQCBzdGF0aWMgdm9pZA0KPiA+ID4gPiA+ID4gX19l
bWl0X2pvYl9nZW4xMl92aWRlbyhzdHJ1Y3QNCj4gPiA+ID4gPiA+IHhlX3NjaGVkX2pvYiAqam9i
LCBzdHJ1Y3QgeGVfbHJjICpscmMsDQo+ID4gPiA+ID4gPiDCoCANCj4gPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBpID0gZW1pdF9iYl9zdGFydChiYXRjaF9hZGRyLCBwcGd0dF9mbGFnLCBkdywg
aSk7DQo+ID4gPiA+ID4gPiDCoCANCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoC8qIERvbid0
IHByZWVtcHQgZmVuY2Ugc2lnbmFsaW5nICovDQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBk
d1tpKytdID0gTUlfQVJCX09OX09GRiB8IE1JX0FSQl9ESVNBQkxFOw0KPiA+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChqb2ItPnVzZXJfZmVuY2UudXNlZCkgew0K
PiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpID0gZW1pdF9mbHVz
aF9kdyhkdywgaSk7DQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGkgPSBlbWl0X3N0b3JlX2ltbV9wcGd0dF9wb3N0ZWQoam9iLQ0KPiA+ID4gPiA+ID4gPiB1c2Vy
X2ZlbmNlLmFkZHIsDQo+ID4gPiA+ID4gPiBAQCAtMzk5LDYgKzQwNSw5IEBAIHN0YXRpYyB2b2lk
DQo+ID4gPiA+ID4gPiBfX2VtaXRfam9iX2dlbjEyX3JlbmRlcl9jb21wdXRlKHN0cnVjdCB4ZV9z
Y2hlZF9qb2IgKmpvYiwNCj4gPiA+ID4gPiA+IMKgIA0KPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoGkgPSBlbWl0X2JiX3N0YXJ0KGJhdGNoX2FkZHIsIHBwZ3R0X2ZsYWcsIGR3LCBpKTsNCj4g
PiA+ID4gPiA+IMKgIA0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyogRG9uJ3QgcHJlZW1w
dCBmZW5jZSBzaWduYWxpbmcgKi8NCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGR3W2krK10g
PSBNSV9BUkJfT05fT0ZGIHwgTUlfQVJCX0RJU0FCTEU7DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+
ID4gSUdUIHRlc3RzIHdoaWNoIGNhbGxzIGNvbXB1dGUtd2Fsa2VyLCB0aGVuIGJiZSBhcmUNCj4g
PiA+ID4gPiBhc3luY2hyb25vdXMNCj4gPiA+ID4gPiAoZG9uJ3QNCj4gPiA+ID4gPiB3YWl0IGZv
ciBjb21wbGV0aW9uLCBwaXBlLWNvbnRyb2wgaXMgbmVjZXNzYXJ5IHRvIHdhaXQgb24NCj4gPiA+
ID4gPiBjb21wdXRlLXdhbGtlcikuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gTWF5IHlvdSB0cnkg
dG8gcHV0IGFyYiBkaXNhYmxlIGFmdGVyIGVtaXRfcmVuZGVyX2NhY2hlX2ZsdXNoPw0KPiA+ID4g
PiBUaGFua3MgWmJpZ25pZXcsIHhlX2NvbXB1dGVfcHJlZW1wdCB0ZXN0cyBkbyBwYXNzIHdpdGgg
dGhpcw0KPiA+ID4gPiBjaGFuZ2U6DQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcmluZ19vcHMuYw0KPiA+ID4gPiBpbmRleCBjZDY0NWVlNDAwYjkuLmQ4Y2NlYWI5N2Zh
OCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMN
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4gPiA+ID4g
QEAgLTQwNSwxMSArNDA1LDExIEBAIHN0YXRpYyB2b2lkDQo+ID4gPiA+IF9fZW1pdF9qb2JfZ2Vu
MTJfcmVuZGVyX2NvbXB1dGUoc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iLA0KPiA+ID4gPiDCoCAN
Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCBpID0gZW1pdF9iYl9zdGFydChiYXRjaF9hZGRyLCBw
cGd0dF9mbGFnLCBkdywgaSk7DQo+ID4gPiA+IMKgIA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgIGkg
PSBlbWl0X3JlbmRlcl9jYWNoZV9mbHVzaChqb2IsIGR3LCBpKTsNCj4gPiA+ID4gKw0KPiANCj4g
WWVzLCBJIGFsc28gY29uZmlybWVkIHRoYXQgZW1pdF9yZW5kZXJfY2FjaGVfZmx1c2goKSBpcyB0
aGUNCj4gcHJvYmxlbWF0aWMNCj4gaW5zdHJ1Y3Rpb24gdGhhdCBoYW5ncyB3aGVuIHByZWVtcHRp
b24gaXMgZGlzYWJsZWQuDQo+IA0KPiA+ID4gDQo+ID4gPiBUaGUgcGlwZSBjb250cm9sIGluIGVt
aXRfcmVuZGVyX2NhY2hlX2ZsdXNoIGlzIHByZWVtcHRhYmxlLCBzbw0KPiA+ID4gaGF2aW5nDQo+
ID4gPiB0aGF0IGJlZm9yZSB0aGUgYXJiIG9mZiBzd2l0Y2ggaW52YWxpZGF0ZXMgd2hhdCB0aGUg
cGF0Y2ggaXMNCj4gPiA+IHRyeWluZw0KPiA+ID4gdG8gDQo+ID4gPiBkbyAoaS5lLiwgbm8gcHJl
ZW1wdGlvbiBwb2ludHMgYWZ0ZXIgdGhlIGJiIGNvbXBsZXRlcyB1bnRpbCB3ZQ0KPiA+ID4gc2ln
bmFsDQo+ID4gPiB0aGUgZmVuY2UpLg0KPiANCj4gWWVzLCBkaXNhYmxpbmcgcHJlZW1wdGlvbiBh
ZnRlciBlbWl0X3JlbmRlcl9jYWNoZV9mbHVzaCgpIG1ha2VzIHRoZQ0KPiByZW5kZXIvY29tcHV0
ZSBlbmdpbmUgY2hhbmdlIGluIHRoaXMgc2VyaWVzIHVzZWxlc3MsIGFzDQo+IGVtaXRfcmVuZGVy
X2NhY2hlX2ZsdXNoKCkgaXMgcHJlZW1wdGFibGUgYW5kIHRoZSBnb2FsIG9mIHRoZSBzZXJpZXMN
Cj4gaXMNCj4gdG8gYXZvaWQgcHJlZW1wdGluZyBpZiB0aGUgQkIgaXMgZG9uZSBpbiB0aGUgZmVu
Y2Ugc2lnbmFsaW5nDQo+IGluc3RydWN0aW9ucy4NCj4gDQo+ID4gPiANCj4gPiA+IFdoeSBkb2Vz
IGRpc2FibGluZyBhcmJpdHJhdGlvbiBjYXVzZSB0aGlzIHNwZWNpZmljIHBpcGUgY29udHJvbA0K
PiA+ID4gdG8NCj4gPiA+IGhhbmc/DQo+IA0KPiBUaGlzIGlzIHdoYXQgd2UgbmVlZCB0byBmaWd1
cmUgb3V0LiBJIGxvb2tlZCBhdCBpOTE1LCBhbmQgdGhleSBoYXZlDQo+IHByZWVtcHRpb24gZGlz
YWJsZWQgYXJvdW5kIHNlY3Rpb25zIHZlcnkgc2ltaWxhciB0bw0KPiBlbWl0X3JlbmRlcl9jYWNo
ZV9mbHVzaCgpLg0KPiANCj4gSSDigJltIHJhaXNpbmcgdGhpcyB1cCB0aGUgbWFuYWdlbWVudCBj
aGFpbiB0byBzZWUgaWYgd2UgY2FuIGZpbmQgYW4NCj4gb3duZXINCj4gdG8gZGVidWcgaXQsIGFu
ZCBwZXJoYXBzIGV2ZW4gZ2V0IGFuIFNWIHRyYWNlIHRvIGZpZ3VyZSBvdXQgd2hhdCBpcw0KPiBn
b2luZyBvbi4gSSBiZWxpZXZlIHRoaXMgc2VyaWVzLCBpZiB3b3JraW5nLCB3b3VsZCBtYWtlIG91
ciBzdGFjaw0KPiBwZXJmb3JtDQo+IGJldHRlciwgc28gaXQgd291bGQgYmUgZ29vZCB0byBnZXQg
c29tZXRoaW5nIGZ1bmN0aW9uYWwgaGVyZS4NCj4gDQo+ID4gDQo+ID4gQXJlIHdlIGVuYWJsaW5n
L2Rpc2FibGluZyBwcmVlbXB0aW9uIGZyb20gdGhlIGJhdGNoIHRvbz8gSXQgc2VlbXMNCj4gPiBs
aWtlDQo+IA0KPiBXZSBhcmUgbm90IGRpc2FibGluZyBwcmVlbXB0aW9uIGluIHRoZSBiYXRjaCwg
b25seSBpbiB0aGUgZmVuY2UNCj4gc2lnbmFsaW5nLg0KDQpUaGlzIHdhcyBleGFjdGx5IG15IHBv
aW50LiBGcm9tIGJzcGVjLCBNSV9BUkJfT05fT0ZGICJyZW1haW5zIGRpc2FibGVkDQp1bnRpbCBy
ZS1lbmFibGVkIHRocm91Z2ggdXNlIG9mIHRoaXMgY29tbWFuZC4iIFNvIGlmIHdlIGFyZSBleHBs
aWNpdGx5DQpkaXNhYmxpbmcgYmVmb3JlIHRoZSBiYXRjaCBpcyBydW5uaW5nLCB3ZSBuZWVkIHRv
IGV4cGxpY2l0bHkgcmUtZW5hYmxlDQppZiB3ZSB3YW50IHRvIGJlIGFibGUgdG8gcHJlZW1wdCBs
YXRlciBmb3Igd2hhdGV2ZXIgcmVhc29uLg0KDQpUaGF0IHNhaWQsIHRoaXMgY29tbWFuZCBpcyBh
bHNvIG1hcmtlZCBwcml2aWxlZ2VkLCBzbyBob25lc3RseSB3ZQ0KcHJvYmFibHkgd2FudCB0byBt
YWtlIHN1cmUgdGhpcyBpcyBlbmFibGVkIGZvciBiYXRjaGVzIHRoYXQgbWlnaHQgbmVlZA0KcHJl
ZW1wdGlvbi4gTUlfQVJCX0NIRUNLIG9uIHRoZSBvdGhlciBoYW5kIGluZGljYXRlcyBpdCBjYW4g
YmUNCiJwcm9ncmFtbWVkIGluIGEgcmluZyBidWZmZXIgb3IgYmF0Y2ggYnVmZmVyIi4NCg0KSSBk
b24ndCB0aGluayB0aGVyZSdzIGEgd2F5IHdlIGNhbiBvbmx5IGFwcGx5IE1JX0FSQl9PTl9PRkYg
b25seSB0byB0aGUNCmZlbmNlIHNpZ25hbGluZyBhbmQgbm90IHRoZSBiYXRjaCBzaWduYWxpbmcu
DQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiA+IHRoZSBiYXRjaCBwcmVlbXB0aW9uIGNvbnRy
b2wgc2hvdWxkIGJlIG93bmVkIGJ5IHRoZSB1c2VyIGFuZCBub3QNCj4gPiByZWx5DQo+ID4gb24g
dGhlIHJpbmcgY29uZmlndXJhdGlvbiBoZXJlICh3aGljaCBtaWdodCBoYXZlIG90aGVyIGludGVu
dGlvbiBhcw0KPiA+IHNlZW4gaGVyZSkuDQo+ID4gDQo+ID4gQWxzbyB3b3VsZCBiZSBpbnRlcmVz
dGluZyB0byBrbm93IGlmIHRoZSBjb21wdXRlL3JlbmRlciBVTUQNCj4gPiBjb21wbGlhbmNlDQo+
ID4gdGVzdHMgYXJlIHBhc3Npbmcgd2l0aCB0aGlzIGNoYW5nZS4NCj4gPiANCj4gDQo+IEFncmVl
Lg0KPiANCj4gTWF0dA0KPiANCj4gPiBUaGFua3MsDQo+ID4gU3R1YXJ0DQo+ID4gDQo+ID4gPiAN
Cj4gPiA+IERhbmllbGUNCj4gPiA+IA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIC8qIERvbid0
IHByZWVtcHQgZmVuY2Ugc2lnbmFsaW5nICovDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgZHdb
aSsrXSA9IE1JX0FSQl9PTl9PRkYgfCBNSV9BUkJfRElTQUJMRTsNCj4gPiA+ID4gwqAgDQo+ID4g
PiA+IC3CoMKgwqDCoMKgwqAgaSA9IGVtaXRfcmVuZGVyX2NhY2hlX2ZsdXNoKGpvYiwgZHcsIGkp
Ow0KPiA+ID4gPiAtDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKGpvYi0+dXNlcl9mZW5j
ZS51c2VkKQ0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpID0gZW1p
dF9zdG9yZV9pbW1fcHBndHRfcG9zdGVkKGpvYi0NCj4gPiA+ID4gPiB1c2VyX2ZlbmNlLmFkZHIs
DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBqb2ItDQo+
ID4gPiA+ID4gdXNlcl9mZW5jZS52YWx1ZSwNCj4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBG
cmFuY29pcw0KPiA+ID4gPiANCj4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+IFpiaWduaWV3DQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaSA9IGVtaXRfcmVuZGVyX2NhY2hl
X2ZsdXNoKGpvYiwgZHcsIGkpOw0KPiA+ID4gPiA+ID4gwqAgDQo+ID4gPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgaWYgKGpvYi0+dXNlcl9mZW5jZS51c2VkKQ0KPiA+ID4gPiA+ID4gLS0gDQo+ID4g
PiA+ID4gPiAyLjM0LjENCj4gPiA+ID4gPiA+IA0KPiA+ID4gDQo+ID4gDQoNCg==

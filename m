Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F3BC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 21:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E352310E1ED;
	Mon, 17 Jun 2024 21:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AURztwhT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCCC10E1ED
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 21:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718658876; x=1750194876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=D+iM4V0VNk+CvCzvOXJHLM8r5zsVS5qu5Hqjcgryomo=;
 b=AURztwhTPAUf7gBccuMrv1Vs47rr2GLD/MrYKV7t9PONIIi1sovhDzD/
 C97Lrd1Vf/4sOiulntBv7J/MNpiqln70JaLGdLz9fkj1lJFV8m3xT6TkI
 UtgxpRaO9T81LG8j+clXGVin80BOb+9gucYQOdm/HN5P8nwlGchSOlZXH
 iUdNC3Xlcg4U9pgdvKi+zmFq0kM6kf8VcQbP0JK4KwC1yehedHqWWNC6v
 1siD1VXlZIyEdA2Gvu5IT0CdTuKckc3mtUGDbCKsWG6JvCyZkXJ922ql9
 EKAbOFdP3axCEV421nDEKU7jhnkNQQU7fkUjX2TyrRR+0vNOWhR1+W3O8 g==;
X-CSE-ConnectionGUID: QK/xHBwnSdaOfzwrMNuYaw==
X-CSE-MsgGUID: J8D8vLnmSxSfZ1CC5x1tWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26084212"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="26084212"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 14:14:35 -0700
X-CSE-ConnectionGUID: HnxAYxVXRVqP8lGVlUV0Pg==
X-CSE-MsgGUID: 9GXO4xx/Qm6yHcx65jLt+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="45686463"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 14:14:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 14:14:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 14:14:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 14:14:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGIkPSZ1OHRu7zv6Fyy7CeYnxGJI8E4cY0gkTa6b0vf/nSKGcmuqwCHAbe+zGeRGtHigpCsqDCVBQvE87hjrBs8jyEaHN3YDjOosT0blj726VuvTIppdqIToKP1O3fwKVZGvNmQWQd6RLsYoMq3XvIekqlAloTf8lEaiCvSy/gxVWjV5dBC9SYnRRj5ge/q3JmGFMBituN2cGaevwIdqMyVI1ziB71QY6pdd66fIB9zzfSJI2xWcUqVz575OluMusRozn0+KLvIWIwD9sN+Oi5QpdlRJ1egqEiGnzI/OP6VA4znwlg+iaFWJWFSXCkYygmZI3iTudNUzpFjNyEa8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+iM4V0VNk+CvCzvOXJHLM8r5zsVS5qu5Hqjcgryomo=;
 b=SQHLEVj/pzcXMNtdLQVBYHF/4sj2aWVbmUvlMmqC06tp/BCunvt9SUcmMU+MQkX+Q9q9+CV6cStGXudfle7CNtsuuY6Kdbnlz8gcq9WzwpikMLffiT1TFRfmzpZau9cuRSu72SRasETHi7oxkqS2fIfY4lxNiJODMGtFMflrIqx1LAKDxGrb9FI0GXLpT7vPt3uLuQquYu/BgRQsNFYv0cNPIWRroQQPY4dbJhSPkjh7KB0qsCUD4ZJoJEQPfClPiobRMkGyJxllMo82Pv50Hmr/sy4270xgIhr09aIBQYDM9SFdxJZOIT/JJbC4NlC0xdwF6uGZyEcZOqx955hThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 21:14:28 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 21:14:28 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v15 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH v15 00/17] Add OA functionality to Xe
Thread-Index: AQHar9da2moQLBpzvU+0kMW8h3xYubG5RTkAgAHyQ4CAABA6AIAMMzmAgAUAmYCAABjzgIAAAn+A
Date: Mon, 17 Jun 2024 21:14:28 +0000
Message-ID: <87543a50eb8056fbc1e9894d2c149bdc818d7124.camel@intel.com>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
 <6bee6a666dd0ab8440ca74d692a80788bfb1d748.camel@intel.com>
 <85v82ldew2.wl-ashutosh.dixit@intel.com>
 <8734pp94hx.wl-ashutosh.dixit@intel.com>
 <85sexfd0cy.wl-ashutosh.dixit@intel.com> <ZnCQK5ZFiTlj6CRv@intel.com>
 <87h6drz3dy.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87h6drz3dy.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BL1PR11MB5254:EE_
x-ms-office365-filtering-correlation-id: 5c75bd21-b6fb-47c7-f906-08dc8f1278f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?ZWQyT1ZUNER3c2pWOG54TWpHZ2dTbTNRcmZhUWU4OFBhN1Jxa3prcm8xajIx?=
 =?utf-8?B?K3llVE51SDdld1VzdGNETlFQaUNZa2twVWlSME9wTk9YbldwcHlXS2Qvc0RF?=
 =?utf-8?B?MDJCNDBKUzU4N2JTUUJEd3JwYTR3cDVveDNReHZjczI1ZExwemRuOHIwVlZP?=
 =?utf-8?B?aXc0Q0NLS0lMRWpVMnliY2dmSnVKNGFqRjZCRU1KcFROeWRPZkFBUkdNZUxk?=
 =?utf-8?B?MmY4ZkxZekUzZDlHK0hnQmtEL2U2a1haVnpIN2ZPQUVDY2YyTHR1SzEyOHB1?=
 =?utf-8?B?S0c0T05vU3A3b0c3T1hZWkMzemJ6NHU2S0l2RWZZM0UzS2lYK2NwZGxIQnBo?=
 =?utf-8?B?SU0wc0RNYldzbFpTZkpZVXdYYzRGU1lpa3pWcTBUL3lIS28yajBkWEFuMzBH?=
 =?utf-8?B?cEQxY3FJQXFISUExVW82RlVxOFRQMVRXcm1mWjdsZnUvS1RwZkY0aWgwY0RU?=
 =?utf-8?B?QVhZcmovUDNzc1lzMDJlQmkvczg5MWJoYk5VWE5VZWRxQ3VXNTUxZWdibTZO?=
 =?utf-8?B?eEYwY0MyUXZ0S0NXV2d1R2d6bDE0T2g0NGdNb0Q0RmVNTjdZTVQwOUhPSXpG?=
 =?utf-8?B?Z3Z6Q3lmdy9PU0REMDBZWnZOM1ZCN2tLM3BST3JNYUtyRVRNcFJvd1JmSmFw?=
 =?utf-8?B?WGdnTE9RMmwzU1JRamtnNzJsMWNlOFY4ZEM1T004TEdDNWI3cXlTYlV3UEF6?=
 =?utf-8?B?ZWVZNkszQTFwWVB6emM1Ulp6SmhHSG1WUmpzMmJSaHp3am1NRXJCdXRxRUcx?=
 =?utf-8?B?WFY2Sng1VStBK1hwRE5HSDNuVzMyQmNNdTFRYk1LSzZ0Sk5mYm5XL0J6L2dD?=
 =?utf-8?B?bUNmeEJuSXBva2FoZXJQL2dnb09VdjFIY3g0b3lEYmt2VXdML3hBZUlKZldJ?=
 =?utf-8?B?Yjc5TVk5ZnZsTUc2bmk0aXFOZmwzMmNoK3FWS1VKWHkzUlNVcVo0UmY1Ym5i?=
 =?utf-8?B?MG5vVE83dkxwTmVaYTNwUjRCWHZScE5ZeTJoeWZ2ZjZ1RzNPc0pESTAwNlow?=
 =?utf-8?B?YldHZmIyeDNqWktMSWxDWkl3NEhZb3p6dlNDRGg1Rmp0MGJxdjU1M1hVVmlJ?=
 =?utf-8?B?MVpDb2VObGV6cjNmUlhrVjlGZVVYenFjdTlKNDlQUGNYOUYyb1ZPZzg1SGU0?=
 =?utf-8?B?TkxiM1BBNktDd0JvTWJXTTVPSFhOd25DN0tFTjRGQm85ODNhRG80QVo4T0Qy?=
 =?utf-8?B?eVBsY2FINndzM1lJMXA2UVBhU2lCYmkyRFg4SmpoeE1NOUhLeVJRMjNJOW1S?=
 =?utf-8?B?VytvOGRaSERlbmI3dzFZWFRtMW02U3E0V0d5Sm5rdTJhU3hVUWQwSUk0RFFt?=
 =?utf-8?B?UDlHRXlia2Zvc01DRm9nd2FoVENXWDBGdzJ1TGU1eklJenJOYTJxRkJ5UjNk?=
 =?utf-8?B?Vm16cWNLZXBIUk5keUdWdTF2SjBDOEVmR3pyRmluak1RM1JOMllRaWZYTEN0?=
 =?utf-8?B?S1I0M0pnR0c3b3BlTEZURHhURFljblNMSGFhVDlPTWdTMno2UzdjaEJtN3FW?=
 =?utf-8?B?NHFvRGM5MmhZQXcxSHhJbGdFa3ZETXRNalkyZENoNEI1TFFLTDZwVFZOOGQy?=
 =?utf-8?B?SjZ6OEZra2NzWitQWkRMWlM1OEhOU3R6eUdST1VlVVJCdkdRSXpZOXdUMlRU?=
 =?utf-8?B?VWJka0xWWUNEMGdGV25hQzFmZUZPSlAyTld3clpUUHh3bVlib21rQjZwYU93?=
 =?utf-8?B?MjZ1RVlITElIZFhUaXJTNXJ5eWlZbVBmUGVMZFYxVEtPS2o2QndLa0xSaEo5?=
 =?utf-8?Q?OejmWc9AdRHBXpxSWFBQ0j3aXfOwIGcv8Yg90f+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUF2d0JadjJIVVI3N29KdmJDV0s2SW1oT3VJMVp3K2dmSElQTXg1Tm5VODdC?=
 =?utf-8?B?MzFsU25jUDNTVjlGWk5kdk9qM2lEWTYyWWc3c3VPSGRkYUJIZ1VkbG8vYVM3?=
 =?utf-8?B?Zm9KSlFiVjUvbWtSTVpvZnNycXprMkNNRExmRGFkblFhVG9qSzNpZFBqYStD?=
 =?utf-8?B?em1Lb29HYUhCeEVPWSszVkM0YURWYmhkM2F1VjA5bVFVVElVQUQrenI5SFE3?=
 =?utf-8?B?cWt2NFRTdkhTYkg3bGFFbTFZZ0ZWVmdYUVR5MDZoQVNSbFBZZ0dPMVoxVDRn?=
 =?utf-8?B?ZTJkYUd3OEdKSnFwRTJtNlV4SEJXRlB0R2sydnQzV3BrNzZoV1FhZ01ZaVNX?=
 =?utf-8?B?djUwS3VmbDYrbFZrdUlPMXllb0owYkhYWFoyWG9uaHI4VFRlWTZQeGVZSjdk?=
 =?utf-8?B?UEVFZDIyVnAzanBKRTBEWDFKdnJKUlZLVWhaYmR3ZXpkL3R1WkczSVlLUk1B?=
 =?utf-8?B?bWhjQStvUUdCbVBZWU4vVFpYYVNEVUI0dTJDSCs5WEVyM1ZWMGIxVWFJeGVs?=
 =?utf-8?B?Z2pUamJZRlp2ZW8rNmh0ai9vS0FwakFnWDZhRlNwRVdrQWRrY0NsVXRkQzNJ?=
 =?utf-8?B?SHh5MkxrWDVWcWk2TVdYbVlWOG94WE83M0NFL1RGemtQd2NHeFJvUWhvTGhn?=
 =?utf-8?B?N3ZuVFZHeHhORGVzTE9rVzBqR0tzRjRoV3RPSUNDYkdKOGZEbVk0ZmpqcWJY?=
 =?utf-8?B?WGIxdEgvd1Z3Y1VYNjZ1MTRpR1ZlenF3QUhEOVFlUjhWbXcvQTNKNVB6Ykk0?=
 =?utf-8?B?R2JsUjRjeGhpN2lPM2ZiY0tQUWpJTXlEQWNyZjUwK1ZMejBkYm03dTU2MTl1?=
 =?utf-8?B?Yk1SamowMEJIVHg4UGJpUHV4ZnFCVWpneDA0Y3g2OGJONXZyY1dZUFpaa1R1?=
 =?utf-8?B?RWk4OW02L3hqQURKNVZZS05salNwaU53RmF6d2xXK1dKWFZFeEVHOHk2b1FM?=
 =?utf-8?B?elJoeHhidVk5RW9SSmYwMmpxZHdUWGpmaDNaQlFPRVJVQmlqRUxmaCtSdXBU?=
 =?utf-8?B?enNVRytDM3JJVE5seTZVWTdVVStwaG4yMG5GMWo5M3cwTS9XZDhmeUF6SFla?=
 =?utf-8?B?bjFianNYUFozQ1ZqNXJPbkcvWHF1djFEQncycUdGZEU4dkJyUmxJUkNNV2d5?=
 =?utf-8?B?NzRXVWZzVGdDVlpqcm41Y0pwMU9HVUNMdXZwYStXY2FaQkIwdGJkeEU4endO?=
 =?utf-8?B?V2pFYmZkVmR2a3Y2YUZYRGlBYXVqWmlQNUlGbms0ZEcyeVJ2dWVWYktjSHIy?=
 =?utf-8?B?MkdsMUo1bW9nQmZVNk02dy9CY3dJZlVmVWZRKzBVMThpT0QxZDFCemQ3UXhU?=
 =?utf-8?B?TC9tTzdvU0ZXL2lHa1U5NERWb1JvZHRodmptYUNaVFFxN09WZWg0S09VNnFI?=
 =?utf-8?B?VGtVcmRNa2ZENVJhVXpLQlBoQ1lhYUVsejNtaUxWR3lYWEVJNjhUTUNET2Z3?=
 =?utf-8?B?K2IyWHE2OEphd2xSOXFsY1hMSTh3Y3E4Z0Z4QllhcXE2Q3gxL21kRitwWjlM?=
 =?utf-8?B?VEMrWlFMNmk4L1h6empMbCs2Y1Fsbzh2aFZSckVJclVLRVJGWjhJWmRzSWFQ?=
 =?utf-8?B?SERTdmpxc1gzdi9zT3U3SWNEeWcyelZzYTM4eUR3blFLRERlOE5zWlI5cUEv?=
 =?utf-8?B?SWI0QzluU2toTUF2Z0hOQVg0UVJ0ZDg3SS9vKzdMOFBVaUpBQTNYdXFpSGpB?=
 =?utf-8?B?aXd0MGxmVFUyVXV6bzFpcWFaanNValNhTUFyZkNHV3RPeG1ZbTdxbHVJcFRn?=
 =?utf-8?B?aVAwY1RUdGYzNmFkNmk5OCtlYURkQjREZXVoL0U5bmk2bjVZWFpqNEtJV0Q0?=
 =?utf-8?B?UVgrUEpOVnlNZGo5YW5uc2dsMXZTMnRnQWhBNllLTzVOak1hQUlyNnpVV2Rm?=
 =?utf-8?B?ckxmYVpIR09lMy93SCtGS2NxelMyR2hHM3h2QWhPM25qZ0kybldXQ21Wd3Ex?=
 =?utf-8?B?OWhTN3dsYWh6Nm4xU0ZwM0Q3V2N5QmRPWnNFUFY2cE81cXhMK2drSlFoS3hl?=
 =?utf-8?B?L3lqbUhpdS9nMnNzejBUb2tlbUx3Q2F6NGc5cWJycC9nVktzTlJmRlR3amgx?=
 =?utf-8?B?Nmhlc0Foa2FYV3ZRMlJNNjE2Nm41MFY3UUVZUk1QbmV5NDRYclErLzRRWHB4?=
 =?utf-8?B?OXZKYlpiSnlqZ1NzYlBFT3VSUE0xYW9aYUdkdzdtRjkzdW1ycEJVSDViRFRH?=
 =?utf-8?B?dVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B11FF8ADA624E446BB6A2DCA7AAE53C1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c75bd21-b6fb-47c7-f906-08dc8f1278f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 21:14:28.1120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FC2T3RlU9c/7pPiJ68vVq2bwDIRz0l88obyZy6Ai7IPRyxuElozb2O+JoE5HgaluG57aW9lTdQFadJSMxEBgyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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

T24gTW9uLCAyMDI0LTA2LTE3IGF0IDE0OjA1IC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIE1vbiwgMTcgSnVuIDIwMjQgMTI6MzY6MTEgLTA3MDAsIFJvZHJpZ28gVml2aSB3cm90
ZToNCj4gPiANCj4gDQo+IEhpIFJvZHJpZ28sDQo+IA0KPiBUaGFua3MgZm9yIHJlc3BvbmRpbmcg
OikNCj4gDQo+ID4gT24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgMDg6MTI6NDVBTSAtMDcwMCwgRGl4
aXQsIEFzaHV0b3NoIHdyb3RlOg0KPiA+ID4gT24gVGh1LCAwNiBKdW4gMjAyNCAxMzo1NDoxOCAt
MDcwMCwgRGl4aXQsIEFzaHV0b3NoIHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4gT24gVGh1LCAw
NiBKdW4gMjAyNCAxMjo1NjoxMyAtMDcwMCwgRGl4aXQsIEFzaHV0b3NoIHdyb3RlOg0KPiA+ID4g
PiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gSGkgTHVjYXMgLyBSb2RyaWdvIC8gVGhvbWFzLA0KPiA+
ID4gPiANCj4gPiA+ID4gPiBPbiBXZWQsIDA1IEp1biAyMDI0IDA3OjEyOjU0IC0wNzAwLCBTb3V6
YSwgSm9zZSB3cm90ZToNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEhpIEpv
c2UsDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBPbiBTdW4sIDIwMjQtMDUtMjYgYXQgMTg6NDMg
LTA3MDAsIEFzaHV0b3NoIERpeGl0IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBQbGVhc2Ugc2VlIGNv
dmVyIGxldHRlciBmb3IgdjcgaGVyZToNCj4gPiA+ID4gPiA+ID4gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjEwODQvI3JldjcNCj4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+IEZvciBjaGFuZ2VzIGluIGxhdGVyIHZlcnNpb25zIHNlZSBjaGFuZ2Vsb2cgYmVs
b3cuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBUaGlzIHNlcmllcyBpcyBhbHNvIGF2
YWlsYWJsZSBhdDoNCj4gPiA+ID4gPiA+ID4gICAgICAgICBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvYWRpeGl0L2tlcm5lbC8tL3RyZWUveGUtb2ENCj4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+IFRoZSBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIGFnYWluc3QgdGhpcyBJR1Qgc2Vy
aWVzOg0KPiA+ID4gPiA+ID4gPiAgICAgICAgIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9hZGl4aXQvaWd0LWdwdS10b29scy8tL3RyZWUveGUtb2ENCj4gPiA+ID4gPiA+ID4gCW9yLA0K
PiA+ID4gPiA+ID4gPiAJaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8x
MzAwMzMvDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBPcGVuc291cmNlIGNvbnN1bWVy
cyB1c2luZyB1YXBpIGluIHRoaXMgc2VyaWVzOg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ID4gZ3B1dmlzOg0KPiA+ID4gPiA+ID4gPiAJaHR0cHM6Ly9naXRodWIuY29tL21pa2VzYXJ0L2dw
dXZpcy9wdWxsLzg2DQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBtZXNhOg0KPiA+ID4g
PiA+ID4gPiAJaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdl
X3JlcXVlc3RzLzI5MzEyDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBUZXN0LXdpdGg6
IDIwMjQwNTI0MDMxNDM5LjEwNjMzMi0xLWFzaHV0b3NoLmRpeGl0QGludGVsLmNvbQ0KPiA+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gQXMgZmlyc3Qgcm91bmQgdGhpcyB1
QVBJIGxvb2tzIGdvb2QgZm9yIE1lc2EgdXNhZ2UsIHNlY29uZCByb3VuZCBhZnRlcg0KPiA+ID4g
PiA+ID4gdGhpcyBvbmVzIGlzIG1lcmdlZCB3aWxsIGFkZCBhZGRpdGlvbmFsIGZlYXR1cmVzIGFu
ZCB1QVBJcyBuZWVkIHRvDQo+ID4gPiA+ID4gPiBzdXBwb3J0IGFsbCBNZXNhIG5lZWRzLg0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IENvcnJlY3QuIENvcHkvcGFzdGUgZnJvbSBhbm90aGVyIGVtYWls
IGluIHRoaXMgdGhyZWFkLCB0aGlzIGlzIHdoYXQgd2UgYXJlDQo+ID4gPiA+ID4gbG9va2luZyBh
dCBmb3IgdGhlIHNlY29uZCByb3VuZDoNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAqIGhvbGQgcHJl
ZW1wdGlvbiAobmVlZHMgc29tZSBpbnZlc3RpZ2F0aW9uIGFzIHRvIGZlYXNpYmlsaXR5KQ0KPiA+
ID4gPiA+ICogeGVfc3luYyBmb3IgT0Egc3RyZWFtIGNvbmZpZ3VyYXRpb24gYW5kIHJlY29uZmln
dXJhdGlvbg0KPiA+ID4gPiA+ICogRXF1aXZhbGVudCBvZiBEUk1fSTkxNV9RVUVSWV9QRVJGX0NP
TkZJR19EQVRBX0ZPUl9VVUlELiBJIGFtIHN0aWxsIHRyeWluZw0KPiA+ID4gPiA+ICAgdG8gZmln
dXJlIG91dCBpZiB0aGlzIGlzIHJlYWxseSBuZWVkZWQuIFNlZSBoZXJlOg0KPiA+ID4gPiA+ICAg
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3Rz
LzI5MzEyI25vdGVfMjQyOTY1MA0KPiA+ID4gPiA+ICAgU2luY2UgdGhpcyBzZWVtcyB0byBiZSB1
c2luZyBzb21lIE1EQVBJIG1ldHJpY3MgaW4gTWVzYSwgSSB0aGluayBpdA0KPiA+ID4gPiA+ICAg
c2hvdWxkIGJlIG9rIHRvIGRvIHRoaXMgaW4gdGhlIHNlY29uZCByb3VuZCB0b28uDQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiBBY2tlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5z
b3V6YUBpbnRlbC5jb20+DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhhbmtzIHZlcnkgbXVjaCBm
b3IgdGhlIE1lc2EgYWNrLiBJIHdpbGwgc3RhcnQgYXNraW5nIHRoZSBYZSBtYWludGFpbmVycw0K
PiA+ID4gPiA+IGlmIHRoaXMgKGFuZCBncHV2aXMgUFIgd2hpY2ggaXMgYWxzbyBtZXJnZWQpIGlz
IHN1ZmZpY2llbnQgdG8gbWVyZ2UgdGhpcw0KPiA+ID4gPiA+IHNlcmllcyBub3cuDQo+ID4gPiA+
IA0KPiA+ID4gPiBNZXNhIGhhcyBub3cgcHJvdmlkZWQgdGhlaXIgYWNrIGZvciB0aGUgWGUgT0Eg
dWFwaS4gQWxzbyBhbGwgTWVzYSBYZSBPQQ0KPiA+ID4gPiBwYXRjaGVzIG5vdyBoYXZlIFItYi4g
VGhlIGdwdXZpcyBQUiBtZW50aW9uZWQgYWJvdmUgaXMgYWxzbyBtZXJnZWQuIFRoZSBYZQ0KPiA+
ID4gPiBPQSBJR1Qgc2VyaWVzIGlzIGFsc28gbWVudGlvbmVkIGFib3ZlLg0KPiA+ID4gPiANCj4g
PiA+ID4gU28gYXQgdGhpcyBwb2ludCBJIHdhbnQgdG8gY2hlY2sgd2l0aCB5b3UgaWYgdGhlc2Ug
dGhpbmdzIGFyZSBzdWZmaWNpZW50IHRvDQo+ID4gPiA+IG1lcmdlIHRoZXNlIFhlIE9BIHBhdGNo
ZXM/DQo+ID4gPiANCj4gPiA+IEdlbnRsZSBwaW5nIGFib3V0IHRoaXMgOikgQ2FuIHdlIHRyeSB0
byBnZXQgdGhpcyBpbnRvIDYuMTE/DQo+ID4gDQo+ID4gU29ycnkgZm9yIHRha2luZyBzbyBsb25n
IHRvIGdldCB0byB0aGlzIG9uZSBoZXJlLg0KPiA+IA0KPiA+IElzIHRoZSBNZXNhIE1SIHJlYWxs
eSByZWFkeSB0byBnZXQgbWVyZ2VkIHJpZ2h0IGFmdGVyIHdlIG1lcmdlIHRoaXMga2VybmVsIHNl
cmllcz8NCj4gPiBBcmUgYWxsIG9mIHRoZSBwYXRjaGVzIHRoZXJlIHJlYWxseSByZXZpZXdlZD8g
SSBjb3VsZG4ndCBtYWtlIGEgc2Vuc2Ugb2YgdGhlIG9wZW4NCj4gPiBNUiBkaXNjdXNzaW9ucyBh
bmQgSSBub3RpY2VkIHRoZSBNUiBpcyBzdGlsbCBtYXJrZWQgYXMgJ0RyYWZ0OicuDQo+IA0KPiAr
Sm9zZTogSGkgSm9zZSBjb3VsZCB5b3UgcGxlYXNlIGFuc3dlciBSb2RyaWdvJ3MgcXVlc3Rpb25z
IGFib3ZlLg0KDQpBY2NvcmRpbmcgdG8gSm9yZGFuLCBub3cgdGhhdCBYZSBLTUQgaXMgcGFydCBv
ZiBMaW51eCBzdGFibGUgd2UgbmVlZCB0byBmb2xsb3cgdGhlIHNhbWUgcHJvY2VzcyBhcyBpOTE1
IGZvciB1QVBJIGFkZGl0aW9ucy4NClNvIHdlIG5lZWQgdG8gd2FpdCBmb3IgdUFQSSBjaGFuZ2Vz
IHRvIGxhbmQgdG8gZHJtLW5leHQgdG8gdGhlbiBiZSBhYmxlIHRvIG1lcmdlIG9uIE1lc2EuDQpB
ZnRlciB0aGF0IGhhcHBlbnMgSSB3aWxsIHJlbW92ZSB0aGUgJ2RyYWZ0IG1vZGUnIGFuZCBhc3Np
Z24gdG8gTWVzYSBib3QgdG8gbWVyZ2UgaXQuDQoNCkJ1dCBhbGwgcGF0Y2hlcyBhcmUgcmV2aWV3
ZWQuDQoNCj4gDQo+ID4gDQo+ID4gQnV0IG9uY2Ugd2UgYXJlIHN1cmUgdGhhdCBNZXNhIGlzIHJl
YWR5IGFuZCBhbGwgTWljaGFsJ3MgY29uY2VybnMgb24gdGhlIGxhdGVzdA0KPiA+IHZlcnNpb24g
b2YgdGhlIGtlcm5lbCBzZXJpZXMgYXJlIHNvbHZlZCwgdGhlbiB3ZSBjYW4gZGVmaW5pdGVseSBt
ZXJnZS4NCj4gDQo+IEkgYWRkcmVzc2VkIE1pY2hhbCdzIGNvbmNlcm5zIGluIHYxNy4gRXhjZXB0
IG9uZSwgd2hpY2ggeW91IHJlc3BvbmRlZCB0bw0KPiByaWdodCBub3cgYW5kIHdoaWNoIHdlIGFy
ZSBub3QgY29uc2lkZXJpbmcgYSBibG9ja2VyIGZvciBtZXJnaW5nIHRoZQ0KPiBzZXJpZXMuDQo+
IA0KPiA+IA0KPiA+IERlYWRsaW5lIGZvciA2LjExIGlzIFdlZG5lc2RheSBuZXh0IHdlZWsoSnVu
LzI2KS4NCj4gPiANCj4gPiBUaGFua3MsDQo+ID4gUm9kcmlnby4NCj4gDQo+IExldCdzIHdhaXQg
dG8gaGVhciBmcm9tIEpvc2UgYW5kIHRoZW4gZ28gZnJvbSB0aGVyZS4NCj4gDQo+IFRoYW5rcy4N
Cj4gLS0NCj4gQXNodXRvc2gNCj4gDQo+IA0KPiA+ID4gPiA+ID4gdGhhbmsgeW91DQo+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gdjI6IEZpeCBidWlsZA0KPiA+ID4gPiA+ID4gPiB2MzogUmVi
YXNlLCBkdWUgdG8gcy94ZV9lbmdpbmUveGVfZXhlY19xdWV1ZS8NCj4gPiA+ID4gPiA+ID4gdjQ6
IFJlLXJ1biBmb3IgdGVzdGluZw0KPiA+ID4gPiA+ID4gPiB2NTogQWRkcmVzcyByZXZpZXcgY29t
bWVudHMsIG5ldyBwYXRjaGVzIDExIHRocm91Z2ggMTcNCj4gPiA+ID4gPiA+ID4gdjY6IE5ldyBw
YXRjaGVzIDE4IHRocm91Z2ggMjENCj4gPiA+ID4gPiA+ID4gdjc6IFBhdGNoZXMgYXJlIGNvbXBs
ZXRlbHkgcmVkb25lIGFuZCBkb24ndCBzdGFydCB3aXRoIGk5MTUgdmVyc2lvbiBvZiB0aGUgdWFw
aQ0KPiA+ID4gPiA+ID4gPiB2ODogU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC81NzUyMTQvP3Nlcmllcz0xMjg5OTMmcmV2PTENCj4gPiA+ID4gPiA+ID4gdjk6IFNl
ZSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTc3NDQxLz9zZXJpZXM9
MTI4OTkzJnJldj0yDQo+ID4gPiA+ID4gPiA+IHYxMDogU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9wYXRjaC81Nzc5NDMvP3Nlcmllcz0xMjg5OTMmcmV2PTMNCj4gPiA+ID4g
PiA+ID4gdjExOiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzU4
MTIzOS8/c2VyaWVzPTEzMDcwNSZyZXY9MQ0KPiA+ID4gPiA+ID4gPiB2MTI6IEFkZCBsYXN0IHR3
byBuZXcgcGF0Y2hlcyB0byBlbmFibGUgWGUyKyBvdmVycnVuIG1vZGUNCj4gPiA+ID4gPiA+ID4g
djEzOiBVcGRhdGUgbGFzdCB0d28gcGF0Y2hlcyBhZnRlciBjb2RlIHJldmlldyBjb21wbGV0aW9u
DQo+ID4gPiA+ID4gPiA+IHYxNDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoLzU5NTQ0Ny8/c2VyaWVzPTEzNDAyOCZyZXY9MQ0KPiA+ID4gPiA+ID4gPiB2MTU6IGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81OTU1NDkvP3Nlcmllcz0xMzQwNTYm
cmV2PTENCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IEFzaHV0b3NoIERpeGl0ICgxNyk6
DQo+ID4gPiA+ID4gPiA+ICAgZHJtL3hlL3BlcmYvdWFwaTogIlBlcmYiIGxheWVyIHRvIHN1cHBv
cnQgbXVsdGlwbGUgcGVyZiBjb3VudGVyIHN0cmVhbQ0KPiA+ID4gPiA+ID4gPiAgICAgdHlwZXMN
Cj4gPiA+ID4gPiA+ID4gICBkcm0veGUvcGVyZi91YXBpOiBBZGQgcGVyZl9zdHJlYW1fcGFyYW5v
aWQgc3lzY3RsDQo+ID4gPiA+ID4gPiA+ICAgZHJtL3hlL29hL3VhcGk6IEFkZCBPQSBkYXRhIGZv
cm1hdHMNCj4gPiA+ID4gPiA+ID4gICBkcm0veGUvb2EvdWFwaTogSW5pdGlhbGl6ZSBPQSB1bml0
cw0KPiA+ID4gPiA+ID4gPiAgIGRybS94ZS9vYS91YXBpOiBBZGQvcmVtb3ZlIE9BIGNvbmZpZyBw
ZXJmIG9wcw0KPiA+ID4gPiA+ID4gPiAgIGRybS94ZS9vYS91YXBpOiBEZWZpbmUgYW5kIHBhcnNl
IE9BIHN0cmVhbSBwcm9wZXJ0aWVzDQo+ID4gPiA+ID4gPiA+ICAgZHJtL3hlL29hOiBPQSBzdHJl
YW0gaW5pdGlhbGl6YXRpb24gKE9BRykNCj4gPiA+ID4gPiA+ID4gICBkcm0veGUvb2EvdWFwaTog
RXhwb3NlIE9BIHN0cmVhbSBmZA0KPiA+ID4gPiA+ID4gPiAgIGRybS94ZS9vYS91YXBpOiBSZWFk
IGZpbGVfb3BlcmF0aW9uDQo+ID4gPiA+ID4gPiA+ICAgZHJtL3hlL29hOiBBZGQgT0FSIHN1cHBv
cnQNCj4gPiA+ID4gPiA+ID4gICBkcm0veGUvb2E6IEFkZCBPQUMgc3VwcG9ydA0KPiA+ID4gPiA+
ID4gPiAgIGRybS94ZS9vYS91YXBpOiBRdWVyeSBPQSB1bml0IHByb3BlcnRpZXMNCj4gPiA+ID4g
PiA+ID4gICBkcm0veGUvb2EvdWFwaTogT0EgYnVmZmVyIG1tYXANCj4gPiA+ID4gPiA+ID4gICBk
cm0veGUvb2E6IEFkZCBNTUlPIHRyaWdnZXIgc3VwcG9ydA0KPiA+ID4gPiA+ID4gPiAgIGRybS94
ZS9vYTogT3ZlcnJpZGUgR3VDIFJDIHdpdGggT0Egb24gUFZDDQo+ID4gPiA+ID4gPiA+ICAgZHJt
L3hlL29hOiBDaGFuZ2VzIHRvIE9BX1RBS0VODQo+ID4gPiA+ID4gPiA+ICAgZHJtL3hlL29hOiBF
bmFibGUgWGUyKyBvdmVycnVuIG1vZGUNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgICAyICsNCj4g
PiA+ID4gPiA+ID4gIC4uLi9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5o
ICB8ICAgIDMgKw0KPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5n
aW5lX3JlZ3MuaCAgICAgIHwgICAgMiArDQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUvcmVncy94ZV9ndF9yZWdzLmggICAgICAgICAgfCAgICAzICsNCj4gPiA+ID4gPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX29hX3JlZ3MuaCAgICAgICAgICB8ICAxMDMgKw0KPiA+
ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jICAgICAgICAgICAgICAg
IHwgICAxOSArLQ0KPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90
eXBlcy5oICAgICAgICAgIHwgICAgNCArDQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfdHlwZXMuaCAgICAgICAgICAgICAgfCAgICA0ICsNCj4gPiA+ID4gPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYyAgICAgICAgICAgICAgICB8ICAgNTcgKw0KPiA+
ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5oICAgICAgICAgICAgICAg
IHwgICAgMyArDQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5l
X3R5cGVzLmggICAgICAgfCAgICAyICsNCj4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9scmMuYyAgICAgICAgICAgICAgICAgICB8ICAgMTEgKy0NCj4gPiA+ID4gPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaCAgICAgICAgICAgICAgICAgICB8ICAgIDEgKw0KPiA+
ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21vZHVsZS5jICAgICAgICAgICAgICAg
IHwgICAgNiArDQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYyAgICAg
ICAgICAgICAgICAgICAgfCAyMzcwICsrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfb2EuaCAgICAgICAgICAgICAgICAgICAgfCAgIDI3ICsNCj4g
PiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYV90eXBlcy5oICAgICAgICAgICAg
ICB8ICAyMzIgKysNCj4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wZXJmLmMg
ICAgICAgICAgICAgICAgICB8ICAgNjcgKw0KPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BlcmYuaCAgICAgICAgICAgICAgICAgIHwgICAyMCArDQo+ID4gPiA+ID4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyAgICAgICAgICAgICAgICAgfCAgIDc3ICsNCj4g
PiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9yZWdfd2hpdGVsaXN0LmMgICAgICAg
ICB8ICAgMjQgKy0NCj4gPiA+ID4gPiA+ID4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAg
ICAgICAgICAgICAgICAgICB8ICAyOTEgKysNCj4gPiA+ID4gPiA+ID4gIDIyIGZpbGVzIGNoYW5n
ZWQsIDMzMjEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPiA+ID4gPiA+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9vYV9yZWdzLmgNCj4g
PiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2Eu
Yw0KPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9vYS5oDQo+ID4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX29hX3R5cGVzLmgNCj4gPiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcGVyZi5jDQo+ID4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BlcmYuaA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+IA0KDQo=

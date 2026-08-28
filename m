Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0356C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 04:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E30C10E45F;
	Fri, 28 Aug 2026 04:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxZcDwoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BF310E45F
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 04:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787893099; x=1819429099;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7VgpI1+Ub050eJKlOokwuS5322TYmPt3vCsotowaE98=;
 b=IxZcDwoTrbnlPd2VbNYqpZcAxMN7e4Ckud3IAPMjn9j0dSk0XZ+OKbQd
 j6Qur4PgpGBjLRMJmpcmIH4OWwpW+/7dNr+YTIWR7rNyY5vKbc+tcZCkC
 1xWplq7L5Wej9Q+9ILaSujPVYdvb/O7402Jv0/1LeJeoeGvoErI1JWam3
 wpMAAj7YClgoQTLWuboR2c+iHdBN0Cht5IMzwCSFV7KtmvhKT93JU76WS
 YMWWQplLm6gyN7Tl2OR4r6UOmk4w+OdODJJSaRnhONklJot5S+3LJ9faH
 ar3MvgU2LfWB46+JYdifEiAEb8Ip2napBzNcmBZFfhlVN49dMidM/VFlP g==;
X-CSE-ConnectionGUID: TRfg3u7bSPCHq2acx1/CYQ==
X-CSE-MsgGUID: BTG8C+NWQse1vQNBkhKnFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88274692"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="88274692"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 21:58:19 -0700
X-CSE-ConnectionGUID: Ov+uV/eUSba1SBUJ2hCFhg==
X-CSE-MsgGUID: TkNlFiA0QjiRqHxGNWhiZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="264294131"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 21:58:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 21:58:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 21:58:18 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 21:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCvwuEFBmS/UfCKHGauaF2U4P8DZCmsRNXIwsN38d6eiJz4F7/PZJBUDkWBvufKGJhQZWNvg9bii5RzmrPmfumvEJ2jBb55zeonkD/H9xMjU5Ypv596LKK8v7kuEQxvoEm0TNL1x3rKqNou9Yy2v72jJs9yB0khaHY47ebURT7ls2dEHS2ZlOcJMth+XN84RV1k3awDjG8Nj5Rqiys8Am25cT9oGN9lW6HwXobO1avo2hP31j9y8HV7w4J4ux/kmShHmZwF7AXt/2evaZn/ATUXNFtOgFXyEGNtlodGv5poIB+hXf2C0lRindS3mjGIm8SPm0dVpLXmoUdZmmc/QjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VgpI1+Ub050eJKlOokwuS5322TYmPt3vCsotowaE98=;
 b=Kk6154jzVLbwlMnOkdkiVBhv9QWno1ewolfHKmal5dhO35mA8MS+ifsZStRIc6pRqfHCU1xCKjvhTVO0vTtnUOCU3yC51gwzy7rdIzdC/Lz0/mlHl+nb3mAEYgLj4wentCBV7XCDNY2CnuKxdbd/fPVSPaH3ja3blN9duOMbAlurT5bUfv+Ziuzu8uyk7AziNRx6bSCXwXMMD46VC/G88CiO6+4f/z+aG7HCHHWlHjCYrnE+ZU9+Xfp/CFmPXxZVDAOxSBDyo+jF+ZmfIiyoEpOSfGw8aU+WoHklTUtboOHkF+SGvEKHwr6Y1OtNl9tdp6/+bAbUGQzLLitOQoeQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 04:58:16 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 04:58:16 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH v2 4/6] drm/xe/uc: Support fetching different FW files
 per-subplatform
Thread-Topic: [PATCH v2 4/6] drm/xe/uc: Support fetching different FW files
 per-subplatform
Thread-Index: AQHdNX4NWrE+t34WDUuaqxy08+5Zv7ay6KqA
Date: Fri, 28 Aug 2026 04:58:16 +0000
Message-ID: <25c92b16536294f2adaae22c539c066778a6bedd.camel@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
 <20260826171149.708378-5-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260826171149.708378-5-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|IA1PR11MB7271:EE_
x-ms-office365-filtering-correlation-id: 36ce0797-f419-4764-e36d-08df04c0f89d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: L1eb79dDhMCh2EFcOCyDf6tHu8Q5KPIyhBpIChbCx+Aw82lSKIuLFQ63MAJi2f97l8BIYePJJnpkxew+YOpsED/Ffz/cqMjqLbIVWdJrQgDcwlW+m/swqXALhrtN7F1N6NpT/ss1+x9c2j3U9w1kjHKkbs1MzGAsC93zgxh02PcCAwsNSMEocW8G1q3pCumUpx587prlKPVfAFTsdXnCOhcFE5/MjomgnHSSv98JJ7ZDDhczcQbPk+Pkw+ya3SEJ8zNGA0VBvWRVU/ivUvYGjkIXTycI81jNVBW3RAf0CpTMWhSvDCAPlBR6vJM5I8R+qpAOuWe0D1WR7SK9xUKi+q0yZigmlSp4RbR1ALCOpEnkNt/O2bAvZRQd29TAfbkOWHSUJH9EeHUNa3NpSAe6PxCrhNpfF0mhdZdTdVClaWtg4qBz91Isn2ssQ4IwwqcKL0kXVP20PbP2VOqpA/UQ/rUF8AjsNFL7AZZwbJ/Ulojfeh6anDslho9dgoUNOeQB+RBxT0Bgiw8aBIDhDM8FbRjNQtP0qdBPMKTj+GIMpn0NlQjqCD4ppIrXdqiwwmICwNlh+KWG//xZfXxUNBuy2rSZhOchb9XvA5TI7XF5XwQlXx6QJwdjvdhnmJxnAWcyZ7Seb7FEnBvOM/gCHaFPhPD1Z9mbtmPBx3ki1Pi3I2zfXoqLLWrz3mhgzJlv4KfCzuEanv4XoYYFE3bfibrz4FUzjdBjlCAynCk8itL8q6k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXliU1dpOFZFVERtbnRrRjlDME84ZkFxbHYvSVVISWFib3FwUHlEclV6S0t5?=
 =?utf-8?B?VE1XN2JPekk5NjlVbEh1OFYzRlhjZFNzVExRVHlxckUzemY1VDZNak5UUFQz?=
 =?utf-8?B?RXBDNFNsUitvaWlVaWFzQWc4dDhMOVdqZWJGYnZUaFJma0dVL2oyR3NEZ0VV?=
 =?utf-8?B?Z1ZDUER5Tm5pKzM5Q21NWVl4V3JDQmtIdUt4UmI5dENINkM2SklIUWY0Ui9h?=
 =?utf-8?B?Q1ZLVXpRWFBsZE50QjdSM2ZOdkllSFBMWVIyVXJvZU9VN0VIZm9uL2dBb1E1?=
 =?utf-8?B?bnlxU0dBWEQ0bGd2Rmc2c0g1aTQ4YVY0UDExOXlSSVgyLzZnTVdJM3FWQXV3?=
 =?utf-8?B?MHEwZE5Uczk3WXArc1U4OWM4NEdkWVdJUWRDcXgxSjBVdlhjVXI0dW8wSmY5?=
 =?utf-8?B?R21mS09JR0xpdUY3MzVEd2NKSzVydmNCNGtMUkJsQU1QbklzWERRQ01vQUN3?=
 =?utf-8?B?RjM2QnNsbTB4M0JDbitVWko3eVk2U3BFb1UycVJBSkd2eWNMNjVxQk9OcUQv?=
 =?utf-8?B?K2tHdnNFQmlJOUltaUROaTUyM2FaWVBDYjlGaEVQQzJCdXVCaVo4b05vUm1Y?=
 =?utf-8?B?QU5JSGcwZUk5SUYzWEtzb2RzSTI4VDNBZUNvVVduWVBSdFJmNTZmNlQwZ0p4?=
 =?utf-8?B?NCtVc1AycTVKUDVrRVBzalFwaHc0TnBxUEZwb1N1L25HSU1WTEpjRlFiQWZm?=
 =?utf-8?B?VHA1aDR5Z2NRZTBQbEVkK2NoY3huYVF4SnVCWFRsYUNZK1RXeFFScThCQ2tQ?=
 =?utf-8?B?KzRadkxWK29KUHRDZktyQk1kaVdlRXM5cUdRMHV6ZlZKNXhHaWFhYUdMVnFp?=
 =?utf-8?B?dXdObDB5d3Z6Tkdjcjh2OEtMa3pkNXd6a2F4ZWpXTnVHQzhWcUNGQWkwakJr?=
 =?utf-8?B?U3R2MGNkMlhIaE40bWs2TVJtQzk1WlVqSU9BNDBlNXdSUjh0dzBLUGVib2V4?=
 =?utf-8?B?ZGpUMXBOOU1wZXk2OTljaStrWE05VG5ZQUNDVk1tdHM2SkVLUmI5ME41UVdm?=
 =?utf-8?B?Nnhpc0hSQm1MLzdFdDJIMzF0enYyZU0vbGIvOEFkQUNTS3NsaGdKYlE0U3ND?=
 =?utf-8?B?cDVpNnQ0VmdPdncwSm5RUUhxZ084SGRlc2RkUW9LVDlkQm1aTEtYSTRXaWI3?=
 =?utf-8?B?NUlnSDJFWi96cmJhQkUvaVBOYWtlSFVQVC81UWV5R29KV0FvYkd3OUNyLzRT?=
 =?utf-8?B?aDdlNDFkYWdPZmk5NjFKaTRrcmNXM1JOUFV6SkxVUDZESTJZUmZlV09RY3Qz?=
 =?utf-8?B?L28xRXFIYWY0am1CWFlBSWJBZE5QdVFaSDZ2UERmOG1sM3paUHhBYnozNWxU?=
 =?utf-8?B?SzBtNE9mUVE5KzRwU0hNNDl1ZWV3SFlGZXhzYjZmZUl1M0hwdUNEcHRyWElu?=
 =?utf-8?B?aGRxektBL3ZuWks4VXQrQnBueTRMUld5ck9UZldGTlo1cFVnK1lRVlNLRDVk?=
 =?utf-8?B?c3UyWmFBSGpOQmxvK0lIcmhwOStldDlKeUUvWURnU3B2QWlYbW1PQXRWZE84?=
 =?utf-8?B?MThjcytqWm0rOGFja1VnMm5pSjE2eTNQaDJZT1VwNVk1ZUJyM0Nlb2phNDIw?=
 =?utf-8?B?UXpwMDZJbjR2WXR2eDYxRHgySFpDb0tZYXFMd3BzWmdoK0V6MzdqV1VCTUlu?=
 =?utf-8?B?WGlrV3NuTmdrblorM0pZN1hlamJWYTVHVnRXSWFOUHMwMlFYVy9rbEI0QzMv?=
 =?utf-8?B?dEtxczZVWEJpSmhYQUt2MkNQR25GV1QyVE1RUDVjV3VieUUxSkpKQ3R5ZGZL?=
 =?utf-8?B?TWFLcVFFWFZUT1JhZW4vd2tIQlpwbVBaMStHRUFaLy9ydjdodVNSUzZVN2o3?=
 =?utf-8?B?Uzl2WEE3KzJheFpJbU52SnV3Q0pVNkdodkZsMmJKU0ZkajBtMW9SWjRYR0o2?=
 =?utf-8?B?LzBoTmlqK1BxQlY2YnZuV2V3NDZhcDROU0FIODZqa1RiN3hzajFra1BRUU5p?=
 =?utf-8?B?c2FMYXNFVkxWRkVVS09qc09sZnpoTWV1RG5UTlJPS1R1aTZlZllScTlXYkF3?=
 =?utf-8?B?Mm81VXhMOHhpL3c1V1V5cmRSRnJ1SXo0VHpoSUVUM1NLakFJUm5QajJiUk03?=
 =?utf-8?B?bVZLbk8ySmtWYWtvNUpxdmlEcExuVTgwdE9uRytsOWY3NDRxQkxBZDJkYk1j?=
 =?utf-8?B?OGZtTkFMZEJLMmRZZmxNLzdRYXV6RWREWUhiaHpSTys1cytlZ1NlZXRVYXJL?=
 =?utf-8?B?VC9wS2ZKRmRqQVU3ZUkwK1U4TUc1Tkl1WFZhWUVORWI2ZzFQdnJYcWVNOHVt?=
 =?utf-8?B?ZHB0blMwRWVSWnpoS0FreEZ3Q0Z6S2tkZUNLdE54U3NQVXIwQVBtSGdod1Mz?=
 =?utf-8?B?NElTeWg2QU9OYVZGdFBTeS9LL0c0NkRxMXNMMFFqSkkzUGtuUjVJOW5HdEVu?=
 =?utf-8?Q?na6ev4RyqrM13S/TsFDbgYEtTmqhGdGxBMLfx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42A55C0AC07B7C479232DAB74B338E02@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: b4eQHzmSuZwfKJ2Rx5dtdlJFkudhyGSoGrPuJHGYJ4R8xHq5/8PMkc8A4Ogpo59hZvoW4yUNtDkzFc+TQrSJwaHvp3WXUWMyIXJEK0+3UCwGa5c24vk2382RV+7Wy79R4QCABk1xkuUUDIl1pwVwST07/9YT04RPj3GMI/DXLaJJMQcs0HekdizQOdu2gkUs+LL/yOi37lPo0a5v503wt/RxI2F9nDKaw6ydLhp+VSjmU0JqonKW0vRdX83yS5z3UfmjkFRly/v207rVK5j5nnTi9lCQBIsO7mBWXSHpR2gayJ9mkWYyc5X1VC/KrfbgBhDzUHwYi1jFCrZ/hNSXyA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ce0797-f419-4764-e36d-08df04c0f89d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 04:58:16.0751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPtdAc1jfC5NB45umk8aKeK4SLYInciCO/0VFZ1M9dKJ0EfYHbFXO6wrp+WPfjneG1uorrlZMEzC/qYaXU8NOc/XRwdQAi0Cqza3xC0voZCN+SqFytSFvMT251LNhiyX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
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

T24gV2VkLCAyMDI2LTA4LTI2IGF0IDE3OjExICswMDAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiANCj4gDQphbGFuOltzbmlwXQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3VjX2Z3LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuYw0KPiBpbmRl
eCAzYTc0YWNmYWYyYzcuLjEyZmJjMjVkYzZiOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3VjX2Z3LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3LmMN
Cj4gDQphbGFuOltzbmlwXQ0KDQo+ICAvKiBmb3IgdGhlIEdTQyBGVyB3ZSBtYXRjaCB0aGUgY29t
cGF0aWJpbGl0eSB2ZXJzaW9uIGFuZCBub3QgdGhlIHJlbGVhc2Ugb25lICovDQo+ICAjZGVmaW5l
IFhFX0dTQ19GSVJNV0FSRV9ERUZTKGZ3X2RlZiwgbWFqb3JfdmVyKQkJXA0KPiAtCWZ3X2RlZihQ
QU5USEVSTEFLRSwJR1RfVFlQRV9NRURJQSwJbWFqb3JfdmVyKHhlLAlnc2MsCXB0bCwJMTA1LCAx
LCAwKSkJXA0KPiAtCWZ3X2RlZihMVU5BUkxBS0UsCUdUX1RZUEVfTUVESUEsCW1ham9yX3Zlcih4
ZSwJZ3NjLAlsbmwsCTEwNCwgMSwgMCkpCVwNCj4gLQlmd19kZWYoTUVURU9STEFLRSwJR1RfVFlQ
RV9NRURJQSwJbWFqb3JfdmVyKGk5MTUsCWdzYywJbXRsLAkxMDIsIDEsIDApKQ0KPiArCWZ3X2Rl
ZihQQU5USEVSTEFLRSwJU1VCUExBVEZPUk1fQU5ZLAltYWpvcl92ZXIoeGUsCWdzYywJcHRsLAkx
MDUsIDEsIDApKQlcDQo+ICsJZndfZGVmKExVTkFSTEFLRSwJU1VCUExBVEZPUk1fQU5ZLAltYWpv
cl92ZXIoeGUsCWdzYywJbG5sLAkxMDQsIDEsIDApKQlcDQo+ICsJZndfZGVmKE1FVEVPUkxBS0Us
CVNVQlBMQVRGT1JNX0FOWSwJbWFqb3JfdmVyKGk5MTUsCWdzYywJbXRsLAkxMDIsIDEsIDApKQ0K
PiAgDQo+ICAjZGVmaW5lIE1BS0VfRldfUEFUSChkaXJfXywgdWNfXywgc2hvcnRuYW1lX18sIHZl
cnNpb25fXykJCQlcDQo+ICAJX19zdHJpbmdpZnkoZGlyX18pICIvIiBfX3N0cmluZ2lmeShzaG9y
dG5hbWVfXykgIl8iIF9fc3RyaW5naWZ5KHVjX18pIHZlcnNpb25fXyAiLmJpbiINCj4gQEAgLTE4
MSwxMCArMTgzLDE5IEBAIHN0cnVjdCBmd19ibG9ic19ieV90eXBlIHsNCj4gICNkZWZpbmUgWEVf
VUNfRldfRU5UUlkocGxhdGZvcm1fXywgZ3RfdHlwZV9fLCBlbnRyeV9fKQkJCQlcDQo+ICAJewkJ
CQkJCQkJCVwNCj4gIAkJLnBsYXRmb3JtID0gWEVfICMjIHBsYXRmb3JtX18sCQkJCQlcDQo+ICsJ
CS5zdWJwbGF0Zm9ybSA9IFhFX1NVQlBMQVRGT1JNX0FOWSwJCQkJXA0KPiAgCQkuZ3RfdHlwZSA9
IFhFXyAjIyBndF90eXBlX18sCQkJCQlcDQo+ICAJCWVudHJ5X18sCQkJCQkJCVwNCj4gIAl9LA0K
PiAgDQo+ICsjZGVmaW5lIFhFX0dTQ19GV19FTlRSWShwbGF0Zm9ybV9fLCBzdWJwbGF0Zm9ybV9f
LCBlbnRyeV9fKQkJCVwNCj4gKwl7CQkJCQkJCQkJXA0KPiArCQkucGxhdGZvcm0gPSBYRV8gIyMg
cGxhdGZvcm1fXywJCQkJCVwNCj4gKwkJLnN1YnBsYXRmb3JtID0gWEVfICMjIHN1YnBsYXRmb3Jt
X18sCQkJCVwNCj4gKwkJLmd0X3R5cGUgPSBYRV9HVF9UWVBFX01FRElBLAkJCQkJXA0KPiArCQll
bnRyeV9fLAkJCQkJCQlcDQo+ICsJfSwNCj4gDQo+IA0KSSBjYW4gc2VlIHdlIGFyZSBiaWZ1cmNh
dGluZyB0aGUgbWFjcm9zIHRoYXQgZ2VuZXJhdGUgZndfZGVmIGFycmF5cw0KZm9yIEdTQyB2cyB0
aGUtcmVzdCB3aGVyZSBHU0MgaXMgYWx3YXlzIEdUX1RZUEVfTUVESUEgYW5kIGFsbG93cw0KZXhw
bGljaXQgc3ViLXBsYXRmb3JtIHdoaWxlIHRoZS1yZXN0IG5lZWRzIGV4cGxpY2l0IEdUX1RZUEUg
YnV0DQppcyBhbHdheXMgU1VCUExBVEZPUk1fQU5ZLg0KDQpJbiB0aGUgaW50ZXJlc3Qgb2YgbWlu
aW1hbCBjaGFuZ2VzIGFuZCBrZWVwaW5nIHRoZSBsYXlvdXQNCm9mIG91ciBhcnJheXMgY29uY2lz
ZSwgaSB0aGluayB0aGlzIGlzIGEgZ29vZCBhcHByb2FjaC4NCg0KUmV2aWV3ZWQtYnk6IEFsYW4g
UHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQphbGFuOltzbmlw
XQ0K

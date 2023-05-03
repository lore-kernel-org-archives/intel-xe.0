Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90693C77B78
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 20:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5068710E355;
	Wed,  3 May 2023 20:21:16 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A2610E355
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683145274; x=1714681274;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rR5vdpXGz+Xk3qf46xE5szTU+XpP1DgeEnX87jltXT0=;
 b=BzzSFPc1ogfkiW3ovCuTNNUm5r2sKjKTwcMfz5yQ/OyEOOwS9FUJ6UuD
 hQ1/TIWn9yAHFNDsnQGYyNdL06/7vQGM18M5ChFU45ArCLWzEw+F4NK4J
 Qab9MqskcbHLITR/5lETzjqbDF0UovZFEXHVzq5hkIm3qQDqaFQ0RSMdW
 bduQX8PMk4rfM1lqSadc+02u+Ga7jcLxULFlrGg505mykrVAiEnLXlPe7
 SoiF9WQHe2gbSsednmtqXajK+qL0F1zdcC5IT9SGaLHY+GVJzYsyW4uB2
 4T23V0Bo82cNlWTXQxCMoJAIaW3DV1WZLyfzWW1/AbbNkJITyakD/Paul g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376824641"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="376824641"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 13:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="820892874"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="820892874"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 03 May 2023 13:21:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 13:21:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 13:21:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 13:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWWZJMre5tgX1InVSpR4FW0drG04h6M1gqliTexZRyg8kiI3JErKCMrE5hKG1z1XW8+dS7CGk9392v84iYQMsrjLwW3Zq2Lm/rzCe0Yz3+yF7nDqE36gQMX3CFABJx6ddxVCRboSP7VJF3wq3gQdSTeq9YvF5Koxp9tYKatn3ZCXzDwF49Ee1Z/3HJHu2DHH0QA1giF8Qjmgr5TYIQ8UjMsaTmhiZIB3SE9tDFRWhise/3ky4V4T0/jd8G/Vkip4E/1O8ovCNjYiL6YigyC4bjsABx3bFX6opoHmIhTDM73Or9LUoJNwE+XcDCMwq8j4xkkrn6h7nNdpwtmv/+lzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR5vdpXGz+Xk3qf46xE5szTU+XpP1DgeEnX87jltXT0=;
 b=COfb4xEF57ddud6fKVc/4+PBjnP7nFi+567mlut5rti1EX4FLCBklk8UhAe/CCvBRrc9kAl7xSVlBwLSgk4tJ3r5H2X7QOymdqOowG5DnZN/QL0YCunsebseNusd1NyjQUbLJG7+MPVs+RaFCig9ryMZ6X9wfbDFla/RnBOKUBuQI9pOqZsuX3nnxK1sLS8ZWFfqPT5pqAf+UJIRRtPWioT7sjNmZoeMc3OnhSq9hljDpZ04erBQnAt28xBN6l2sOpLMGpG6Fg6woLDBjNj59TbRihUlWuUOlL+XoayBQxJ41YUiwXLi7x5i1yX8NUIF0ZrDHZVKndg3XRMYEhx7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 20:21:11 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::8f6:8ec:1c7d:f166]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::8f6:8ec:1c7d:f166%7]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 20:21:11 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 2/4] drm/xe: Simplify rebar sizing
Thread-Index: AQHZfCRJPDq1fnY7u0mWOiCY1KtGfK9IuZUAgABHfZA=
Date: Wed, 3 May 2023 20:21:10 +0000
Message-ID: <DM5PR11MB132481BF75D61CD924AA3032C16C9@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20230501115826.4191472-1-michael.j.ruhl@intel.com>
 <20230501115826.4191472-3-michael.j.ruhl@intel.com>
 <db6fa769-81de-d18b-7cc0-373ed33caf09@intel.com>
In-Reply-To: <db6fa769-81de-d18b-7cc0-373ed33caf09@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1324:EE_|IA0PR11MB7187:EE_
x-ms-office365-filtering-correlation-id: 7de61727-3a1a-4cd0-61de-08db4c13ef85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w3Am3i478OKIWG8uCvcfSMTe0Z80bhzcH5g2cno5qE4VJndaGdZyvckxHk5Ktm8/VNLrau9/ssdaiK8wJq84DFjVJIcO23sAGIsBRY5pqpdHeUHFpR3o8iyGkbz6wZBxZnroGggwcnoV+pRfLdd/z35o4aWMiCfgAC5Se2t3EkYiOPFE5VvRt87gc/dcHQKRBXuHllxkUlrytnpEsTl7ndbH+L7Dgucr6gZu2skeTrTVGB9duSWCHgNwhXc+oWUYGEB2Raw+03nnVN4CC+no3EilwPY5z3LGmMO9vUbIRDt4Ca4wPzbyPS6yV1jjJNd4ydoC7j5/Ear2cUDO6zhofTg8HfhwEhRXxdE2ICOPrJb7PWQogPV3dXEC4jtAjw+Jn1wh+ovZZKxmohHqKKknBikZmIRI621HdrwvslTlp8UKbzCR3h089amt2jXp7q+B6ty6+IljbHV4K/te8/xfLONw+NLB5dY3uVt3ezOrcAHjsokxNWyJy4toeAJTx1ed+3Zg7v91UcyeQHw6lsfzo/chsNipma7zJ+PIAKBphFeBAybIUfPgD9wTG658HQaYgut4xdAmqX53lPxG4Y5l0n/jhMafL9zoeMkFUP0CKBrrn3rYQhjAjQL0y+f1QOD5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(41300700001)(83380400001)(316002)(8936002)(8676002)(5660300002)(52536014)(4326008)(66946007)(76116006)(66446008)(66556008)(66476007)(64756008)(55016003)(38100700002)(186003)(9686003)(122000001)(26005)(6506007)(82960400001)(7696005)(107886003)(38070700005)(54906003)(478600001)(86362001)(2906002)(71200400001)(110136005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWtXTitXUHo2K1AwOWtjWkdQMThhdDNya0taek8rdTljTk9yU2trN2FVZXE3?=
 =?utf-8?B?RUVJZldtemM0M3l6Wm9LYzFDT3ZKOVFtNUQwdUtKZTk0RTVVTW5EeUtoZUwz?=
 =?utf-8?B?Qm9RZ2ZDQWttdmZVZnZWR0I0TThuSUIrYVVJdTk1ejBHMldJSGtUK291eldE?=
 =?utf-8?B?a3QwNVJUenBkQVIydnVERzJ6K0JpZHVCOVJpZ0I3VVp6cHlmUG5SUklKYWtV?=
 =?utf-8?B?d002RjRPT21Ia3NBSUEreXpUMGRRTkllcU8yR3h6YityaTl2dDNVeS9ja1JW?=
 =?utf-8?B?OFlndEdqenZldFVGZVJINDhlSjdlQ2IweVpGRVQ4NHZUdWErU2w0ODc2RG9M?=
 =?utf-8?B?MHc5M0grTVNMU3g1UEJBWjRFNS8yNkJ2SWN3WWN5dWt2NzBqRzRMVUxhMWdN?=
 =?utf-8?B?SDh6NFZsRE1VTm5BNERKMUtMamJvM09UV2R5R29CNDFLUU81T0pZZ3FjU1N2?=
 =?utf-8?B?VDBZNDkrcVhHNW9VYmJuZ20vTFZEQkpFOERJc3dXNG1KRmtlc01NbDRGYmh2?=
 =?utf-8?B?dkU1d25oWCszUTNrV3dic1Z5SHhoMDR4WVNxeGZGM3psSGlXKzFhZWgwNjhX?=
 =?utf-8?B?bGs5NHJmbWxYV3lFaVFEa1BMNmtKWWMzdUJKcGpIZVhiQmtSd2Z1bnY3Y1kz?=
 =?utf-8?B?MjBDc2dHczErb29sSVdGTTNuVTNrQURmRnI3WG0zWG43MUNQellBOEdWZFBu?=
 =?utf-8?B?Z1NTWXdSWnl6RnYvRzZ4dHZmMjNBUnBvemJya01xc1IwRlVzdTN1Qi94M1pj?=
 =?utf-8?B?bWRnUzJjNGN0dHNDODZmRjZIT3pyUU1mazIySGpzK0FGY2U2T2RMVENmU1N6?=
 =?utf-8?B?Q3FVUzVRejJFbHVXVDFkekF2N3pMaysyMm5vNW9ZUFljYzRiWnlycDErTGk0?=
 =?utf-8?B?MzVHd2UyLzZxYm4vc3htanZRTjZyQ2N1bFRLVXhBYkN6RkhkWXFSRkk1MzJC?=
 =?utf-8?B?UllJS0Q4UUFpaVpxNG9FWFJuOVBjZDU1Z1ZlckNRTmVNVm5mVW1xMGovcDEx?=
 =?utf-8?B?SFVOblNmaEdCMkVDNDVzcG9jTlJOSVgwaEFXSEw4ck1KNmRRZ0VJMTh5V2dk?=
 =?utf-8?B?TmwzWU1Mc3V6VnVVNDFmR0ExUGwrMzdicnd3SDBwNEVmS00yZTAxNlNISUhh?=
 =?utf-8?B?TDlTVFZ3YWRLbjZoNW14MGEwMXVmazlvclljTUxPTitlaTNHN0pycjMwcXVM?=
 =?utf-8?B?bXVWalJSYUYxeFpuODhPYUZYbnpSVVNsZWtDUzVtdW1BczJoK0NQczVzRjRY?=
 =?utf-8?B?VnN5NlorcXdSZ29JMDMyVGtWQUJvc1BzcG5GTFBmL21rZUUwNFRFb0gwa01H?=
 =?utf-8?B?cVZKY3ZtWFdkdldFRGs5YmRjd3pBQlF3SUJqME81aERRbFdGN0ZjNE4wZHNh?=
 =?utf-8?B?NzczN2hoNUR3emJJRVZ1cnJGbkhVOWtmdGF1YitUQnkrMTFjYldFYThlS2sv?=
 =?utf-8?B?aDFTTC9MVVBYQVk1ZlZwaFA2TEFjc3NUdUVMcTZsUC9PQ0tjUTJIaC9yaGpN?=
 =?utf-8?B?Vm9pM0h4bmpwUUtzWENOS3IrT2VqbDlOaFpkY3pvdW1DU2JZNm05YzAxN3Jj?=
 =?utf-8?B?WFVVK3creGNKckowei9GdnpyVlV5T0d3TituVTc0aXVQNUo5ZHlBNk9nVFBQ?=
 =?utf-8?B?NVBWYURvcE00TUR0Qy9VeDR1b25tVE1WZ3JDVytEWGdEMWJ3NkpQYlplcDcy?=
 =?utf-8?B?VFU0MlU2YzVmTnFRMzVBK0hXaTF6SlZMMEFTTitHQXFOTWpzRlN1bUNwR1VP?=
 =?utf-8?B?UzcyTjFUNC91TzNTNXcxZFdVbmZoNjdOaFJJdU54NTg5cVZIYWN0OENncWND?=
 =?utf-8?B?dHh4WFJRMi9OQ2ZSQUtlaFRKRnZ4OFlHd0cvRjU0WVZBMFIvYkw1MC8yd01i?=
 =?utf-8?B?SHhCSXA0OUx1bEFOVUxtSXhmckk2TnVWamNKWFpKcEpNU2dMbGhvV3RDN3lZ?=
 =?utf-8?B?cnFSeHFQMkd0bWtIYlVua3lHNUlKWENMNmZvVzM0K2lpbEpZWlVyUUw5V3Zz?=
 =?utf-8?B?OTBLbE0xSVp6MFNIS1JxbzlDYnRsR1o1cUx5bGhwTXBTMFdWdnJSN1pKZnZa?=
 =?utf-8?B?OFF3UUlmSlprQUppWEh3NS9xT2Nia2E2RzM3bDFhK2FwajMyWTBTTDhwckdl?=
 =?utf-8?Q?+xXOa+R/mBDRuAcvrop/8rFKV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de61727-3a1a-4cd0-61de-08db4c13ef85
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 20:21:10.9569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FaZTZtPmeAEnmHvfVmeYbLCk4kEf23aDaUvposdomcZvQEv8HJkQAK+CUI/YnIF6epupOyajQII/CWEQeS9yKctUroItDePF9EN4hOikUhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7187
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Simplify rebar sizing
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
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQXVsZCwgTWF0dGhldyA8bWF0dGhl
dy5hdWxkQGludGVsLmNvbT4NCj5TZW50OiBXZWRuZXNkYXksIE1heSAzLCAyMDIzIDEyOjA0IFBN
DQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPjsgaW50ZWwt
DQo+eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT47IEtlcnNobmVyLCBEYXZpZA0KPjxkYXZpZC5rZXJzaG5lckBpbnRl
bC5jb20+OyBHaGltaXJheSwgSGltYWwgUHJhc2FkDQo+PGhpbWFsLnByYXNhZC5naGltaXJheUBp
bnRlbC5jb20+OyBVcGFkaHlheSwgVGVqYXMNCj48dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0K
PlN1YmplY3Q6IFJlOiBbUEFUQ0ggMi80XSBkcm0veGU6IFNpbXBsaWZ5IHJlYmFyIHNpemluZw0K
Pg0KDQo8c25pcD4NCg0KPj4NCj4+IC0JeGVfcmVzaXplX3ZyYW1fYmFyKHhlLCB2cmFtX3NpemUp
Ow0KPj4gLQl4ZS0+bWVtLnZyYW0uaW9fc3RhcnQgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwN
Cj5HRU4xMl9MTUVNX0JBUik7DQo+PiAtCXhlLT5tZW0udnJhbS5pb19zaXplID0gbWluKHZyYW1f
c2l6ZSwNCj4+IC0JCQkJICAgcGNpX3Jlc291cmNlX2xlbihwZGV2LA0KPkdFTjEyX0xNRU1fQkFS
KSk7DQo+PiAtCXhlLT5tZW0udnJhbS5zaXplID0geGUtPm1lbS52cmFtLmlvX3NpemU7DQo+DQo+
SSB0aGluayB3ZSBzdGlsbCBuZWVkIHRvIGtlZXAgdGhlIGlvX3NpemUgYW5kIHZyYW0uc2l6ZSBj
bGFtcGluZyBpbiB0aGlzDQo+cGF0Y2guDQoNCk9rLCBJIHdpbGwgc2VlIHdoYXQgSSBjYW4gZG8u
DQoNCk0NCg0KPj4gLQ0KPj4gLQlpZiAoIXhlLT5tZW0udnJhbS5zaXplKQ0KPj4gLQkJcmV0dXJu
IC1FSU87DQo+PiAtDQo+PiAtCWlmICh2cmFtX3NpemUgPiB4ZS0+bWVtLnZyYW0uaW9fc2l6ZSkN
Cj4+IC0JCWRybV93YXJuKCZ4ZS0+ZHJtLCAiUmVzdHJpY3RpbmcgVlJBTSBzaXplIHRvIFBDSSBy
ZXNvdXJjZQ0KPnNpemUgKCVsbHVNaUItPiVsbHVNaUIpXG4iLA0KPj4gLQkJCSAodTY0KXZyYW1f
c2l6ZSA+PiAyMCwgKHU2NCl4ZS0+bWVtLnZyYW0uaW9fc2l6ZSA+Pg0KPjIwKTsNCj4+ICsJZXJy
ID0geGVfZGV0ZXJtaW5lX2xtZW1fYmFyX3NpemUoeGUpOw0KPj4gKwlpZiAoZXJyKQ0KPj4gKwkJ
cmV0dXJuIGVycjsNCj4+DQo+PiAtCXhlLT5tZW0udnJhbS5tYXBwaW5nID0gaW9yZW1hcF93Yyh4
ZS0+bWVtLnZyYW0uaW9fc3RhcnQsIHhlLQ0KPj5tZW0udnJhbS5pb19zaXplKTsNCj4+IC0JeGUt
Pm1lbS52cmFtLnNpemUgPSBtaW5fdCh1NjQsIHhlLT5tZW0udnJhbS5zaXplLCB2cmFtX3NpemUp
Ow0KPj4gKwkvKiBzbWFsbCBiYXIgaXNzdWVzIHdpbGwgb25seSBjb3ZlciBndDAgc2l6ZXMgKi8N
Cj4+ICsJaWYgKHhlLT5tZW0udnJhbS5pb19zaXplIDwgdnJhbV9zaXplKQ0KPj4gKwkJZHJtX3dh
cm4oJnhlLT5kcm0sICJSZXN0cmljdGluZyBWUkFNIHNpemUgdG8gUENJIHJlc291cmNlDQo+c2l6
ZSAoMHglbGx4LT4weCVsbHgpXG4iLA0KPj4gKwkJCSB2cmFtX3NpemUsICh1NjQpeGUtPm1lbS52
cmFtLmlvX3NpemUpOw0KPj4NCj4+IC0JZHJtX2luZm8oJnhlLT5kcm0sICJUT1RBTCBWUkFNOiAl
cGEsICVwYVxuIiwgJnhlLQ0KPj5tZW0udnJhbS5pb19zdGFydCwgJnhlLT5tZW0udnJhbS5zaXpl
KTsNCj4+ICsJZHJtX2luZm8oJnhlLT5kcm0sICJWSVNJQkxFIFZSQU06ICVwYSwgJXBhXG4iLCAm
eGUtDQo+Pm1lbS52cmFtLmlvX3N0YXJ0LA0KPj4gKwkJICZ4ZS0+bWVtLnZyYW0uaW9fc2l6ZSk7
DQo+Pg0KPj4gICAJLyogRklYTUU6IEFzc3VtaW5nIGVxdWFsbHkgcGFydGl0aW9uZWQgVlJBTSwg
aW5jb3JyZWN0ICovDQo+PiAgIAlpZiAoeGUtPmluZm8udGlsZV9jb3VudCA+IDEpIHsNCj4+IEBA
IC0yNjgsNyArMjg2LDcgQEAgaW50IHhlX21taW9fcHJvYmVfdnJhbShzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSkNCj4+DQo+PiAgIAkJWEVfQlVHX09OKCFhZGpfdGlsZV9jb3VudCk7DQo+Pg0KPj4gLQkJ
c2l6ZSA9IHhlLT5tZW0udnJhbS5zaXplIC8gYWRqX3RpbGVfY291bnQ7DQo+PiArCQlzaXplID0g
eGUtPm1lbS52cmFtLmlvX3NpemUgLyBhZGpfdGlsZV9jb3VudDsNCj4+ICAgCQlpb19zdGFydCA9
IHhlLT5tZW0udnJhbS5pb19zdGFydDsNCj4+ICAgCQlpb19zaXplID0geGUtPm1lbS52cmFtLmlv
X3NpemU7DQo+Pg0KPj4gQEAgLTMwMSw3ICszMTksNyBAQCBpbnQgeGVfbW1pb19wcm9iZV92cmFt
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPj4gICAJCQkJICZndC0+bWVtLnZyYW0uc2l6ZSk7DQo+
PiAgIAkJfQ0KPj4gICAJfSBlbHNlIHsNCj4+IC0JCWd0LT5tZW0udnJhbS5zaXplID0geGUtPm1l
bS52cmFtLnNpemU7DQo+PiArCQlndC0+bWVtLnZyYW0uc2l6ZSA9IHhlLT5tZW0udnJhbS5pb19z
aXplOw0KPj4gICAJCWd0LT5tZW0udnJhbS5pb19zdGFydCA9IHhlLT5tZW0udnJhbS5pb19zdGFy
dDsNCj4+ICAgCQlndC0+bWVtLnZyYW0uaW9fc2l6ZSA9IHhlLT5tZW0udnJhbS5pb19zaXplOw0K
Pj4gICAJCWd0LT5tZW0udnJhbS5tYXBwaW5nID0geGUtPm1lbS52cmFtLm1hcHBpbmc7DQo=

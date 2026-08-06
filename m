Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E83EC56205
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 19:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019D310E37D;
	Thu,  6 Aug 2026 19:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZWiLTsN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DB210E37D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 19:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786043094; x=1817579094;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+Pd+6W3zKgxwIuQcdhQQk8zk7iSOP5dyZ7lQiTuFxns=;
 b=NZWiLTsNTT5QmzyxPUTOCvV/o2Qg40St1w0svSnBRd3JvZNDwBNTT97g
 84+dqXbzhr7Qf9nxoTbRaEIMTmgtydollo/aE1C5WO4BdVyIFGOvv5aMK
 8duQaS5Gs++Fr3IsdDbhBsaEYDRNV1UFdgYAR6GAXYmXv7n8O1WqAG2Qk
 Q3To5kUR4QD7nsMaXFsvJulysbHv5d1iqVJLmduLrFgL8FCVe/j9xy1XO
 4C3ENYR1ZP9NdGbgYLjrwoTPJTngeEjNNtbNiU1l10n3Mf9MVbJn2h0JX
 BT5OhXeFMxpSj4dGB4DtrgLKmbEwsXZ8PajR7dB0wUYkdTmg7J7dBnNhG Q==;
X-CSE-ConnectionGUID: SS6ddKy1RVa6zc/SFOItSA==
X-CSE-MsgGUID: RF3Vz2IHT+m5Lxmd1W5oiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86678433"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86678433"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:04:33 -0700
X-CSE-ConnectionGUID: 68ADkcXNQ0S/mbET02ZdOQ==
X-CSE-MsgGUID: QuJcOInKRiKE5L73CbwZ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="262255584"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:04:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:04:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 12:04:32 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:04:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3ViJ+xFc0sylc2qzAbGL/WfnCJ9NF3VhJkmyExkZDUKac+AJ6gZ1pxsznYB3efmahkFuaRoZNzEW7vVGZkTW+NKpuJKiozPRFj43S6hbuGkJtHW1P15CSgH/G+6EAIY18bsu5ufAOM0ibWJP3Eapb8X5OAyFBSV2lgB5bg9SieI/pqYwLNaqRhvN8aOsj6sLtAuparKNIkTxd74PWiDtj5L9DwXUk4f4+ZiLOCo2TGawm12o/d/ZFHH8o7yh+zm08MpZm4dmIq+t0I9UeGsyl+cddsNh1Jje3lXQeqhqL0IPsVaOGAwlFEzSXrU1RkbCxnlzSjgJ8jq2k0SbH6J8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Pd+6W3zKgxwIuQcdhQQk8zk7iSOP5dyZ7lQiTuFxns=;
 b=l13gZ73uXkN3N/QykaiUYYe6uxLiJFi5a2JGtdxABuZzgExA9VzfTRYeh7BDwlkT3x3Z/Yr/mLZVFB/bA1tcFXgthj+6FlvSLGkpD1jDKy4XYea864jh02g+AK/gAme83OBGo1lgOnwniDquer90gbgshU6io7Y/GqAGd88yJK9xrdXEnhhKMb5TBdHm54LGejQ7HgcD/tSz5QU41e2bX875nUD2moIwKaCKBNzpxdjC3tt8jnp9MgycqMxP7kZuXjbfhCaOT9UQVZa7Prfl/TR1LSCDD/StPaE5+PZDnLH0XNhDr9InMCnhP4zp4I0sMyV5kl85Mp61arGNG7pRFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 19:04:29 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 19:04:28 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Skip GT TLB invalidation when VM has no queues
 mapped
Thread-Topic: [PATCH] drm/xe: Skip GT TLB invalidation when VM has no queues
 mapped
Thread-Index: AQHdJVQ3cBqoZUbJ1kyT+NC9cJwUTraRYiQA
Date: Thu, 6 Aug 2026 19:04:28 +0000
Message-ID: <68a4c12e90c7f3fc08a62a6de41c9bb26b38fc23.camel@intel.com>
References: <20260806033205.3858054-1-matthew.brost@intel.com>
In-Reply-To: <20260806033205.3858054-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|SJ2PR11MB8471:EE_
x-ms-office365-filtering-correlation-id: e69e424f-8750-4d15-2094-08def3ed8a23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|56012099006|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: s3GZAV8GohphBMH6LKzpIXVWYbDcYsfFOtF3kSxsIHS6C7iU3JwBqY16u2+wIWxnOCsze7yjdu/HHa3Z9D/EaD5Luy0igc+WJqs/SAQ1BvlVxVg6iDR63xwxGxqSCSpnQbCpXL8pM0BOudZ97A6yKKMlDkHCuduSdiedMPN/PO2CmpbYuc0iMcXrRgEIVJ4pCKkYCdlXOL0Xg3FywsrJdQq5O1qE0rF9U/FtGCjYYYFkUaBdMpVOLoK3Dnw6X91aOcNT7EK9C8/RUx5LeHN7vLbrVNNJCI1H4p5pOYghEP41tkLsd/uomH4PU2SrA6Rer3pu8tDiV0Z1mIDejd1szjX7bH7HwCT1O78cp/E/U2AaHb6HbFVDCfBk9g+ecJthh5COg9hPYbk5lw5rp3Wa6TS6CPKl8l57KGk8oxMx0fnlNZ6LiXVtQBHxu00eyiBc2IjJdQDzB4t48kkxfO6ECHBqrOvl93keGmms3bF76cvVvhWNLReWDxsIfM95Y4LduL0Pis58kEYwbCWHwMvcpjqQ+ZdinbGu/xaMdOtZ2ca8HaVph76qoUuyWt8LxO+Hgazv4tiOIfpR4usG5SAn9C9FT3OnGdohKvfRWhQolYzv5wiMJpNVAig4qU7ZC1Y+QJG4AbpmxzaaRSreCT0NMna8GoboRpR4X5lMBZ+r+5Y4dcGgWAuGwlZMhqJ7hWcUo403HMr9OFOiKl1YSQg/JG1l70aeeiHA5SAsxArzaig=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmFVbzFYV1BzTzNBSkw0ZWxETWhEUURYSTUvZlBGZ254dE5tTituRDJ0LzQ5?=
 =?utf-8?B?YWdkb3c1dVJwcVdXcytOT3BQc0x3dGExaGxmSW9HM3lmTEhBUVZ2aDRTR3kv?=
 =?utf-8?B?K0hkVlRjRGhYRVRINWRuZ3NNYjFPYTRjZVh4VkRTR1d5Tlp0dW9LeWM1dGE2?=
 =?utf-8?B?WnIyWGIzWTVWOG8yK0o2M2hnTXhmMVhlWjk4bFhXczlRVkhMQjFRMU9YMmRH?=
 =?utf-8?B?R2xjbTAvclcwQTFPWndsa1ZJTlhyQ1U0am56Vkl3eExVOUk1YW0wWVZkRkZa?=
 =?utf-8?B?dTErM0FGTW9jOGJJQStqSlR6cm9qeUUwcGFVMlFKS09EZ1VjekdYcUJZWVcx?=
 =?utf-8?B?L1VGSVlFdGkrdWNYUzNtaVBLeGRuRVZPRno2c1d2NUk0WENsRVVjRWd4czFY?=
 =?utf-8?B?bWFWUSt6c2x1YStyZDVXSUpGblZoWnZQdFFLdCtGVlQ3V2NTQ0ZsRVBueVc4?=
 =?utf-8?B?bCtIdE1sS2dtRXpvUHhCdG1ZRk1UeHZNUkxwZ0NlNVF0SHdCOVhTcEl5M2hm?=
 =?utf-8?B?YXpMaExPNVBtQ3lWdk9yeEJCUVF4RCt5WHQrd3FLUm5kRTl2eWczUUh1cGhq?=
 =?utf-8?B?MmxMS0lUSW82Y1M0ZDhGcC9IMW5lK3R0bjZsUFBwUmtQT2xYWU1pekpxWlNC?=
 =?utf-8?B?dTFQeWZZcmg1VHBKeFJ0V0xvZk8wd3g1SVZ4K0UxZ3hCUlR0YmE5ZjQ4NXZV?=
 =?utf-8?B?WkU0NjI4Q2NwQkdlVXlid1kyZDIxQkZ0YXpYd1duUm5UMGVwUmtYaEpsT0RM?=
 =?utf-8?B?Y1FSMXd2a2FNRXdHckEwNUtZY08veHdpZElOSDg3aEwyR050ckthNFVRRWlp?=
 =?utf-8?B?R0xYaGRDdXlGS084SUxHb2hrbVMwLzhRNU5oeGNPVWI0dW04M1FWSVNZOGc3?=
 =?utf-8?B?TkNRdDB2c0xkbUJZbDRWN0Zrbzc3S0habjRueVl1eW1ZdlZOYkNuZ2Q5OGds?=
 =?utf-8?B?SnBQVEU0QjVzYWc4ekdnV2NGYi91LzBIeG1CbUlsa1BTS1N4Zm1aZjVzU1Z0?=
 =?utf-8?B?cVcrRTczNlB2Y2dHdHpvOEVJVjE4dUVHZGgxcmZkbGtwNS9QRWtvVkZqTXlx?=
 =?utf-8?B?L1JrU2tlUXVERERpMnVRM203TWJLRDJXY0V0cVFGVGF6WnRrV09BOVJDcU05?=
 =?utf-8?B?aU1aK01jNlFkbGVJdDR1ZGRhV0RlTS9iNEtndzYzSlZaNnd4THhSNmZlbVl1?=
 =?utf-8?B?MW1rTnI3V2lRV01jcUhoZzU0NUV5dDVwbWFJQW5zNXNUNzJjM2tiM01ZM01m?=
 =?utf-8?B?V3J3NDN4WVozRUFLSUJHMnJ6aHlWK2lzb0ZKRVIzTGo3ZHA3Q2JQWU9FUGFy?=
 =?utf-8?B?dE9vQlZOUk83MStnK1RHOCttUFBESzBKQThzMEF6MWk3VHNiNVVIZnVBSkJq?=
 =?utf-8?B?bE0vRjRhaWlidWl6Sk5nZHZKekxUSUJOb1VCU3BWTFVmd2UrbEl0a3VJNFA0?=
 =?utf-8?B?R2w0L2s5TWNlOW9VVkpGK2svcC9EWDdJQWlzTFB5TVNRK3FZS0thVDhyYmsx?=
 =?utf-8?B?ZkJucnpyR09CaW8zTXpMdi8zdUFqNDNWMG4rRjV6bk5xc3pjaEEzd1JmNGlq?=
 =?utf-8?B?aE54enJKeUNqY3J5cHU0T2dqWUNzdVRTWDdzbjl3a2gwRlJDNkdnc3BiMncw?=
 =?utf-8?B?Z1ZMcjJUWGZKNTQ5NzJSNlJxOHo0Y0FVRnpOZGtMaGlkV1VLYUlSRzZ5cmph?=
 =?utf-8?B?dGwyMm1FU3YvSlg4a1FWdDV6SHNSeFgvUUxyTGZNT2JZT1dZUlFRTm1uTGRj?=
 =?utf-8?B?bEZIVFJwWTRkNTVEOGpBbTJxRThwRC9uYWdxb1A4WDFhbyt1QTlGZk1zV0Ns?=
 =?utf-8?B?ckJMN0U4M0dza0JnUkJ0bWdCYWxrY1R2Y1pUVFhaUXYzZWpOYXlQNncvUWlD?=
 =?utf-8?B?V2hENEFaTEk4VE9Ka0tuL3d6cUJFV0pGbTN5ditwV0x3YkE2UGVUSm1NcDlX?=
 =?utf-8?B?NHU0T01JMjJ1a0V5RDRiNUpienhBZ3pFelQzcTBFKzdmdFE1RklEUFhhY1ZQ?=
 =?utf-8?B?NWV1aUVSK1UzT0FxVGNOcEJDaGllbFIzek03T01tWWhEMWlGdm44MmVVWm5E?=
 =?utf-8?B?aHRhYXdLNlMwaVVubklzMm51RUh2bVVRSG53ZnFyN214dU1FWlFJN3EzUnV0?=
 =?utf-8?B?d1crZUxGTzA0UXloZWhhOUV0TjNQbnZvUXUyaktXdUY5dFdxQ0VoaWpKb2Q0?=
 =?utf-8?B?czltakRWanVQYWxBeGp4OFd6MlJoVGlNdzZHcS82dGdyMVE1QktHaGp4MHV6?=
 =?utf-8?B?Y1Z6Q2JjTElGSTRGejRoOUxuYWM1ZVNjN3oxYWdTSDZxSTVleFBoZno0UTBm?=
 =?utf-8?B?Vkx6TXVUUTZoZFpVOHRGd0ZSMDdxcmd1dkVIZm1Ebno3c1pJZ0pwNHZZRmJY?=
 =?utf-8?Q?/ims6w7coMKk4J8s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7184C34BE4C3524F8EAF940CC315AAA7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sEEcARxrkhT3S5tiCD/Uvi/RM2XpDnS0cmXyFkJzmNABWrH2b9ASgvbTwQNMq1RUMNbloTW85lDsaSB1yt1iPKFAfrE//y9rF3dACBBlyLAOD0PXvbJAhKkncHS6c8JzOkjUGXDp7rYhwNk2e8jP8G9lAYDOt0+iwQgsOmyRONPz7gL7i1DRekYIz+MQhaSg+C3nqnGHd4Bff0cPC3ugrPns5AqsqMCACZtmJBgaiqQSILP3MF33+0zVTS1n4DNMllCpc3ENgL36NP6qOwGXwgl2M6Csd5lKnWOChW54grB6bbVaxJ9JrXm683aCDicoXILXvFG8oBRFTmlqzGU3SA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69e424f-8750-4d15-2094-08def3ed8a23
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 19:04:28.3447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jBFJa9YYvYQHjgTWi7qprLNQqUp9ld/mII6av/BK6/8c4fUpLOGdEwWrgOKqRQ3BIB7taikxXCBoo1yU2gdgLXhc807RXXeW4qzghRdOrxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
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

T24gV2VkLCAyMDI2LTA4LTA1IGF0IDIwOjMyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IElmIG5vIGV4ZWMgcXVldWVzIGZyb20gYSBWTSBhcmUgbWFwcGVkIG9uIGEgR1QsIGlzc3Vpbmcg
YSBQUEdUVCBUTEIKPiBpbnZhbGlkYXRpb24gZm9yIHRoYXQgR1QgY2FuIHJlcXVpcmUgYW4gcmM2
IHdha2Ugd2hpY2ggaXMgZXhwZW5zaXZlLgo+IAo+IFNraXAgdGhlIG1lZGlhIFRMQiBpbnZhbGlk
YXRpb24gd2hlbiB0aGUgVk0gaGFzIG5vIGV4ZWMgcXVldWVzCj4gbWFwcGVkIG9uIGl0LiBJZiBU
TEIgaW52YWxpZGF0aW9ucyBhcmUgYWxyZWFkeSBpbi1mbGlnaHQgb24gdGhhdCBHVAo+IHdlIGNh
bid0IGJyZWFrIGZlbmNlIG9yZGVyaW5nLCBzbyBpc3N1ZSBhIGR1bW15IEdHVFQgaW52YWxpZGF0
aW9uCj4gaW5zdGVhZCB0byBtYWludGFpbiBzZXFubyBvcmRlcmluZy4KPiAKPiBUaGlzIG9wdGlt
aXphdGlvbiBpcyBwYXJ0aWN1bGFybHkgaW1wYWN0ZnVsIGZvciBTVk0gd29ya2xvYWRzIHdoaWNo
Cj4gbWF5IG9yIG1heSBub3QgdXNlIHRoZSBtZWRpYSBHVC4gQXZlcmFnZSBUTEIgaW52YWxpZGF0
aW9uIHRpbWUgZHJvcHMKPiBmcm9tIH43NXVzIHRvIH4xOHVzIGluIHN1Y2ggYmVuY2htYXJrcyBv
biBjZXJ0YWluIEJNRyBwYXJ0cyAtIHRoZQo+IGltcHJvdmVtZW50IHZhcmllcyBiYXNlZCBvbiBw
bGF0Zm9ybS4KClN0aWxsIGdvaW5nIHRocm91Z2ggdGhlIGNvZGUgY2hhbmdlcywgYnV0IGlzIHRo
ZXJlIGEgY2hhbmNlIHdlIGNvdWxkCmRlcmVnaXN0ZXIgYSBjb250ZXh0IChzbyBubyBxdWV1ZXMg
ZXhpc3QpLCB0aGVuIG1tYXAgdG8gaW52YWxpZGF0ZSwKdGhlbiByZWdpc3RlciBhIG5ldyBjb250
ZXh0IGFuZCByZWFkIHN0YWxlIGRhdGEgaGVyZT8gSSB0aGluayBpbiB0aGUKY29udGV4dCBpbnZh
bGlkYXRpb24gY2FzZSB3aGVyZSB3ZSBkb24ndCBoYXZlIHF1ZXVlcyB3ZSB3b3VsZCBub3JtYWxs
eQpzZW5kIGEgZnVsbCBpbnZhbGlkYXRpb24gaW5zdGVhZCByYXRoZXIgdGhhbiBqdXN0IHNraXBw
aW5nIGl0LiBUaGF0CnNlZW1zIHJpc2t5Li4uCgpUaGFua3MsClN0dWFydAoKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiAKPiAtLS0K
PiB2MjoKPiDCoC0gTWFrZSBHVCBnZW5lcmljIHJhdGhlciB0aGFuIGp1c3QgbWVkaWEgR1QgKFRo
b21hcykKPiDCoC0gRml4IGFjY291bnRpbmcgYnVnIGluIGVtcHR5IHZzIG5vbi1lbXB0eSAoQ0kp
Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jIHwgMjAgKysr
KysrKysrKysrKysrKysrLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDEyICsrLS0tLS0tLS0tLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y190bGJfaW52YWwuYwo+IGluZGV4IDA0NmQwNjU1MTIyZi4uYWIwNGI4N2NmMWMzIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jCj4gQEAgLTIwNSwxMSArMjA1LDI3IEBA
IHN0YXRpYyBpbnQgc2VuZF90bGJfaW52YWxfYXNpZF9wcGd0dChzdHJ1Y3QKPiB4ZV90bGJfaW52
YWwgKnRsYl9pbnZhbCwgdTMyIHNlcW5vLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3N1
YmFsbG9jICpwcmxfc2EpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndWMgKmd1
YyA9IHRsYl9pbnZhbC0+cHJpdmF0ZTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSA9IGd1Y190b194ZShndWMpOwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV92bSAqdm07
Cj4gK8KgwqDCoMKgwqDCoMKgaW50IGVyciwgaWQgPSBndWNfdG9fZ3QoZ3VjKS0+aW5mby5pZDsK
PiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBsb2NrZGVwX2Fzc2VydF9oZWxkKCZ0bGJfaW52YWwtPnNl
cW5vX2xvY2spOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIHNlbmRfdGxiX2ludmFsX3Bw
Z3R0KGd1Yywgc2Vxbm8sIHN0YXJ0LCBlbmQsIGFzaWQsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhFX0dVQ19U
TEJfSU5WQUxfUEFHRV9TRUxFQ1RJVkUsCj4gcHJsX3NhKTsKPiArwqDCoMKgwqDCoMKgwqB2bSA9
IHhlX2RldmljZV9hc2lkX3RvX3ZtKHhlLCBhc2lkKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNf
RVJSKHZtKSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFBUUl9FUlIo
dm0pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBkb3duX3JlYWQoJnZtLT5leGVjX3F1ZXVlcy5sb2Nr
KTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoIXZtLT5leGVjX3F1ZXVlcy5jb3VudFtpZF0gJiYKPiB4
ZV90bGJfaW52YWxfaWRsZSh0bGJfaW52YWwpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBlcnIgPSAtRUNBTkNFTEVEOwo+ICvCoMKgwqDCoMKgwqDCoGVsc2UKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0gc2VuZF90bGJfaW52YWxfcHBndHQoZ3VjLCBzZXFu
bywgc3RhcnQsIGVuZCwKPiBhc2lkLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gWEVf
R1VDX1RMQl9JTlZBTF9QQUdFX1NFTEVDVElWRSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwcmxfc2EpOwo+ICvCoMKgwqDCoMKgwqDCoHVwX3JlYWQoJnZtLT5leGVjX3F1ZXVlcy5sb2Nr
KTsKPiArwqDCoMKgwqDCoMKgwqB4ZV92bV9wdXQodm0pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gZXJyOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgaW50IHNlbmRfdGxiX2ludmFsX2N0eF9w
cGd0dChzdHJ1Y3QgeGVfdGxiX2ludmFsICp0bGJfaW52YWwsCj4gdTMyIHNlcW5vLAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV92bS5jCj4gaW5kZXggOWUwMTc2ODYxY2I2Li5lMjY2NzIwMDQ2MmMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dm0uYwo+IEBAIC00OTQ2LDggKzQ5NDYsNyBAQCBpbnQgeGVfdm1fYWxsb2NfY3B1X2FkZHJfbWly
cm9yX3ZtYShzdHJ1Y3QKPiB4ZV92bSAqdm0sIHVpbnQ2NF90IHN0YXJ0LCB1aW50NjRfdCByCj4g
wqAgKiBAdm06IFRoZSBWTS4KPiDCoCAqIEBxOiBUaGUgZXhlY19xdWV1ZQo+IMKgICoKPiAtICog
QWRkIGV4ZWMgcXVldWUgdG8gVk0sIHNraXBwZWQgaWYgdGhlIGRldmljZSBkb2VzIG5vdCBoYXZl
IGNvbnRleHQKPiBiYXNlZCBUTEIKPiAtICogaW52YWxpZGF0aW9ucy4KPiArICogQWRkIGV4ZWMg
cXVldWUgdG8gVk0uCj4gwqAgKi8KPiDCoHZvaWQgeGVfdm1fYWRkX2V4ZWNfcXVldWUoc3RydWN0
IHhlX3ZtICp2bSwgc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpCj4gwqB7Cj4gQEAgLTQ5NjEsOSAr
NDk2MCw2IEBAIHZvaWQgeGVfdm1fYWRkX2V4ZWNfcXVldWUoc3RydWN0IHhlX3ZtICp2bSwKPiBz
dHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSkKPiDCoMKgwqDCoMKgwqDCoMKgeGVfYXNzZXJ0KHhlLCB2
bS0+eGVmKTsKPiDCoMKgwqDCoMKgwqDCoMKgeGVfYXNzZXJ0KHhlLCB2bSA9PSBxLT52bSk7Cj4g
wqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT5pbmZvLmhhc19jdHhfdGxiX2ludmFsKQo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gLQo+IMKgwqDCoMKgwqDCoMKg
wqBkb3duX3dyaXRlKCZ2bS0+ZXhlY19xdWV1ZXMubG9jayk7Cj4gwqDCoMKgwqDCoMKgwqDCoGxp
c3RfYWRkKCZxLT52bV9leGVjX3F1ZXVlX2xpbmssICZ2bS0+ZXhlY19xdWV1ZXMubGlzdFtxLT5n
dC0KPiA+aW5mby5pZF0pOwo+IMKgwqDCoMKgwqDCoMKgwqArK3ZtLT5leGVjX3F1ZXVlcy5jb3Vu
dFtxLT5ndC0+aW5mby5pZF07Cj4gQEAgLTQ5NzUsMTQgKzQ5NzEsMTAgQEAgdm9pZCB4ZV92bV9h
ZGRfZXhlY19xdWV1ZShzdHJ1Y3QgeGVfdm0gKnZtLAo+IHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpx
KQo+IMKgICogQHZtOiBUaGUgVk0uCj4gwqAgKiBAcTogVGhlIGV4ZWNfcXVldWUKPiDCoCAqCj4g
LSAqIFJlbW92ZSBleGVjIHF1ZXVlIGZyb20gVk0sIHNraXBwZWQgaWYgdGhlIGRldmljZSBkb2Vz
IG5vdCBoYXZlCj4gY29udGV4dCBiYXNlZAo+IC0gKiBUTEIgaW52YWxpZGF0aW9ucy4KPiArICog
UmVtb3ZlIGV4ZWMgcXVldWUgZnJvbSBWTS4KPiDCoCAqLwo+IMKgdm9pZCB4ZV92bV9yZW1vdmVf
ZXhlY19xdWV1ZShzdHJ1Y3QgeGVfdm0gKnZtLCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZQo+ICpxKQo+
IMKgewo+IC3CoMKgwqDCoMKgwqDCoGlmICghdm0tPnhlLT5pbmZvLmhhc19jdHhfdGxiX2ludmFs
KQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gLQo+IMKgwqDCoMKg
wqDCoMKgwqBkb3duX3dyaXRlKCZ2bS0+ZXhlY19xdWV1ZXMubG9jayk7Cj4gwqDCoMKgwqDCoMKg
wqDCoGlmICghbGlzdF9lbXB0eSgmcS0+dm1fZXhlY19xdWV1ZV9saW5rKSkgewo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbGlzdF9kZWwoJnEtPnZtX2V4ZWNfcXVldWVfbGluayk7
Cgo=

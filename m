Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB68C7EE22
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 17:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB60A10E0AE;
	Thu, 11 May 2023 17:22:45 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86DD10E0AE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683825764; x=1715361764;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tx52uq/iFfYGlszGCziOdQKuYjY6bVgdvn060cZXN3g=;
 b=ZLfSKAtxEkjLViWBf6HYCFHGP8WEaB0u9jjzb/IzPstszzrjTO3UB5vZ
 M88EmTf7AyxXDNXUZjrh27HykuZuiuCSgV9zEIv0T5FTrfjK6rFPVQ2G0
 BQ51MQDnr8aIKyIpySiQpcsV4UdQQgT91AvDpdoxDMNd7mlC2qRDuosqS
 qpESyBMbz4BdKAOmXXZ4b8rriYm9OswmpC010Ww7mlDVH7KbVDVr4eu7l
 v5lFTbZw6/iJWzp4yaLct+Q8mHXdJJNPKnimhp41Ix/OIUuokDpyHh7sc
 1c0Jxwk9sWR+cVx2Q7p1UXdp1KV/JvDB0x+GdZHM9q6ci4yRt28uIOdCC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="413929495"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="413929495"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 10:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="1029710823"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="1029710823"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 11 May 2023 10:22:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 10:22:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 10:22:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 10:22:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 10:22:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGcVVWIatiRQNQzFVUytwnI/kRUeXsSH1/poG+KTSaSWcpl32esbfol5Naaq9KYHUmk6O/XfqNgwu7vESWA5z+nDIRPmvF9tuGrCN0oP0UPEqBn6QOIuIN+lkTwJKJAEBvB1h+icvF1t2FRFyr4kbmxE1DCh9EThiNiHTegWBBPvG0fCHFROvWoPisdIkEcYWhI/zwgsCtvENwDSeMEmEAsggHUE5w8u+W41l5XnxcwPxcvR3tC5Mm5RJiKCcMifxL9jwlN589otJoCs5VL9St90xuxdhNTtRdtl+jBNq5zl/3bHeGPTYFu4dY0K8OXEmsoT+qvU107NPaPGrxKj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tx52uq/iFfYGlszGCziOdQKuYjY6bVgdvn060cZXN3g=;
 b=FtfwyKRyrAQqH+q040MHG6835kqkbQwMq8jfzQPI+KbZ7BIh+ef17XXHyN1HYGh7ujkmt3pbWFksxlB79jeX7AecacQgZvrHH+/+D28NXjUgyyy+yzBihgW5+s1iU07bKUSXckTCMSoFYpZ5zLwVUSXvnlVhxc6kDU3irKmRSAM6UTQjKnVINOZPavJ0XrtHQbHB1shIKaNmekuKYdi+sipTF2a4pf9OFPaGeIGK6nx39MhhAVTv34dLDcaRWOvbqYV8E3B9gkzqp6DSZ/MZuG0TojesJLcbZRvNqy5Tapv7tgWsvptZC0wsNXWy0zeLJpiBW4AwVHcy1msgCDDFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6930.namprd11.prod.outlook.com (2603:10b6:510:205::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Thu, 11 May
 2023 17:22:35 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6387.021; Thu, 11 May 2023
 17:22:35 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
Thread-Index: AQHZg3lXlCg7AEmARk2GyxyIlQQR0q9VBoIAgABJ/YCAAALjgA==
Date: Thu, 11 May 2023 17:22:34 +0000
Message-ID: <9d04fce692222624580527c6d07ea88460a32ca7.camel@intel.com>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-4-lucas.demarchi@intel.com>
 <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
 <njuthgb5uutcknbsxvvvxfx5636bofmwmfyjq6nbxkpbxai4xp@4vwutipfdpd7>
In-Reply-To: <njuthgb5uutcknbsxvvvxfx5636bofmwmfyjq6nbxkpbxai4xp@4vwutipfdpd7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6930:EE_
x-ms-office365-filtering-correlation-id: 329c27ed-23d6-4353-777a-08db52444f8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rHODWvgNp3qk4VFgXSpcrvBpfP+Q5i1BxSR2LjYK8nSQbGGrTBRJg4FGREKc7kGzIzN5Pt2HqaMqR6BG3FLAMIW8xoGY3ee0hQMNP0DX+AEpkR6h6TDbuhreFm0DAsxefgIF7Ef4exolUNY+l4aViik9PfZfAWvywKChqu3FsWRzo0bezR0BQQNQQvBf/eAYc6ncbYeUiU3oIexeVNe1ZQQ5bjUOJtFmFsmAXQe8FhrgXwKWb0fQc1WT5mcDue1Kwu8igCpyRREVoUVZpgiA03xu3LZ4XO/ckPeoS+zyEuRLSU+B11fcO2cqhyzXOHqvlmSwHi85U4IT5lTWzsavOW7kvItOvjFwsmv8E64LTJCQ4xmGM7Wkxzdcf7nx+r5pFtBKptNbdrSthq1sJnpPlC7H5oxhvbt9I0mlVuKkptWnRu7c0O683CLm52cb8LjjWY/kYgnbGEzzD+40H41m/GHhC9G90hrzGBv0Y/MbSiwfw9J21N5PAe3rQsbSxLZ8gR8039lx3XkbV2BS2/gVNAWHao/ZNokNsfoDjdCLpAYBfAd6dPkzogxq32EeMtdNtffjPsfyQxF5shcIOOz77nU19+KHyk0zj2KiCokWiLJEemqcIdgATVDndh9CyWyl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199021)(38100700002)(38070700005)(26005)(2906002)(6512007)(6506007)(2616005)(41300700001)(8676002)(8936002)(6862004)(5660300002)(82960400001)(4326008)(122000001)(66476007)(66899021)(6636002)(64756008)(66556008)(66446008)(91956017)(66946007)(316002)(76116006)(186003)(86362001)(478600001)(36756003)(37006003)(54906003)(71200400001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZG5MZCtNc2N2UFdKVHh5UlluUGtGQjg2QXpSdjVldVhnSkExWkt5b1J4R3hS?=
 =?utf-8?B?T2dYbk1nUTQ1M0w4b0xSL21SSUpwbTE4OFdvYklDZFo4MGNFcWplQTRIeDFI?=
 =?utf-8?B?N0dLamg4UXZZQStJUUFTbm5iQkVTSGNYeklTK2d2RmVCNTY4bkxYZjRVTTdp?=
 =?utf-8?B?aTFHOVJpSHlMOUVhVlROMENsSWNqWkhjQW9KMUloaFNlQmxiU3Y0RXpvaFl4?=
 =?utf-8?B?Vkp1NHd6c1pucFZndDFVdDIyUlNaUTlQNVZTdFpjL2s2RlBGZU53dXlKQThF?=
 =?utf-8?B?aC8wZ3Q0NFljSWRNUzJ5MC81b3M2UTIwaE44NmNZVEtXRkM5UmllNjlNbTUv?=
 =?utf-8?B?STFRdHpOL2poS1JtOUxtTDNRYjM2RnZCdFpOajZFT3lnV0RPYjFFQlhSb3J0?=
 =?utf-8?B?MWVIV1dXcnI5WnNMaWVITlZBYi9CNllqZEZjUjBZbWo4VGZJTXBmN2dMTGVY?=
 =?utf-8?B?MkpucjdLTUl4c215WDNFWFUwNFNzVm9VbXdLUDVRQlpjUTJnK0NiWmJkbmhB?=
 =?utf-8?B?aC84c2M5TlZ5MHVsNnozdXVNNG1zMTJ4Z3lENkY5M1RKbU5WYzAzTXhwY3BZ?=
 =?utf-8?B?TW4wRWROQVFzWHB5QUVjMEViaGJxc3hmdVBUcXlJMnZOOW5BQ2RmN2VqbDBz?=
 =?utf-8?B?YnFobTlVZFRtaDJBeUl3aDROVW9aM3Z3RmpZQUtoeTErL25wclBqT3h0ZWVV?=
 =?utf-8?B?YXpLdEVMQk9ibXY3V3pJOHRXNHNEMmpLQVZ2Q3Z3UlFXVkxOVjdiSkV4VHNN?=
 =?utf-8?B?NWJYeGNJV1Y3MmFiRHV1TGRtRFZUeHpkQXEyN3lsVFdFWkdsYjRJSUpEbnox?=
 =?utf-8?B?TkdIZXV0VEpLUDc5YXRNU3VtYkxNNlY5ZnVhMGNhMTVDZzR4dkhQczJtOEhD?=
 =?utf-8?B?ellQTWh3M3FQdDd3ZmYzTlNGVE1NT3ZwNzV5VUlLeTRGNG4rL3hML2VpZUZG?=
 =?utf-8?B?QXUrdmJUelVncHdybDl3cUVwS1BQNS91MUVNVThMdlJXcktVczRNblNPcVRQ?=
 =?utf-8?B?dmFXd2YzQy9JV3BtZUJVTG94VE51VmZucStxQmVWSi92MFZ3UERYVkIvWmlm?=
 =?utf-8?B?YVQyMG96U055K28zdDZuVlhNbS9xZy9DeFZuNWpjNVc1RERBOTdrVUxzYjQw?=
 =?utf-8?B?OS9CbGtzaFk1Sll2WTgydWJIQThLQ2I2ZUc0R0J6azFVcGRaNWVjWFo2ZHdV?=
 =?utf-8?B?NTdBZm9FbHAwYXZLZkUrbHMwdjRLVTMvQWdVUGxhazVrcFU3djJHZlNHUjBm?=
 =?utf-8?B?dlVIRUpXM2lTanQyeDdZU1VaS25qVEFvazFPeE8vaFpaRWExUHQ2MER1Tnhm?=
 =?utf-8?B?RXVXNHNuWFlpSWdyWDJkMzNkdnlVS09FYmV6Sm1JVGJrbnI5czE1ZUJSdStS?=
 =?utf-8?B?QlFwSzJ3WCsrczhCREtiVUxtNkQzQ0RQMTh5c09kOU1TZ3BpSnE0Nnp0bzVV?=
 =?utf-8?B?cUIxcTBkNlNpNUs1WUZMdFVJeUxiNWZ2U3RRQXl6ZWwyL2YzNGVPZDRTUExk?=
 =?utf-8?B?QitVWDM3TmpCcVpieER3Um0yQTJGT0RaRWpKVTBEcEt2WnNYYUlhNUJPdDBt?=
 =?utf-8?B?cTNYTDBYWDFYcFJNbEJLb0ozbTFpZVkwZXFTeGVlZSs5Q0RWcHI1Zm1JamI3?=
 =?utf-8?B?YjhCdnF2NjdkTHl3ZGZLeWoyUWk5cng0WWhkT0hnUU43QURJTHFxV0ZSc0hi?=
 =?utf-8?B?a0tYYkVoN3FVU2lGdDFIdm1IeUEwZW1vaXBISWorL0IzY2czTHZ0Wmt3L09l?=
 =?utf-8?B?djJNQjhJTHJDR3hXb2FxeDBGcnFCVnM3V05PU0RISktrMjBsckZOTzlHSjhS?=
 =?utf-8?B?WUE4L1dmNk1BYVR3bVhBaXloWnFkQnVjeTFRV29UV2dDL2FzSjVuWDQ0OEU4?=
 =?utf-8?B?WUcrUFRYbnZtclVvN29HNjZwSENKNE42N2toQ0JZbFBTYXZRVCtjelcwQ01T?=
 =?utf-8?B?eVFzaE5zeXp6V1RZLzhLVTZzTTJPR2h3SlBLcVg1TC9DcERMMGkxTGUyOXI0?=
 =?utf-8?B?c21GTlJnUWU2anc4TEkwam9IYTdjRk1VZkZDaHdRaE9DVmU0VStUYlEraVUr?=
 =?utf-8?B?ZmNreVRNMnNCWllMM2plazdsVWNyZzlIZVZubVd1UnkrYzBRbUUzaGIrKzEw?=
 =?utf-8?Q?ng4s2TkKCRPXzok+cSCqwtFwv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FDF698488D8454698B4D7FCA3ADFCCA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329c27ed-23d6-4353-777a-08db52444f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 17:22:34.8626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o4TAjnYuTXN7qGyUrJk10mUqcitkKvqEJIoIg7TGZZP63m58W4r51bp2wwXX8HUN93c77n7LJc9sdoPp5p3INA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6930
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA1LTExIGF0IDEwOjEyIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDEyOjQ3OjI2UE0gKzAwMDAsIEpvc2UgU291emEg
d3JvdGU6DQo+ID4gT24gV2VkLCAyMDIzLTA1LTEwIGF0IDEyOjU0IC0wNzAwLCBMdWNhcyBEZSBN
YXJjaGkgd3JvdGU6DQo+ID4gPiBTdG9wIHRoZSBkYW5jZSBvZiBlbmFibGluZyB0aGUgZGlzcGxh
eS1yZWxhdGVkIGRyaXZlcl9mZWF0dXJlcyB0byBsYXRlcg0KPiA+ID4gZGlzYWJsZSB0aGVtIG9u
IGRpc3BsYXkgaW5mbyBpbml0IGlmIHRoZSBwbGF0Zm9ybSBkb2Vzbid0IGhhdmUgZGlzcGxheQ0K
PiA+ID4gSVAuIEJlc2lkZXMgYmVpbmcgbmVlZGxlc3Mgd29yaywgaXQgd2Fzbid0IGNvdmVyaW5n
IHRoZSBBVFMtTSBjYXNlIHRoYXQNCj4gPiA+IGlzIHRoZSBzYW1lIHBsYXRmb3JtIGFzIERHMiwg
YnV0IHdpdGhvdXQgZGlzcGxheS4NCj4gPiANCj4gPiBYZSBzaG91bGQgc2V0IHBpcGVfbWFzayA9
IDAgYW5kIGNhbGwgaTkxNSBmdW5jdGlvbnMgdGhhdCB3aWxsIGhhbmRsZSBubyBkaXNwbGF5IGNh
c2VzLg0KPiANCj4gaW4geGUsIGVuYWJsZV9kaXNwbGF5IGlzIHRoZSBydW50aW1lIGNvbmZpZyB0
byBiZSB0aGUgZXF1aXZhbGVudCBvZg0KPiBEUk1fWEVfRElTUExBWT1uLiBJdCBpcyAqbm90KiB0
byBtZWFudCBkaXNhYmxpbmcgdGhlIGRpc3BsYXkuDQo+IA0KPiBoaXN0b3J5IHdoeSB0aGlzIGV2
ZXIgY2FtZSB0byBiZSB3YXM6DQo+IA0KPiAxKSBkaXNwbGF5IGludGVncmF0aW9uIGJhY2sgaW4g
dGhlIGRheSB3YXMgbGVzcyB0aGFuIGlkZWFsIChzdGlsbCBpcyksDQo+ICAgICBhbmQgZGV2ZWxv
cGVycyBjb3VsZG4ndCB0ZXN0IHRoaW5ncyBpZ25vcmluZyBkaXNwbGF5DQoNClhlIENJIGlzIG5v
dyB0ZXN0aW5nIGRpc3BsYXksIGluIG15IG9waW5pb24gdGhpcyBvcHRpb24gdG8gZGlzYWJsZSBk
aXNwbGF5IHNob3VsZCBiZSByZW1vdmVkIGFuZCBkaXNwbGF5IHN1cHBvcnQgYWx3YXlzIGJ1aWx0
Lg0KDQo+IDIpIGhhdmUgYSB3YXkgdG8gdGVsbCB0aGUgZHJpdmVyICJkb24ndCBldmVyIHRvdWNo
IGRpc3BsYXkgSVAiIGZvcg0KPiAgICAgYnJpbmctdXAgc2l0dWF0aW9ucy4NCg0KcGlwZV9tYXNr
ID0gMC9IQVNfRElTUExBWSgpIHNob3VsZCB0YWtlIGNhcmUgb2YgaXQuDQpkZXZlbG9wZXJzIGNv
dWxkIGZvcmNlIHBpcGVfbWFzayA9IDAgZm9yIGdpdmluZyBwbGF0Zm9ybSBicmluZy11cC4NCg0K
PiANCj4gRm9yICgxKSB3ZSBtYXkgdHVybiB0aGF0IGludG8gImRpc2FibGUgZGlzcGxheSIgbm93
LCBidXQgbm90IGZvciAoMikuDQo+IA0KPiBJJ2xsIHRha2UgYSBsb29rIG9uIGhvdyBtdWNoIHdv
cmsgaXQgd291bGQgYmUgdG8gbWlncmF0ZSB0byBhDQo+IGRpc2FibGUtZGlzcGxheSBzY2VuYXJp
byByYXRoZXIgdGhhbiB0aGUgc2ltcGxlICJGaXggYXRzLW0iIGJlaW5nIGRvbmUNCj4gaGVyZS4N
Cj4gDQo+IEx1Y2FzIERlIE1hcmNoaQ0KDQo=

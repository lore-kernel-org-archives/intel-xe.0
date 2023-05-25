Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBDAC7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 14:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2B510E163;
	Thu, 25 May 2023 14:03:33 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7FC10E16A
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 14:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685023411; x=1716559411;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=uYJ+m3eYUGC3KBbWGUzEchoeGbEB0DoxUyI7iiVJF1U=;
 b=dc4SRlDPcvtZQMsy5qGH+L8e6TDRvgSqiu9OxUY9Zwke/rCJ8c3CqtYt
 ylz6I8jgbKvlzzUNFTNFns8L47KKc8Wio+DBm4hj7FZPiBAIrBoYticLj
 /50pKx5t774nBatvTzeAN9kbbLXf4GIzBmwzjfViJvawRM1MCtvNRK5JK
 pJiaXIzMhhucoUZfzy3dtsT4C1X55vHe4suOMZEaPCFLN+eHpKFpknRMd
 pEqZaV8HIMbsV3gVizrBOtwBPN4BAtcT+d3kH/lWVuNFH1ZpEYX+i20X3
 y0kZ9UjaIcsTllHFi/IBVyWShwiR4RpjEyQY21pA4/3F6DG3RLTbUmVix w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="343375829"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="343375829"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 06:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="704783643"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="704783643"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 25 May 2023 06:24:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 06:24:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 06:24:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 06:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctSlsNqOnqZAYwI1BcEtTWrznXPVXPbrLVWtzivflocoT2lgbVFgXmb4o4rjxd5Tfg++MCoSMYW3nyljCD+yPSiyUH5gjS2Yvfju2way27Q2HPPvmDk/LEosFWhTnWEx8+fALblnf39rdkv7LHJfv+DVfSpCLty/PcbSdziTenP4ayVGHhy9etahMZn3G53oSgwji2bZSILfWPln0ZJHmt5g0Kmdol/bTsA6eKa18/rSXD4tQbYmlNyPU01hm5AHbW6xhWYlaiV02eJ5wFEXWQfM/asVxYnfRwJ/jW7ZS6Bw1DH5se7dIp54zKyw0mZHOKrl7sPy4H0d3vH6uFKpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYJ+m3eYUGC3KBbWGUzEchoeGbEB0DoxUyI7iiVJF1U=;
 b=lvNEcYAP28CvojKeccku4XzTjmTOztAFe8dW5XGS1R37F5GdbQWELzM9wIYrB2lEL7tkXkSC/OIRI5EAs37PaLQ7REeMlvfjTsPGuqqYYTjw/ByAMo1GpBLvRAYMdOEL7Y5bp5wWQsC34/gWaAZn5I4mVwec+9s8nJmmmRDRgW/yaTEu2V7sfs4QFDu4PsrkJwnJ6O3j6QZp9Kpbag97dGYm24vfU3Ex4EW/VcLL3ZHZowj6tkXm2gaJjw4eogb7lmWc/70wvgcFfH3PioDBfnGQmxqa/v+CSl8Ge/6kzMQwxVYes5o0DYL1vx9Gd5AqFK1uQ/odlvHnl7nix8IejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 13:24:55 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 13:24:55 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "kode54@gmail.com" <kode54@gmail.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Yu, Effie" <effie.yu@intel.com>, "Hazubski, Filip"
 <filip.hazubski@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally invasive
 way
Thread-Index: AQHZjqwfKfiIn+DR10+1CO+1iyKMRa9q+zoA
Date: Thu, 25 May 2023 13:24:55 +0000
Message-ID: <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
References: <20230525015607.2192395-1-kode54@gmail.com>
In-Reply-To: <20230525015607.2192395-1-kode54@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5216:EE_
x-ms-office365-filtering-correlation-id: d469f57e-7dcc-4b7f-4732-08db5d236dda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qMl8P9pQXPt5tQTSWODFoLWVK60NM9sJLinySra7OcutbdGf0ZeGSa/zzqSpJx6p//AyiUaCfgftSAYBGFDWMOZEcRa6RUWfCdqYFaT+iU4YmNkhqIDC8jOyZ/+toE/OYzGzsDVDPspGYieMudXKK59PhLDvT+uHEFHoCGZhMlcx8E+8UHJNC4ippsu8qMnb1kbZ554LUw1/qBq1OtrWAz1MhpsAVSVtkWI6grNha521dd7dkQfCdAdBg+IpI7OsvKaZSCk0AezGNd5PQY6jHhNzMW9Rdw0yHL1ILUYZ8Qa/t//BZTGXfdkRoZbvTET22NpAEEDTEyYB+elhkc8zwRXjUgWqgwJ8lAAjsPa6qKXRKGJeoi7YcY71J9Bi42o2Bv9+xoWqWztE6fb6Nugjlnz8bd3aZIYIIowQ8HkcWj3N6+2EtJrId5jsNWU0htw/4aBvlYCg9LoHLTQvl8/3UhTiXhU5U0BDjltzhgMp1QkR73OekeyxTIkiBiG+xvGHACZbEq44BAx87/cNDpszdrmTyRF98lgKtJ4We95U+4w4mP4I1610Itaup8zqlk2cOcjLQxxCmnd86dpCkBCth8zVeoL/ZnJ8xTG2/e5tbTr1N8W8/3WNwv97NMvRJFoO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199021)(110136005)(38070700005)(15650500001)(38100700002)(82960400001)(122000001)(83380400001)(6636002)(36756003)(66446008)(66476007)(91956017)(64756008)(66556008)(71200400001)(316002)(66946007)(2906002)(186003)(6486002)(41300700001)(2616005)(76116006)(6512007)(6506007)(26005)(8676002)(8936002)(478600001)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzB5Y1hVTmdrNFZxMVYvV3ZpeVdyd3hYNERRODA4WlJsbUgwMjc0dEEvcVY1?=
 =?utf-8?B?UVBtMG5XRm5EbGRvOU4vcWRFMm1sTTlDM1RYbW1TTWVoTndiWUY2TmtpUmVH?=
 =?utf-8?B?KzVMbm94RVdDZ1hyUTZXOC9YdVZtZFlrNjBNcm4yME80M21lUksyZkdqWnp5?=
 =?utf-8?B?bFN5UzBRSHREbS9MaXBGTTJGUURhZEt0QzJUb3JGMFZ2N3k1YXcxb0VhWEpW?=
 =?utf-8?B?bys4Qyt5RWQzanIxVkFUa1QreEorSkZSbnBubFhsd1Z1dVlBbnllSlFCTGJP?=
 =?utf-8?B?dW15ZVZOd0FUTXBIcmJUN3QwbklLR0FzcmJqYU1MS01QbEtLTUl6aWdrS3E0?=
 =?utf-8?B?VkQ0ZWp5ODJyaURuNDUwN1BINWNWK3UzZ0RRS2VDZjdjUWhHUHNteG1yYmNZ?=
 =?utf-8?B?ZkZIaS9BRjF6RERMNDNEWlVINmFVRTJxVmFmQURjQWY2eTVpQXo5SWdQZ2tz?=
 =?utf-8?B?V1cyZ3hGb0JkOFNQMzJwQzhtelY2VjFoY3lQNkg4MHdvUG0xektmWWJ5Ukd6?=
 =?utf-8?B?Q3hwU2VmWFZ3bis1ekRYWW4xQjlYTnQzaGpZNzdjRGYxYUVSZERIblJNNkdF?=
 =?utf-8?B?MEFGUDVlTlhFdDhkK2JVV1hWWVZuY0hBbVEwL1A4UlBLRHdlQ01LNDV5VUpU?=
 =?utf-8?B?ZnFTdkluZ0NlcEwxV0RpNG4vZEZKQXY5RjFDa0IzSlJCUGpSY0hwMFhRRysz?=
 =?utf-8?B?c3Rlci9jNE1uUHVvSGdNbjdPdzF0L29DRzBzMy9DNG5RVlpiRCtTZFU2N1hK?=
 =?utf-8?B?RkNGY0pMd1o4VkhYLyt2Y1B0Z0Q3a250bzNqUUxwWndRUnVFVDJDWDhteXpZ?=
 =?utf-8?B?UXdsT3VJaVdjdVNvaURscXZoczhTV1lqUS9SdnN4N3E3eVJqMnovN0xXdlh5?=
 =?utf-8?B?WHhMclFWS2JMK0ZqeUtZM1BuOTY5N0grL2JNWWluc1ZFZEJZUTNIM2p6WFRj?=
 =?utf-8?B?S2lwV0RKc2NwcmZjaUNtVDROejhONWdsdWVHSnBOd0lieng2MUJJTy9EMy8r?=
 =?utf-8?B?dlNjeVN2QkJUU1dWZjZOQlRJd0N3KzFQWDNJb3RZWWhWcFAxOUIrZDFpdzhP?=
 =?utf-8?B?aGNlMTQzbXlTR3o5S2VNVGp4ZkpZRS9QL3ZFV21Hdzh1SklZU0N1Ym1uMnB1?=
 =?utf-8?B?S0M2YjFWQ3JNSGhJVExLeXhQWGp4M1RVM1ZVN0tWQlNpV0J5VlNiMXlzSkhl?=
 =?utf-8?B?cldKRzlLbURxMmg1MDM5Rm00bHVZUjRabmsyZXVkZFlqNUxqSVQ0Umc2cWtv?=
 =?utf-8?B?SGFnT1B6YnlwaUdURnJjUUhkTXhTb1ZpVWZobHAvNW1WdzcxNFpqL21ldUwy?=
 =?utf-8?B?akYrYU1vS3lHaTNJS2w1T0VsRDZ5OXhKOG9MUkh3SHhTYXBOVHVycGJSU3cy?=
 =?utf-8?B?VzJLNFNIZEFRV3hvZzlaNmd2V243cDRvV0ZSaFhPeVdkQnlCQzJWU2RNQTZl?=
 =?utf-8?B?d0xkNEIvRGk1bk5pR0E3N0owcFk3Q1lZMkcyMmF4ZE1LanFURG5NVE9uZVlC?=
 =?utf-8?B?eGNQQXBYQ0JrSnpHSk9HaVFUWmVvSEZIa1Q5eVhKUVBDUW4vSjBLTUVSTGxi?=
 =?utf-8?B?V3VYM01IK2NWL2diVTdQdTZkUnZta1FOcE1DVVZiNXRmV3hLaW1IeVRKa29X?=
 =?utf-8?B?VERZRE5DZDltZ3hoSHpiNUVQbS9xREFiZ283eWQ2NkJ0YkZFL3VOWGtsTXNP?=
 =?utf-8?B?OTdDTXlWdmhSNDI3c2dnT1hZZ2E5elBEL1RjdmUrZVFLTWYybk9xVXVVTlJJ?=
 =?utf-8?B?N1A1d2N2OUF0QXVWRHpLaGlJcERmZ0tPU2xrTU1HUEVWYWNyZUtGK3RPYW5N?=
 =?utf-8?B?azU1SE1GUkVtTkdWZGJ1azFCL0wxT1h4RXAyMGpBajBSSUZERnREdnM2VXUz?=
 =?utf-8?B?UHRFZCtzSW9iamRhKzMyU1dKclpGWExNb2h5cUJRTlE1Y0libkM0OVQwbVcr?=
 =?utf-8?B?V01qUHZLVkRiMGx4MFRDQjhvR0pUSE9HcW9Ba1h4anlRL1NBL3NlWG9oUFNL?=
 =?utf-8?B?d3YzblM2RHg5WkVvTmtweHFsZmo2ZElCWVp6M3RwNGw1THZmWGM1bFpaaFRu?=
 =?utf-8?B?OVdYd29qREhEMUdwZkVvSmxjQm1RZDM1eUdCZWRuQVpPQWlzN0d6ZVpGQjRP?=
 =?utf-8?Q?spYbbc7hr7W7YCzDuKDzXUl9P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C6834642064974ABBD23BC7C32E0598@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d469f57e-7dcc-4b7f-4732-08db5d236dda
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 13:24:55.1309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQs2nAsO8/2v+7qswmsYUm3/4Q7eVQwp5/26iwr1l1kn208v2DUCPGMu1RDvQaJbl8CaLZ3OKeSO3d86cLupbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally
 invasive way
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

SGkNCg0KUGxhbm5pbmcgdG8gcHVzaCB0aGlzIHRvZGF5LA0KQ2hyaXN0b3BoZXIgYWxyZWFkeSBo
YXZlIHNlbnQgdGhlIE1lc2EgTVIgYW5kIElHVCBwYXRjaCBzZXJpZXMuDQpJdCBzaG91bGQgbm90
IGJyZWFrIDY0IGJpdHMgQUJJIGJ1dCB3b3VsZCBiZSBnb29kIHRvIHVwZGF0ZSBpbnRlbC1jb21w
dXRlIGFuZCBtZWRpYSBhcyB3ZWxsLg0KDQpPbiBXZWQsIDIwMjMtMDUtMjQgYXQgMTg6NTYgLTA3
MDAsIENocmlzdG9waGVyIFNub3doaWxsIHdyb3RlOg0KPiBUaGlzIHNlcmllcyB0YWtlcyBvZmYg
ZnJvbSBtbGFua2hvcnN0J3MgYXR0ZW1wdCB0byBkbyB0aGUgc2FtZSwgZXhjZXB0DQo+IGluc3Rl
YWQsIGl0IHRyaWVzIHRvIGJlIGFzIG1pbmltYWxseSBpbnZhc2l2ZSB0byB0aGUgb3JpZ2luYWwg
dUFQSSBhcw0KPiBwb3NzaWJsZSwgYnkgb25seSBpbnNlcnRpbmcgcGFkZGluZyB3aGVyZSBhcHBy
b3ByaWF0ZSB0byBlbnN1cmUgYWxsDQo+IDMyLWJpdCBtZW1iZXJzIGFyZSAzMi1iaXQgYWxpZ25l
ZCwgYW5kIGFsbCA2NC1iaXQgbWVtYmVycyBhcmUgNjQtYml0DQo+IGFsaWduZWQuIFRoaXMgc2hv
dWxkIGhhdmUgemVybyBlZmZlY3Qgb24gNjQtYml0IGhvc3RzIHZlcnN1cyA2NC1iaXQNCj4gdXNl
cnNwYWNlLCBzbyBleGlzdGluZyBuYXRpdmUgc29mdHdhcmUgd2lsbCBvcGVyYXRlIHRoZSBzYW1l
IHdpdGggb3INCj4gd2l0aG91dCB0aGUgdXBkYXRlLiBUaGUgb25seSByZWFsIGNoYW5nZSBpcyAz
Mi1iaXQgY29tcGF0IHN1cHBvcnQgZm9yDQo+IG11bHRpbGliIHVzZXJzcGFjZSwgd2hpY2ggd2Fz
IHByZXZpb3VzbHkgYnJva2VuLg0KPiANCj4gQWxzbyBpbnRyb2R1Y2VzIGZpZWxkIHZhbGlkYXRp
b24gYWdhaW5zdCBhbGwgb2YgdGhlIHBhZGRpbmcgYW5kDQo+IHJlc2VydmVkIGZpZWxkcywgd2hp
Y2ggbXVzdCBiZSB6ZXJvLCBpbiBhIHNlcGFyYXRlIGNvbW1pdC4NCj4gDQo+IHYyOg0KPiAgIFJl
bW92ZWQgZXh0ZW5zaW9ucyBjaGVja3Mgd2hlcmUgdGhlcmUgd2VyZSBub25lIG9yaWdpbmFsbHku
IChKb3PDqSkNCj4gICBNb3ZlZCBleHRyYW5lb3VzIHBhcmVudGhlc2VzIHRvIHRoZSBjb3JyZWN0
IHBsYWNlcy4gKEx1Y2FzKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoZXIgU25vd2hpbGwgPGtvZGU1NEBnbWFpbC5jb20+DQo+IA0KPiBDaHJpc3RvcGhlciBT
bm93aGlsbCAoMik6DQo+ICAgZHJtL3hlOiBBZGQgZXhwbGljaXQgcGFkZGluZyB0byB1QVBJIGRl
ZmluaXRpb24NCj4gICBkcm0veGU6IFZhbGlkYXRlIHVBUEkgcGFkZGluZyBhbmQgcmVzZXJ2ZWQg
ZmllbGRzDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgICAgICAgICAgICAgIHwg
IDYgKysrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9lbmdpbmUuYyAgICAgICAgICB8IDE4
ICsrKysrKysrKystLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMgICAgICAgICAg
ICB8ICA0ICsrLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYyAgICAgICAgICAgIHwg
IDMgKystDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyAgICAgICAgICAgfCAgMyAr
Ky0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeW5jLmMgICAgICAgICAgICB8ICA0ICsrLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgICAgICAgICAgICAgIHwgMjIgKysrKysrKysr
KysrKy0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYyAgICAgIHwgIDQg
KystDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfd2FpdF91c2VyX2ZlbmNlLmMgfCAgMyArKy0N
Cj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgICAgICAgICAgICB8IDM0ICsrKysrKysr
KysrKysrKysrKysrKysrKy0NCj4gIDEwIGZpbGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQ0KPiANCg0K

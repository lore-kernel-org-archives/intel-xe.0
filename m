Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A1CC47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 20:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD49110EA16;
	Thu, 11 Jan 2024 20:03:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBC110E9FA
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705003382; x=1736539382;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0sObCIqD6H8h1s4y6LlNwhhMWBvkoHp9tYl+qyk5+tU=;
 b=S9+q/JGeE3zLoAYzzwqQk7yJpu3TysTUVKQpns3EqNAna9/DjF3hILzw
 59N89V2qpcBCf/2PgmAywH99n4iPlyo7sg+6OFfTNIPC9xKeTNh4PyGtA
 i2pakJegQGEH1cUdeYKFnB8ipVwXt+AtCbweEbpBtCbVgmGoaAlURvXDP
 HsowOqcl0/5jMMEkC9ZKdNStxPIMAlC0zSU+sGV9WIlQYd5qfxPdQapwT
 NaHcDlJ0TthIhBjM5LcBHrDluJiHgRUVcgTl7/VRFw4Uvda92PdSzfPSp
 S+nKzC4XnjGKeQ07/PaYufDail0299wYVH1SWY8Q4e7a2vzoj6V0gL1Ia g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="465359295"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="465359295"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 12:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="873137362"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="873137362"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 12:02:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 12:02:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 12:02:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 12:02:58 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 12:02:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRGYKmyHMfq4+PY0CoIXt3to8yJSwLKK8Ro6GpBwwW5amYi3mE/Ab4WJe7iW38/aqXNgBnX9TRtClykVvxzdoecY/OLbLpjXzqASKO2vj9xWWGRErGjnOixScf4yd8pc1Dcq+qVKkBwnaQHE9YUfWwTsd7IH83bkafd88jxFb2tlOX2nsBIeq8j99QPZm0mMOoIp0nL7H/ZUufuvHZ74isRZYXp7EbullldVsoFwSd24pkfAfFLJsCbDQKT35My6JczbBbqN87i/Zi3B1786zNaLIBrRdK1mPFuuNTGuxo6/NhEBgsZ9dVj0kf8IjJR6CG5AvfFy1Zpji+ar5glgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sObCIqD6H8h1s4y6LlNwhhMWBvkoHp9tYl+qyk5+tU=;
 b=YezomZAb88BY1oP8BHPbg59bJoH71c+LQXSGqn5Dsu6IBx2ABu1EnAONsvG7+TxVbXCfA4SonRVDlF5HGhwnVHsi2rRuXCGGkPigZ9Q+DCoVebxUpY8sazHmtQFER8vxY704O+yV9ru2wyxatVaINvU/UQk21+elZtpGlRk55z1S30bWo73sJbcnfww5MMpliuU0pXvvAJ+jU8NefWPz35a9u98SVdI6TsgSumlSrpNcNHcCPQObrVoZayDiNf8jvmefCq5MDsiWBHu3scs3obtrwH9WTNisQFVoT1dzM632O2vRb5MvPF/Y1j1JewO2Qyj8KDm5JYMT+UB0hC1yyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA1PR11MB6992.namprd11.prod.outlook.com (2603:10b6:806:2b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 20:02:55 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f%3]) with mapi id 15.20.7181.018; Thu, 11 Jan 2024
 20:02:55 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/gsc: add support for GSC proxy interrupt
Thread-Topic: [PATCH v2 2/2] drm/xe/gsc: add support for GSC proxy interrupt
Thread-Index: AQHaQ14dWMn5iLDNQEKfj5XcDCv4t7DVC5aA
Date: Thu, 11 Jan 2024 20:02:55 +0000
Message-ID: <36c5bc13c191f34cfa6b091f8f4b73d855fed02c.camel@intel.com>
References: <20240110004416.1127942-1-daniele.ceraolospurio@intel.com>
 <20240110004416.1127942-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240110004416.1127942-3-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA1PR11MB6992:EE_
x-ms-office365-filtering-correlation-id: 7fcc2c92-5ba6-4684-61c3-08dc12e04d10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bGW8aZIJI+xc5Fa/+xb8WnauIoQl5K2Ew0hrdGorvHh/InvTAz5wQ5Ooobi/Vwcft+gUjphZl7Gq8/vASewNoZ7lfG5N1e4rnIEKSV4VMLar6b1GStlnWVaOr51xMQ59lzQ4rNJ1V8vWE0Ch77ygdwGJwa0KORX7KmDbSq+0XRCz/Q4e3sMGcQHOGeeaakNk6jmtwElTL9pvH+fYiW3bAAnwlztUTGE24ZGP+EsY8VLKxIylJB+OYOCXU5Kau7mxGlZJAaKYi8csprAvAWa2zuUjbm/wftETnpy6ITVEyoShrpg2UcDoIErlc8Bd1VDrPv8slXenqhbZpnvkZidx3oKpIZoqhc6f4LtnFnnsTTHxbWx8TkA0RjKMKyRcNHf0lF0b8ZpW1jjXzFIlO5kuhMp75nsEElJ/OFQ6JOlWNvK7HeDA++mlEBaBHwCEiftQdYUtMWfcIl8Q+CqtSR6IvytrwyE2Fq9zC+qxFNRDOBoUJHHSmZIsyEkQTMqeQn+zwUUXNF16lPAl33uB79ICNZc2oA47E1s93xvYQjsiUgRv96PwpWvrUltxH2IetOpeR0czWf0yTaeRXtRaH2Linb8aAVQlm65lK/WqFHIEKKsKAoZMFTl+esgcomlKGXMT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(83380400001)(316002)(2616005)(66446008)(6512007)(26005)(122000001)(107886003)(38100700002)(4744005)(8936002)(5660300002)(110136005)(71200400001)(6486002)(64756008)(4326008)(6636002)(478600001)(66556008)(6506007)(8676002)(66476007)(2906002)(91956017)(36756003)(76116006)(82960400001)(38070700009)(66946007)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akRMVXBHRFJRUDlub2J0TEEwL0JwTUZSUlVNWXRkSFRPMFJtUWtraGlaaDFU?=
 =?utf-8?B?K0Z4UG85TzZtLy9RQ0tXcElLN2NXMGhBeHFWVzN1TWFoWGlUVCt2RzNHWklt?=
 =?utf-8?B?VzI1ZExxRW00cFBHYWU3ZGw2UDFRZmJLNkRJbE0xRTcyekw4eFlHU2VmdDBW?=
 =?utf-8?B?aUhqYkhoazMxQldieUYxdks1ZkRxSjNLdGRZU2E5dlZySzhSYlFZNVZRSllJ?=
 =?utf-8?B?OUNIeEJ3MEFDNllFek83MUhpcUx6MU44ZmR6V1FqRnQvN1hyVENmTE9sdzZJ?=
 =?utf-8?B?TjY3bFdDSWFWUlZTcE1McFlSZDBLZU5CNzhTc0diNVU4UFRRTGdXcE45ODNC?=
 =?utf-8?B?akN5R2k1YTYyckFiNjBrdHZJUGhjUGdhTHFGb3JxNlRic2dGOC8xMmpFQ0V0?=
 =?utf-8?B?S3VSb2xCT3dOUm5vTElsOVZocDk1NlcvbGNnRzJxUXpDMFVwTGJYTWtDbmZD?=
 =?utf-8?B?alcwWHJtL1BZM0pYZ2pvTWd0aDR1SE9HL0QyR0IrVE9WS1IyMXgyeDAvU0Rl?=
 =?utf-8?B?MUNDUDFBRmZaRThoWHMxanRycm5DWU1GcGlnbGtndmZ6TjF0QVNhcXIzZkph?=
 =?utf-8?B?RGFBN3IrcVk1cjkyQjNsa2EyVHlHaUdTbjBHcm1YTU1OMDFlUXVzUE5obHdS?=
 =?utf-8?B?a1ZWRk5ya045ZVc2QTlZSFhzY244RVk3RE0yZUIwMkZJKzV2bnAyYnB5Wm1s?=
 =?utf-8?B?RG5UKyt5UHpDdDlBMzRUY0s4blNzM2ZoMys4dEpnMGNxQWVFdUxub0VBWnZH?=
 =?utf-8?B?UlFBdWN5WGhvK2tOMEc1TEVTbC9wTHRSazRIZ1hNR2VHUGRFalhvWGJ1akNF?=
 =?utf-8?B?cFdtNys4N20rSFVSSGVQd1JKWDRWUEthYnh5OUdTT0J4NXY0bkxJR3pJQU81?=
 =?utf-8?B?bXBicEtiWHgyQ2IyeDVWcFRyQnNqanA2SkVTQUIxaWFMTVZMbHErNnJzSXZD?=
 =?utf-8?B?a1QwRFh0Mkdtais4ZFluNTBRZndKbEtpbzVwK1UxRFJLMmZiNUZlZjg5QjZh?=
 =?utf-8?B?ZEx0WHVzM3kzUGE5eCtlQ013L1hPNGN5aGEvSTVUTXI4Q203ZEZLRHBZTDhV?=
 =?utf-8?B?ZGhRRVNQbHFjRjY4WXJJalhmUnI5a054Vzlzc1ZVRVRyNjhXRFZFZXQyS3d0?=
 =?utf-8?B?aWZ4N040ZWg3Z1J6ZDNaMHE0OFBJZHd0TlMwV1kveEw2RmJBS1Y0VmhXeDYz?=
 =?utf-8?B?RkU2c2xVd1k4M2Z6ZDk5UzV6eS9pRWdNZDdJM1V5emorUjB0UmJMV0t1TmtM?=
 =?utf-8?B?MFpYM0IyOFBHbzBmU2o4dng0Ym9TdUZzSjFJcGRnYTE3bzQ2T25taXRXbXVH?=
 =?utf-8?B?S3FJcEFCZUFkekVBa0svM0VGcUwxdVl6VkwzUS85S1JUcGMvcldDNGRNM0RM?=
 =?utf-8?B?cTBRZG9aU0NlcC9SMUV5SzRhVElDWFRFNVZaQ2FGNTVMSDlSU3c4M09lSUhn?=
 =?utf-8?B?U3Y3UEJjZWQwT3N2cm1CNFRTUDJkSFhnV0lobm50dy9MZElRWnc3LytqVkhT?=
 =?utf-8?B?Y2NnZUNYRDExYzd6TEFodlkyWFo1Rm9QMHFGRHY2MkZ2SytFREEyS1g5aWtH?=
 =?utf-8?B?ajJ5L3hROGlSZUd4eVJObnowZXoxRTJWMEorNVRBSGNqWHhDNWJvMTE1S2pz?=
 =?utf-8?B?aEZRNnZSMEdTcm5yVzI2YnZKYzFVYkZ4Nlp4UXpvUnQzcG0wV1NaV2NUeUpa?=
 =?utf-8?B?MHQxWEtjL1BGSi9xcUxHN1diU2FPVENhcnBUc1Q3QmNiT0JHVmFCWHZOcTEw?=
 =?utf-8?B?VGtkRHBNWE1EOGxxVGxmU0MzM2h2K2dHR1ByWWN6dGhNWWF6V2pMbGxkc2hN?=
 =?utf-8?B?VHJ2NmpPalIzckJwaTZmQktBQlpSemxVQ2hyUGZPY2tPc0tLcVY1ekdtTUly?=
 =?utf-8?B?Y2tqcW9FWklZZ05zMXp0SjJ3bkxLc2ZPVi80alI1Z2JLMGJBME1TWm5nSlc2?=
 =?utf-8?B?dXhNUk5HeWNNRWJpVjVSYWJvMFFnSUhTWk1XdDZwS1BTa1NiRlA5YU15ZUc3?=
 =?utf-8?B?TCs5OE1tQlNBUDBncXB2bExqTWVzZ1JaU1d4ZWxtRFFjd3FNMjNHQ1crQW44?=
 =?utf-8?B?N0poUWliK1ZEeGhWR0xTNzhwMkVCMzNsREhDY1ROeWVRSVpaeVFhakl2UW8r?=
 =?utf-8?B?a2pqTnVFMlhoNXlHZXFiWmtsc1JPUWJOcjZTVWJFY2dqR0RLUjRSUmpIa3NO?=
 =?utf-8?Q?FqD0Cwk9wvz643Yty8IPuZs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39862C42B1BB9647AFD51A04357A7238@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcc2c92-5ba6-4684-61c3-08dc12e04d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 20:02:55.4228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3WpWQQmZJWGAs0h6LTCTYJ6NWebd27DLr2vK6gd790jAgEm/rI2SSc+mDUiS+ijDAc6Wq+/+KDKEkAdImEv3FqzshvqaBV2dRG9tx80POQupG1Cs1yZkJBrkuvzxGp2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6992
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

T24gVHVlLCAyMDI0LTAxLTA5IGF0IDE2OjQ0IC0wODAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBUaGUgR1NDIG5vdGlmaWVzIHVzIG9mIGEgcHJveHkgcmVxdWVzdCB2aWEgdGhl
IEhFQ0kyIGludGVycnVwdC4gVGhlDQo+IGludGVycnVwdCBtdXN0IGJlIGVuYWJsZWQgYm90aCBp
biB0aGUgSEVDSSBsYXllciBhbmQgaW4gb3VyIHVzdWFsIGd0IGlycQ0KPiBwcm9ncmFtbWluZzsg
Zm9yIHRoZSBsYXR0ZXIsIHRoZSBpbnRlcnJ1cHQgaXMgZW5hYmxlZCB2aWEgdGhlIHNhbWUgZW5h
YmxlDQo+IHJlZ2lzdGVyIGFzIHRoZSBHU0MgQ1MsIGJ1dCBpdCBkb2VzIGhhdmUgaXRzIG93biBt
YXNrIHJlZ2lzdGVyLiBXaGVuIHRoZQ0KYWxhbjpzbmlwDQoNCkxHVE06IFJldmlld2VkLWJ5OiBB
bGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg==

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8669FE71087
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 15:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FAB10E012;
	Thu, 21 Sep 2023 15:08:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905F510E012
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695308890; x=1726844890;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wdZGcSSHzr/NjQwkG/a5pvSkz3tBLwyI9G4A0zj7CLY=;
 b=goOyyYrmEFfV8+fNPl8N0VUYRWvlv824ExcFbvPXb6/vjD9l8iAAtond
 tfCvnGYOlIp6XduV+XyFm5ccXpV+ft0t5Fdq/7iVy1dg58lZr8h266nF9
 nQ7c8gzZ6KKmeNvadxYWI+RUda0Y/QaWb9z56daeAqc6H1oLJl+z+m4YX
 aNs0G4WhtCo6lq6OMVd7L9eSe7rdTHj1VUqiKarlmnWhp9uDldSHz8j/j
 rAryHqCPX50DPgoIOYgp2e6UJpVYdR8HDiBLSl7fPgM+iFQWCvCZyYOGP
 RQInW7HEFr01p+3QNDjFHA7ntkBJIXBnkP8cr7HnXpCxIk+JeLa1SH/K8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="360794324"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="360794324"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 08:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="812687198"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="812687198"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 08:06:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 08:06:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 08:06:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 08:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itUvTAcoEwDbVrqHPqXCSH4Doyth2kkO/QxfMUOqDBQdcFrpFa2dBpKEUlSZolQ4+j8/6RUmiP5f/QSFFMUSVIG6liochxfvGfO9+1e19L9AZ+vEllS2IQt+69R9Gl9qSeG99/KN4uXzI+Eek58KyL3JvuGg4j5uQ8DlSzn/frOryoeHVhTDWObD0ZJsqAXaiKyCgAq6KZyb+4rZtAfLyUf/b255LWdJLlAzonkC7rne+UndluMIQIYL0DnrTIW69JyxF73GR90WnxQWg1kJhO6Q1+HreXr4TRpmOCThH4fBvVwgKszsJ0S7xdxIViZC0TmBdrSbhNHVRaSd6ODzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdZGcSSHzr/NjQwkG/a5pvSkz3tBLwyI9G4A0zj7CLY=;
 b=IOO+cgvuSKu27yF+taKfw/tZubHZSjCJvU3xbFt0xRXDo3S/yJh5mN0knCAvzy4Upv6MQfzxAm7qJYWBt0KD3KuJIcPKlb70N5pHtLh6KvvcZpUINR9ez+mRuO/ervFhr8BKV2iHtLn9z8SNjKbKXgyjdrA+DSFPLl10NZPk1S2X/Mn9xh5KIJBWQLf+6uO5/r9KllANvwFsha962gCmFrFBIyGXcMUzQBLITWB1wYd2BoD2tonF9SKFclQyXtwLh3SHEwBAzAMeLyC/Ui7iCBy8RbdknmnVuodT1rKkucuNA53ZtGAcBx3qC3cbEsnyFGyhv+u9yuldGy1knJ9H+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 15:06:25 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::e449:5321:ecc2:568c]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::e449:5321:ecc2:568c%7]) with mapi id 15.20.6813.018; Thu, 21 Sep 2023
 15:06:24 +0000
From: "Zhang, Carl" <carl.zhang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 00/17] uAPI Alignment - take 1
Thread-Index: AQHZ6wUYBUYR0sJUYk2okSkei+ENpbAk5+HA
Date: Thu, 21 Sep 2023 15:06:24 +0000
Message-ID: <PH0PR11MB5579513043AA7308CDC8C47687F8A@PH0PR11MB5579.namprd11.prod.outlook.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5579:EE_|SA2PR11MB4937:EE_
x-ms-office365-filtering-correlation-id: ac701d22-465a-42fb-647e-08dbbab452b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WPKNwuTgGJThuJIqEWJJ8VzpKCPZBnUgxzqT/UrqGkeuoFaF59/QQbNOoalqyCRX2KoSKFTmuXD/Gz5PthFony46YT6KlcLSQwa5kVQegXln7M9kj6oQcRi0H6isJwlqKcsM4KbKVbvFh3M5/svbmWj3Ivf8WEbMEq0EhG9yhk6KFL+GfKmwA5djHZBoivrDSMkDqVCvbhAEtyciFH9Gj/MDt9fVxBFhjPpMHexUulqYsUnG7VqusQo1OlLlGFq9d8QmAD7ltBpgTZ7symXc9Q5ZwYCg+AQHQbZFaxzrKr1P9fOXxzkA+tJiRmEV/sHhoncEie4PWSnQRnO9ZLLPr2rwEDzFIeIokGLhGxRj0mlz5IDCRDHvi2pPENc5RW2fE1yPt9IkcNcbOeVWnGYdnl8f61wi4UVCZxETVD2jpSx8q/m0j5J0YwYwlPYiKFgSj2yC/UXUzdfpRD+No0GrN707szFuMb3AYEEvaY3xI1aecR/PgWGk8OV50BMW17cqusCuBcPyY03uySABA9VAT8CaTHW/BQeQjzNtF02IuOMa4UNV4qi1wOppPFwbYIJ5VwtDNrna4ziFZ8nQPMdCf892b1+BNS8+7gCaBwjhOoG08y0ALc4bsSHT0mhc8nGMZemfZZMzdbxZnYsnU5IXiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(186009)(1800799009)(451199024)(53546011)(71200400001)(82960400001)(966005)(122000001)(8676002)(8936002)(4326008)(26005)(5660300002)(2906002)(55016003)(316002)(41300700001)(52536014)(66446008)(54906003)(64756008)(33656002)(86362001)(7696005)(9686003)(110136005)(6506007)(38070700005)(76116006)(38100700002)(66946007)(478600001)(66476007)(66556008)(107886003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGdaM3BvaWJzR3VKdzBIUEprd3Q0VFBpVURuLzRKMk15RjdESjQxcHBjdGlQ?=
 =?utf-8?B?L0xYQTUzN3ZlSEVmdVdCTXNpYVBlZzhrNHl1VFh6bDNkc0FQUGhEVVg3R0Rn?=
 =?utf-8?B?eWR4RGxyeHhxVmdEajlCeDlRMjBRNzJtWTNwNFE1VTVmWnIxYXpIaldURUJY?=
 =?utf-8?B?Y3JmRU9OcnprVVZUdnFuNUh3ZXdNK2VNNEhhWnFQNVFDNEpNWFRza25saWlQ?=
 =?utf-8?B?aHhSZ0dtb0Z4YlVQclFaczR3ZHB0UmplcFFKZXhQU3ovVDU0WkR6a2FJakVM?=
 =?utf-8?B?ZlRZNjg5UHI3UHY2SUI4VmYvNnVqYWhLLzdWSnZVdWc2aEN3ZUNibXF1TE9L?=
 =?utf-8?B?L0k4UkNQMzdkOHI4K3RsdjFndTVsLzh0Z3ViSWNPdXlPcHFzSHpmamJ3eDhP?=
 =?utf-8?B?bXJkUm8vS3hsdjFrOWxVK2FyRlM3M2VhUFVRYmp0TGpZeVY1RGFKbmZYeTV5?=
 =?utf-8?B?K3dVTUFrL1N6QjAzQmFnVDdjZFVWV1ErbkFTV3BtQ3dBOUcycmljSnQycjZr?=
 =?utf-8?B?L0FzU1RVd3JXL3V0UHVuNXFBSW9FZHZmNVMwRGNYUEtTV2lHLzhuWFpqVm4v?=
 =?utf-8?B?N2M4U2dJK2d3OE1weWZwR3ZwRmYyVHBhWFYxMHlTKzRUcmxTWktNenRUQml5?=
 =?utf-8?B?Q1dxSEpWMzdoNmlqY2pZMEpiV3J5YytGRzZEbWkweEVOcStFbjVsMGx5bjBJ?=
 =?utf-8?B?K3FtUGx0UlNzd2lwTmRFekc0L005Smk0UUNRYjkwcDdqU01FK0dLMVJrWTQy?=
 =?utf-8?B?N3VyT0c4OW5URFR6b0hBVllGZ2hnSzRNTEk3bjZKc1dWVEs4K2JVZ25MUlZS?=
 =?utf-8?B?RFFDZWZDV1M2M3ZsY2xZYkxHazhBKzV4RmxsQ3UxZjV0MnZSanM4WXo5TUhO?=
 =?utf-8?B?QXRIUS96ZzM3dWdrRzVJbVlKZVJWZVBjSUpHNkVMeldaTmlZbVl3cjdzT2xZ?=
 =?utf-8?B?QzFEWmkxY2NubHFZRzFvUnFBMnZzV3luelRXWmk5bHg3K09PdkJuU0d2cEsy?=
 =?utf-8?B?M05xN1ZSb3BIeVZpNHp2Z1VNRXJHT0M5UFVKLzgwZiszYmFZS3FuaGVSOFJR?=
 =?utf-8?B?WUxQd3RoR2E2bzd3RmR4c1d6bWVZdk5wcUZ2VVNXN0hoaDUyUGdxUDB3TGFu?=
 =?utf-8?B?V3ZOZHJxdTduWjl5Q2tCb2lDT1BqR0xjSDd6WDhWeFVFN3lGVGhqZjJwbUN0?=
 =?utf-8?B?KzJZZ3hZMWFqSWpiTUpJZFN6Mm1keWlPamwwUnFOd1Z2RlA1b0xBeDJpYkd2?=
 =?utf-8?B?NlBWbUx5MElUYVduMHJ2UFZXT2xVMGdQNHpaL3lsRXdOajY4QW1FK3ZVSW43?=
 =?utf-8?B?UjJIKzZGTjNsOWtmSGVYYUl3NVdOQnN3MUgyZjVTWUUvM0JnaDcvODV3a0Jh?=
 =?utf-8?B?YkROVTZZbHFGOE0wbVArSjNibkIrUlJTRVZBTlhCMUtTenFpaXM2c3VSakpu?=
 =?utf-8?B?WER4OHRQcnJiMWdIYk50d2VzVGZpRndwNjFqbi9FQSsyZ0F3T1F1emhhMG5X?=
 =?utf-8?B?ckhkTUdpV2ZtTmZPTDA0MEdVMmZlRTZ2VXZVU1hmMWVXVHlsd0J5WGNXNGN1?=
 =?utf-8?B?OFN6NUxKeDRkVEpyOEdwK2JXSXFsaXpoUXREckw5MHZ0OGlXbENYblhwVWdq?=
 =?utf-8?B?bXQzVGF0MjBTZy9WblRoQkVZWnlRZnl2Q0o4MnZIQUd1RHozVDFjUEtUb0U4?=
 =?utf-8?B?OEdTVW9QL3lzYkdGdFZlQ2lDM3B1RHFyRUJyTUdTR3NNbzdvYlBFcFhURjRi?=
 =?utf-8?B?eTllQy9lUWw1elQrOEl0Z1VJR2VJcU5ia1I4ek1ETmhVaEJTd0QvZFNWNGJX?=
 =?utf-8?B?TXdXTE1FR0dVTFZUWUZEemJTakNXQTBNWlU5YmU0T3VvdDBFYjhYU0xvU0hh?=
 =?utf-8?B?NXRrcWVhbkZOVHV4clpaRXFXUUNpMjJORE9Ydkh4ODd1dHZZV0IrbFZpQ3dZ?=
 =?utf-8?B?ei9oU2cxWmdUVmVGZWVrVU56ZGhEWmkyd013RzJ4UzZEancxbUhaZm9XYzZK?=
 =?utf-8?B?N1A0Y3p6OWNXWG5VNUhkbFpQa0RPbnpTaHVwWkJuRlNMNTJoM1VOQ3JNd1hH?=
 =?utf-8?B?UisrclBUZnlxMlRHejRURlVjN1k3M1lWaU5ISlEvQXZ0RC9NTFh1S3VHZXQw?=
 =?utf-8?Q?8Cg9fEah7FXWXHmul0VMD9fOX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac701d22-465a-42fb-647e-08dbbab452b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 15:06:24.7134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rr9J2NFaEQQiCajQYEXh053NalTYRw81V+echcGsBXRme48CGn2B5Od0+BuHCrTDVo4Bc+3etiohETnmkSGmdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/17] uAPI Alignment - take 1
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
Cc: "Kopryk, Kamil" <kamil.kopryk@intel.com>, "Hazubski,
 Filip" <filip.hazubski@intel.com>, "Chaberek,
 Jakub" <jakub.chaberek@intel.com>, "Yu, Effie" <effie.yu@intel.com>, "Dunajski,
 Bartosz" <bartosz.dunajski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SGkgUm9kcmlnbywNCkhhdmUgYSBxdWljayByZXZpZXcsICBzZXZlcmFsIHF1ZXN0aW9uczoNCjEu
IHdlIG5lZWQgYWRkIHBhZCBpbiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlLCBpbiB0aGUg
ZnV0dXJlLCBtZWRpYSBtYXkgbmVlZCB0byBkaXN0aW5ndWlzaCBzbGltIHZkYm94IGFuZCBmdWxs
IHZkYm94ICwgb3Igb3RoZXIgc3BlY2lhbCBjb25maWd1cmF0aW9ucy4gDQpTbywgcmVzZXJ2ZSBv
bmUgd29yZCAgc2hvdWxkIGJlIHN1aXRhYmxlIGZvciBmdXR1cmUgdXNlLiBhbmQgdGhlbiB0aGUg
c3RydWN0dXJlIGxlbmd0aCBiZWNvbWUgOCBieXRlcy4NCg0KMi4gIG5vIGNsZWFyIGRlc2NyaXB0
aW9uIGFib3V0IERSTV9YRV9ERVZJQ0VfUVVFUllfSFdDT05GSUcsIGV2ZW4gd2Uga25vdyBpdCBp
cyBpbiBpbnRlbF9od2NvbmZpZ190eXBlcy5oDQoNCjMuICBhYm91dCBxdWVyeSBHVCwgaWYgdGhl
IHRoZXJlIGFyZSBtdWx0aXBsZSB0aWxlICwgYW5kIGl0IGlzIHN5bW1ldHJpY2FsLCB3aGljaCBv
bmUgd2lsbCBiZSBNQUlOLCB3aGljaCBpcyBSRU1PVEU/DQoNCjQuIG5vIG1ldGhvZCB0byBxdWVy
eSBIdUMgcmVhZGluZXNzIC4gDQoNCjUuIFhFX1FVRVJZX0NPTkZJR19OVU1fUEFSQU0gaXMgb25s
eSB1c2VkIHRvIHJlcHJlc2VudCB0aGUgbnVtYmVyIG9mIHF1ZXJ5IHR5cGU/IEFuZCBpdCBpcyBh
Y3R1YWxseSB1c2VsZXNzLCBubyBvbmUgc2hvdWxkIHVzZSBpdC4NCg0KNi4NCisvKiogc3RydWN0
IGRybV94ZV9leHRfc2V0X3Byb3BlcnR5IC0gWEUgc2V0IHByb3BlcnR5IGV4dGVuc2lvbiAqLw0K
K3N0cnVjdCBkcm1feGVfZXh0X3NldF9wcm9wZXJ0eSB7IA0KSXQgc2hvdWxkIGJlIFZNIHNldCBw
cm9wZXJ0eSBleHRlbnNpb24gKCBYRV9WTV9FWFRFTlNJT05fU0VUX1BST1BFUlRZKT8NCg0KcHMu
IEkgc3RpbGwgbm90IGNsZWFyIHdoeSB3ZSBuZWVkIGV4dGVuc2lvbiBmb3Igc2luZ2xlIGJpbmQg
b3BlcmF0aW9uLiA6KSANCm1heSByYWlzZSBtb3JlIHF1ZXN0aW9uIGluIGZvbGxvd2luZyBkYXlz
LiANCg0KdGhhbmtzDQpDYXJsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2Rh
eSwgU2VwdGVtYmVyIDE5LCAyMDIzIDEwOjI1IFBNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IEhhenVic2tpLCBGaWxpcCA8ZmlsaXAuaGF6dWJza2lAaW50ZWwu
Y29tPjsgS29wcnlrLCBLYW1pbA0KPiA8a2FtaWwua29wcnlrQGludGVsLmNvbT47IENoYWJlcmVr
LCBKYWt1YiA8amFrdWIuY2hhYmVyZWtAaW50ZWwuY29tPjsNCj4gRHVuYWpza2ksIEJhcnRvc3og
PGJhcnRvc3ouZHVuYWpza2lAaW50ZWwuY29tPjsgU291emEsIEpvc2UNCj4gPGpvc2Uuc291emFA
aW50ZWwuY29tPjsgWXUsIEVmZmllIDxlZmZpZS55dUBpbnRlbC5jb20+OyBaaGFuZywgQ2FybA0K
PiA8Y2FybC56aGFuZ0BpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMDAvMTddIHVBUEkgQWxpZ25tZW50IC0gdGFrZSAx
DQo+IA0KPiBBcyBhIHJlc3VsdCBvZiB0aGUgdUFQSSByZXZpZXcgZWZmb3J0cyBzdGFydGVkIGJ5
IFRob21hc1sxXSwgd2UgaGF2ZSBpZGVudGlmaWVkDQo+IG1hbnkgdXBkYXRlcyBvbiBvdXIgdUFQ
SSB0aGF0IHdvdWxkIGxlYWQgdG8gYnJlYWthZ2UgaW4gdGhlIGNvbXBhdGliaWxpdHkuDQo+IFdo
YXQgaXQgaXMgbm90IGFjY2VwdGFibGUgYWZ0ZXIgd2UgYXJlIG1lcmdlZCB1cHN0cmVhbS4gU28s
IGxldCdzIGJyZWFrIGl0DQo+IGJlZm9yZSBpdCBpcyB0b28gbGF0ZSwgYW5kIHN0YXJ0IHVwc3Ry
ZWFtaW5nIGEgZ29vZCwgcmVsaWFibGUgYW5kIGNsZWFuIHVhcGkuDQo+IA0KPiBNb3N0IG9mIHRo
aXMgd29yayBvbiBwdXR0aW5nIHRoZXNlIHBhdGNoZXMgdG9nZXRoZXIgZm9yIGEgc2luZ2xlIHNo
b3Qgd2FzIGxlZA0KPiBieSBGcmFuY29pcy4NCj4gDQo+IFRoZSBJR1QgY291bnRlciBwYXJ0IG9m
IHRoaXMgc2VyaWVzIGlzIGF2YWlsYWJsZSBhcyB3ZWxsWzJdLg0KPiANCj4gWzFdIC0NCj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzg2M2JlYmQwYzYyNGQ2ZmMyYjM4YzBhMDZiNjNlNDY4
YjQxODUxMjguYw0KPiBhbWVsQGxcDQo+IGludXguaW50ZWwuY29tLw0KPiBbMl0gLSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA5MTkxNDIwMDAuOTEzNjMtMS0NCj4gcm9kcmlnby52
aXZpQGludGVsLmNvbQ0KPiANCj4gQXNodXRvc2ggRGl4aXQgKDEpOg0KPiAgIGRybS94ZS91YXBp
OiBVc2UgY29tbW9uIGRybV94ZV9leHRfc2V0X3Byb3BlcnR5IGV4dGVuc2lvbg0KPiANCj4gRnJh
bmNvaXMgRHVnYXN0ICg0KToNCj4gICBkcm0veGUvdWFwaTogU2VwYXJhdGUgVk1fQklORCdzIG9w
ZXJhdGlvbiBhbmQgZmxhZw0KPiAgIGRybS94ZS92bTogUmVtb3ZlIFZNX0JJTkRfT1AgbWFjcm8N
Cj4gICBkcm0veGUvdWFwaTogUmVtb3ZlIE1NSU8gaW9jdGwNCj4gICBkcm0veGUvdWFwaTogRml4
IG5hbWluZyBvZg0KPiBYRV9RVUVSWV9DT05GSUdfTUFYX0VYRUNfUVVFVUVfUFJJT1JJVFkNCj4g
DQo+IE1hdHRoZXcgQnJvc3QgKDQpOg0KPiAgIGRybS94ZTogRml4IHhlX2V4ZWNfcXVldWVfaXNf
aWRsZSBmb3IgcGFyYWxsZWwgZXhlYyBxdWV1ZXMNCj4gICBkcm0veGU6IERlcHJlY2F0ZSBYRV9F
WEVDX1FVRVVFX1NFVF9QUk9QRVJUWV9DT01QVVRFX01PREUNCj4gICAgIGltcGxlbWVudGF0aW9u
DQo+ICAgZHJtL3hlOiBSZW5hbWUgZXhlY19xdWV1ZV9raWxsX2NvbXB1dGUgdG8NCj4gICAgIHhl
X3ZtX3JlbW92ZV9jb21wdXRlX2V4ZWNfcXVldWUNCj4gICBkcm0veGU6IFJlbW92ZSBYRV9FWEVD
X1FVRVVFX1NFVF9QUk9QRVJUWV9DT01QVVRFX01PREUgZnJvbQ0KPiB1QVBJDQo+IA0KPiBSb2Ry
aWdvIFZpdmkgKDUpOg0KPiAgIGRybS94ZTogS2lsbCBYRV9WTV9QUk9QRVJUWV9CSU5EX09QX0VS
Uk9SX0NBUFRVUkVfQUREUkVTUw0KPiBleHRlbnNpb24NCj4gICBkcm0veGUvdWFwaTogRG9jdW1l
bnQgZHJtX3hlX3F1ZXJ5X2d0DQo+ICAgZHJtL3hlL3VhcGk6IFJlcGxhY2UgdXNlbGVzcyAnaW5z
dGFuY2UnIHBlciB1bmlxdWUgZ3RfaWQNCj4gICBkcm0veGUvdWFwaTogUmVtb3ZlIHVudXNlZCBm
aWVsZCBvZiBkcm1feGVfcXVlcnlfZ3QNCj4gICBkcm0veGUvdWFwaTogUmVuYW1lIGd0cyB0byBn
dF9saXN0DQo+IA0KPiBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgKDMpOg0KPiAgIGRybS94ZTogRml4
IGFycmF5IGJvdW5kcyBjaGVjayBmb3IgcXVlcmllcw0KPiAgIGRybS94ZTogU2V0IHRoZSBjb3Jy
ZWN0IHR5cGUgZm9yIHhlX3RvX3VzZXJfZW5naW5lX2NsYXNzDQo+ICAgZHJtL3hlOiBDb3JyZWxh
dGUgZW5naW5lIGFuZCBjcHUgdGltZXN0YW1wcyB3aXRoIGJldHRlciBhY2N1cmFjeQ0KPiANCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyAgICAgICAgICAgfCAgIDEgLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYyAgICAgICB8ICA5OSArKystLS0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaCB8ICAgNiArLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmggICAgICAgICB8ICAgMiArLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX21taW8uYyAgICAgICAgICAgICB8IDEwMiAtLS0tLS0tLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyAgICAgICAgICAgICAgfCAgIDQgLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgICAgICAgICAgICB8IDE4NyArKysrKysrKysrKysrLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jICAgICAgICAgICAgICAgfCAyMjEgKysrKyst
LS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaCAgICAgICAgICAgICAg
IHwgICAxICsNCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgICAgICAgICAgICAgfCAy
ODAgKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gIDEwIGZpbGVzIGNoYW5nZWQsIDQwMiBpbnNl
cnRpb25zKCspLCA1MDEgZGVsZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjQxLjANCg==

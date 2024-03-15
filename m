Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEE8C54E66
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 06:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D75B10FA41;
	Fri, 15 Mar 2024 06:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnOrvyv7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBD410FA41
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 06:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710484689; x=1742020689;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sTi+xE+G4XnUVeem1ZQN+P0DYl80mLkV0IP8uCh9IqI=;
 b=DnOrvyv7b5DEvUpR4g1JWeyeZecD+S+zpk+5r1PCoyze+e06cZ2aPbDb
 gvLelHINx35q9/DQDf5IVc/wnq/7yWAOTt55XTGJ1rt4EbXfQeM+LGkyf
 Y4cgZzxkj9g1Vz8yj8sB3Y4RBw8YyfxC1qGa2dGrURnJSf5s+cC8XS1TW
 uA2fZWLoQVi/OoUUeA/bCd7wuFdNzzQZmcF8K4iKNaRVV6HJRnmSybOlJ
 JBi69Pz929nMMfTRh/2HYKxyAELY2zmCg00kHupLGQE0Otqbs6EC97ew9
 CM2tiCTFAYOsikX/asoHRggJCmsu2pDByuUDcdAa3sAHSUQdmXUAEX15K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16066150"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="16066150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="17258198"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 23:38:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 23:38:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 23:38:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 23:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yu7W7eIk1vSuYBxCeaBXEPLzYp3vqDnaCc19xukv02DbOkRG3lgf+lzzgihVP26q2fQIMyKyRS9D2k/Y4nRTh7NiHZ0fii4n0NFvqIBnkAAkQFWGv3RbMsIF0yCymZPyVIcG5erXK+ka41zopxzovAr8U/tnKW7HeJu21QJiL6dCHDk4jgoucYKQxHsICr52BYozHnke5Bcx7063X7X+NvCCJakogNSPe4xapQJPcMpwnAml6/6d01US9i0nMDsTQPeqJgYGRi/CjxLVOZ99vjBw85RIcuiH60bAQ8eiCK/WeUhwuDZXO/CyaAYFa70nZcvfHIs2Tr7nogaTnWEubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTi+xE+G4XnUVeem1ZQN+P0DYl80mLkV0IP8uCh9IqI=;
 b=jP+inf0Gb/idTCVexGUq6P4fAJngdV5HFVYGcKpU4EsDGNhKvrRW+jjoqkeGjyP8FDjPvDx9igyarrtpunCJYCuGxfAEO7PnGNbseOrmaXbMU8MIcAMMI9PHaP0sg7UXVybyzYr2WkQ+DoNwnE8FQLmsIHL5w+PTWvEC6cS06ML0v3DfWKZS+D6k5PU/2JYkkovDC1v8elAgsXj8LjAbaKBCRNbGj+8Bk+XLqjYFHLijhBmAsM7ugXuIffIcVPjUC1EQq4Lb6mv5FGEklVodyFLoo4Ng9ihoZu/FQpS9N+kpW0E0xkb4MTMc0VBNIa2RTCHrD0jflcA4IrVFHJJS5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5)
 by DM4PR11MB6263.namprd11.prod.outlook.com (2603:10b6:8:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Fri, 15 Mar
 2024 06:38:03 +0000
Received: from PH7PR11MB7073.namprd11.prod.outlook.com
 ([fe80::6424:214a:9ed9:864a]) by PH7PR11MB7073.namprd11.prod.outlook.com
 ([fe80::6424:214a:9ed9:864a%3]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 06:38:03 +0000
From: "Musial, Ewelina" <ewelina.musial@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBDSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS94ZTogUmVmYWN0b3Ig?=
 =?utf-8?Q?BO_flags?=
Thread-Topic: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVyZSBmb3IgZHJtL3hlOiBSZWZhY3RvciBCTyBm?=
 =?utf-8?Q?lags?=
Thread-Index: AQHadi578NxLR6UAlka9jCUrkLEZM7E4WX0A
Date: Fri, 15 Mar 2024 06:38:03 +0000
Message-ID: <PH7PR11MB707380E1B39BB7D3E4C3210593282@PH7PR11MB7073.namprd11.prod.outlook.com>
References: <20240314052619.2628396-1-lucas.demarchi@intel.com>
 <171039791262.753907.1073892033267196048@8e613ede5ea5>
 <lvcwvxxew4wcylvs6e2hs7jcjuiyx222ufhuk64heypauvqs5r@3vav2uii3cn6>
In-Reply-To: <lvcwvxxew4wcylvs6e2hs7jcjuiyx222ufhuk64heypauvqs5r@3vav2uii3cn6>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7073:EE_|DM4PR11MB6263:EE_
x-ms-office365-filtering-correlation-id: 8c975572-522f-4144-bc91-08dc44ba772f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MYa1jqVMSIteyjzKPRLhN+FJGouAIMlxCCc1wUbVruqI8HQhLPsJCLM3UExG8Jru+ObPCxG+E68FWtz8NpRgFR00SCmbfT260GE99c5MYn+xXeA5xKPVtfzY/Tts0GYti7cTBer40l5YbQox1ZAqZHr8vVaxvncGKVRbfTsEn2a/+eIg8LqkVR4yLciKl35J7oJpHwxtSumDiPfi/QKocqFloUanW8ZpC3MV2iRBxEcgtcFNeSUSSiMCWakIKx4p9Yw72Uy1nJ7HJS6uhgQrA02GXa2lklsXnQoP3WqrxeO2O4mDlmWnuRPbqlYk8pfU7wJPLa0oid1LWvho12w6PtEEQ6KrJ9M1CV5ISfubRQBqvwZ+I9A2/6dgeeU2Kua5JQvbe6qylyJVOdszRPXLKKL+yytm+24dUnlCfxjsw6CmdL8JTpywYlwc6jkFr+HNwqcfK5WZCkCGLWEj01jbhTuu/h05ZVsPwsLCQwkAVbT45pI5JSM2YcMcnqDzuJclZmtkmejQ88y1q6KbcwwlobaHFKbXRihbBfmwEdHRoutDyytLgTxshBR6cnxQWBzXDgDHMQcSMLoDbO5PJCZULxBywDiKIL/LDSNivzmNJwAshz9qzBjTxLcRcU2yEqflI+zu7Xe+Yig6s8w6q6Bdg+SgwIlPtVd8RWhtNLCj1YY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGsrR2lqaVZXTHhoZ1VXSDhYNHk4OVlQYTQraWloODRvVE5XRUoyV1BoaE9i?=
 =?utf-8?B?eEFad28weW5ic0czYWpxeFp3T3BGZnFXVnpWM2tqN1VLUEVjY1lwU29NMHlJ?=
 =?utf-8?B?eUtTMytyaDNHTzJlUGlKcGNURFJ3NDhjQkwzQzFxdmU1SjJ1K1E3TUlCQTNn?=
 =?utf-8?B?NlhwY3VxLzdBeWllbVNmeFZoUzNCS3cvcGg3RG82YXl2cXlPM05FQVJqd0lH?=
 =?utf-8?B?MHBkZWNHQUxPUnFCQ1psdEJzVlFNTlZrVnNaMkhCelFtd0U2bUt5c0FGR09V?=
 =?utf-8?B?UUwrdTlPTHFvVENReis4VXFtZmp0bmJ0TS9oT0YxTTNOUGR6bFptOWNJZmFY?=
 =?utf-8?B?ZzJUcUY0b2h5NjM0aDNpWlpxbitTSnk0bTgyR0d3NjZzakczR3NaZFNtNjNq?=
 =?utf-8?B?b3k3a2QyaXN1aGZLcTd1QTdubkp2ZFVYTWlmOUMyRzJjY09NTWpiNFhVUDQx?=
 =?utf-8?B?L1lIa1NXY3IwU0pzeC8rTGVKbGJQRVdYa2lJc2VpMjRDWXk2Q1ZQSUd2VWJS?=
 =?utf-8?B?QUhrMnpINW5zUlZtcGJjL29ORzNMTDZJRktjRGdKRzAwVXdXbk5iOWJCb1I0?=
 =?utf-8?B?ckZDL2haQ0hjMlAzc1VaTTBYZE1yWjZNRVhPd1FRV3JhOCtvOXJlZkNKMjcz?=
 =?utf-8?B?aWJUMTlGUVAvV3p4TjZxczlEdmR4ckRRY2lRUlViZ240TEVQdFRUYXR2eXRi?=
 =?utf-8?B?NXozc1cxZUExQmxwWnFjQkYvaHNNZXlDZTFKZEMxL0hrZTg2VElaK21jcGo0?=
 =?utf-8?B?eHVWbFFDd0J6ZUVRVi9UcjNmY1hSd3JYcFBKMTZkT2dPRlhhdE4ycnJ0czky?=
 =?utf-8?B?RjFGNlpSbVgvYkNwL0tjcWEyd3RpQWREY1UwZ3NOZWtYdzRsMmROcWM5c1Fw?=
 =?utf-8?B?N2I4UW9qNXM3N1NXMExDRFRFR3ViVTFBY3Znc1NmOVl1SWt4T2RNVWJGMFky?=
 =?utf-8?B?bWsrMUxZTnFTbDVkQ0YzWGtwaU4vRFE0bkRnbWV2QUxIVWJBenZsUElJaFMz?=
 =?utf-8?B?WElwY2VFRnNIK1FIL3BHWjlKdlp1U3dNTDZtaUIwWFg5TTNJRWpqYTRQWVFk?=
 =?utf-8?B?SWF0Tk9uc1FadkZRRHovZlRsR285YzV4dnZ6ZjFDMWpRMWJpcDNSa2QzOCtJ?=
 =?utf-8?B?bE1iVlJTaitRbGZoYktjNnJ0R1NBRU03dWw5eFp2eWdYc09oTzNwT3lScUlR?=
 =?utf-8?B?TVdmR2tXU05iRS9Sam5SWU91aE51NFJ2RmtwVHo0NlZldHZvUXd2MTUwVU5D?=
 =?utf-8?B?aFBLWFh2YkxveWl1T3ZBZTBpTldYTUVCenM5ZlpVaXBDVG1OWldRUUVuamNh?=
 =?utf-8?B?aGs0OWQyaWthZnpRTkVqdVBnd0UySzdXaWhodG1CUnYwYnpRbTNYSWM0YUd5?=
 =?utf-8?B?bzkySVVxLzlFSTU1RjhTUklDQ0EzYUx3R1ZreGk5WUQ3QnZXM01SMDZYc2JG?=
 =?utf-8?B?ZGlmY2RHdTFEWGZLWmRIZFNxczRzdlhyOGJGZVMvK1VWcS9ZemVZZDBUWVJC?=
 =?utf-8?B?N0Vad2c3R1FnRmptN0orNkh2QmNweGRRZXZWUXhRaEFIZUZTV3g2VzkxQkxY?=
 =?utf-8?B?MHVWb3NwM09BanNpd2lVZjJTMmdMMXFGNFdYbGdOQmZwN29zQnhGRnlSY1Vr?=
 =?utf-8?B?QzBWbGdrQlB1dStEbG9ReWVvYXlOL2hXOUR4WUMvRUhqdlFaamlTdm8rdVRG?=
 =?utf-8?B?d2VaZm1IdEVTdzhtVmZpM0VmSGNZd3NEVElJSENuYy9ybWxURXoxZmIwNGtu?=
 =?utf-8?B?RXFrRWNaTVR5Z3N5OUg5VmNXK0FJZThjU3BzbjJ1NjFHZDlwNGZqb3lxamtC?=
 =?utf-8?B?c3RMSkZhK0Npczc1dzJuL3J4NkNDK2lZc0RKSEloeC9UU0ZnVkhTOE0rQXRk?=
 =?utf-8?B?S2JycUtRNjJtb29mZDBNNXErL3RKYmZxbWlpazZoeTJpaVFxSm41cU1nOC9o?=
 =?utf-8?B?MWxuQVdxWWFlQXRLSEo4bk8rTUgvblFyOGUrbkJQcWtIUlYycmJhWHhERDUx?=
 =?utf-8?B?L0psdGtoUW5kMlBjQ1lwZ3duVTYyQ1djTytvZHV1Y21MRFN3ZjI1bzg1d3pH?=
 =?utf-8?B?SENLQUpadWpaZ3k4bC84TXFoL25CcGEySUZEZG1NNHNpVFloRy9iWkRBN05w?=
 =?utf-8?Q?jHLkEs3PqIPFhFwH2nmek+MpM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c975572-522f-4144-bc91-08dc44ba772f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 06:38:03.3412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yd7CY/9J7AlyrPaip5Aep/WGIgYU9l/wcMSwJw3Ab9fKEw/axr9QWE8eE+S4R0JDZgdyGo1RkDOaRQ1xsL35PcIj1rNGX6R1EGPayBrmY6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6263
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

V2UgYXJlIHJlcGxhY2luZyB3aG9sZSBrZXJuZWwgYW5kIHJlYm9vdGluZyB0byBpdCwgaWYgaXQg
cHJldmVudGVkIGFsbCBtYWNoaW5lcyBmcm9tIGJvb3RpbmcgbWF5YmUga2NvbmZpZyBhbHNvIGNo
YW5nZWQgbWVhbnRpbWU/DQoNClJlZ2FyZHMsDQpFd2VsaW5hDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBEZSBNYXJjaGksIEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5j
b20+IA0KU2VudDogVGh1cnNkYXksIE1hcmNoIDE0LCAyMDI0IDU6NDIgUE0NClRvOiBpbnRlbC14
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBNdXNpYWwsIEV3ZWxpbmEgPGV3ZWxpbmEubXVz
aWFsQGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiDinJcgQ0kuQkFUOiBmYWlsdXJlIGZvciBkcm0v
eGU6IFJlZmFjdG9yIEJPIGZsYWdzDQoNCk9uIFRodSwgTWFyIDE0LCAyMDI0IGF0IDA2OjMxOjUy
QU0gLTAwMDAsIFBhdGNod29yayB3cm90ZToNCj49PSBTZXJpZXMgRGV0YWlscyA9PQ0KPg0KPlNl
cmllczogZHJtL3hlOiBSZWZhY3RvciBCTyBmbGFncw0KPlVSTCAgIDogaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMzExMjAvDQo+U3RhdGUgOiBmYWlsdXJlDQo+DQo+
PT0gU3VtbWFyeSA9PQ0KPg0KPkNJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gDQo+eGUtOTM4LTk2
ZTQ3ZTNmM2E1OTUyZTEwNGQ1NjM1Mjg3MmJlY2RjMDA0OGQyNmVfQkFUIC0+IA0KPnhlLXB3LTEz
MTEyMHYxX0JBVCA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQo+DQo+U3VtbWFyeQ0KPi0tLS0tLS0NCj4NCj4gICoqRkFJTFVSRSoqDQo+DQo+ICBT
ZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCB4ZS1wdy0xMzExMjB2MV9CQVQgYWJz
b2x1dGVseSANCj4gbmVlZCB0byBiZSAgdmVyaWZpZWQgbWFudWFsbHkuDQo+DQo+ICBJZiB5b3Ug
dGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNo
YW5nZXMgIA0KPiBpbnRyb2R1Y2VkIGluIHhlLXB3LTEzMTEyMHYxX0JBVCwgcGxlYXNlIG5vdGlm
eSB5b3VyIGJ1ZyB0ZWFtIA0KPiAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcp
IHRvIGFsbG93IHRoZW0gIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2gg
d2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPg0KPg0KPg0KPlBhcnRpY2lwYXRp
bmcgaG9zdHMgKDQgLT4gMCkNCj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4NCj4g
IEVSUk9SOiBJdCBhcHBlYXJzIGFzIGlmIHRoZSBjaGFuZ2VzIG1hZGUgaW4geGUtcHctMTMxMTIw
djFfQkFUIHByZXZlbnRlZCB0b28gbWFueSBtYWNoaW5lcyBmcm9tIGJvb3RpbmcuDQo+DQo+ICBN
aXNzaW5nICAgICg0KTogYmF0LXB2Yy0yIGJhdC1kZzItb2VtMiBiYXQtYWRscC03IGJhdC1hdHNt
LTINCg0KDQpOb3dhZGF5cyBkb24ndCB3ZSBib290IHRoZSBtYWNoaW5lICBhbmQgKnRoZW4qIHRy
eSB0byBsb2FkIHRoZSBtb2R1bGU/DQpIb3cgY2FuIGEgY2hhbmdlIHRvIHRoZSBtb2R1bGUgcHJl
dmVudCBhIG1hY2hpbmUgZnJvbSBib290aW5nPw0KDQpMdWNhcyBEZSBNYXJjaGkNCg==

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E748C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 05:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D4110E31F;
	Tue,  9 May 2023 05:46:58 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9276F10E31F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 05:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683611216; x=1715147216;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lCUeOeNUy0VVZPuEQEvn9yFYmHwakzY/RjOP50Iu3LM=;
 b=cpEomdD0oyIUHZLwJU5Vt1cUFT/wL36OxUchfZLwWuDmnWgGGcBR+Zr3
 NRcXBhhk+PsffvTiJ0VPeB4UoqYBCrijjFqFDjsUzr+4gyqQylzHnsdag
 GGjLmEzfQ98KYNUqUD9UU3uAum384z3QG0vdSFL4Y954EUtDJaChPJnU3
 +yDW12honDw/gwjAuSJNImTuioK7IKFHoNZorQN2Upsmccv+F8n3UjTFL
 a2C884DodXYswieISDSKt4yzFF6DjPBIAsg7KiHu2FWVFvyUvLERJ45qR
 AItjlzCMKTO+u6YQaD5kLm4WkuZd+tkQWhR+CDqMOdegvaae/04tlduYS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347276330"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="347276330"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="731554931"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="731554931"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 08 May 2023 22:46:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:46:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:46:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 22:46:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 22:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXNVi+czYH4HlC1SQuGPu6IQEYg3refGY/WmVmfoJENJGL6ldJT9nSxXuejNgy9GtOP/A1xHfhRCxftp+Y3RrpXUMbA8qlN/I/JN0jclx9nUl6vGFNjirLXchFw0AEJDWhrVnHERPwoAhTUre53TBLNgk3JonEWNewQLsUnNbx9GcXTnnQYconrPJeXlIY9C4X5n60h1SxoQw/ow201tvyDdtsEnxBMgRQU1x5aOKOSrvfTPy8OMVo4XV5Zd4taXhOyazCDyz+glOhbJX6qXxYKjWNnxvePvWdsSbIcOBI1AnWxzNr56XQJEETcyP2f/V+i5sMPsvQ0wdetWVwydLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCUeOeNUy0VVZPuEQEvn9yFYmHwakzY/RjOP50Iu3LM=;
 b=FHSNipXYTxS27IVywnwXxeAQA4sZ0jDjpFpB2NOoh1Q8Z2q+orG5itcJDJezCI+9De5gKMs/lz0o36HksMFSNigYioPj8iaoupe/4+Fj6AUk/r4Y1UV+/NfqyFBSoDVP/QHol41UPW9qvOpRjG869AEHy6oL73gDVp0n733BS7nk5RoSsOP7LTXJMAahe0BrUVk2iKUKg7Ag73GB/boRPV7IkrZevQfTJaWb2ihEaOmCLeGmoWFweqcTgGWT6659SDDZsQno3aF2R/fTThMV7f3Azrg+QbniAaFFIRL/EN1xTVFyrchUbycrhSF5ciASyPSMCXRyqUJqmaH+7T/2yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Tue, 9 May 2023 05:46:48 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::9f1b:8dde:50b2:1b4f]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::9f1b:8dde:50b2:1b4f%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 05:46:48 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH 1/2] drm/xe: Handle -EDEADLK case in preempt worker
Thread-Index: AQHZgjaO6e7DRzWMTkKsPO1gn1HSoK9RbtgA
Date: Tue, 9 May 2023 05:46:48 +0000
Message-ID: <0a9ebdbf622ae83936ddb7960d86d9998249bba0.camel@intel.com>
References: <20230509052419.28430-1-niranjana.vishwanathapura@intel.com>
 <20230509052419.28430-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230509052419.28430-2-niranjana.vishwanathapura@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3114:EE_|DM4PR11MB5261:EE_
x-ms-office365-filtering-correlation-id: 81463a98-9199-4d85-89d0-08db5050c7bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UJ9odmk/qPZJU+OmmfSIQmg9sNY6i7rHQAYX8leSvWpIy9nMDwzIYAYl4dpJNEkKFAkO0DoXF5x1n6aDhGDOYPEuQ9Z5XmkJvX+vqBH1XaIVaKwi6bWbKwIQIkRMCAoWQnYTkUIRKuX2ogf5DYKAI2dQfAWc6MaN3SHF75vCsm58tuwHqRnuVnV9zuUovrR+7TrM09HmTi9x0LVZ859zLS7N+XWrPNHAS3CdCG1Oysg9qvYOzEB3YP1w/fYA/pCKhLuPRbY+30qOGq+RUPUX9FDB5zPTXxysngkDgl6KiGDllvhs5UTDzU+h2FDDO4IFqJyy0IM+EuqTnoVJ6TqxHzucwquD0l55GoclXGNwCZIIvVD9KN9wQlSIzpqpeR/SOoxt0lAPWbjXe3VD6+SpGH2DQAtq5iX95VAxLGRzaL5itbS272IDk0oEtHyn/GrFsKmF77mJ0QPLDlkuHmCxI+Mrb1ovyNJgEA4DPFFXnprsZXdXX7ZMO7LzgFXpuWnFwWtyTRezIME2U/IFeJFjtL4ZXEnRPhHzzkbZtkJ3bN+b3/K8ZYz1CL1VpOeq/av0uLG6RM8gc5gdC0LnHJvsf9URQOC8H2Cr8MSsmC3JOiUmF+oCES25gSDVM06W2ExO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(36756003)(66556008)(38100700002)(2906002)(316002)(86362001)(8676002)(66446008)(6636002)(64756008)(76116006)(82960400001)(66946007)(5660300002)(66476007)(38070700005)(4326008)(8936002)(41300700001)(122000001)(83380400001)(91956017)(186003)(6506007)(26005)(6512007)(478600001)(110136005)(2616005)(71200400001)(6486002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFRCOXY4d1hqbk1pQlUzUzh1NnJOR2VxeCthaUhTVkxMYnJJci9Pc09LSW41?=
 =?utf-8?B?UmYwM050ZS91MnRuZEIxcS8wcUVZLzlUUUVsdXp5RXBiRWErYjJ2R0QyVkRD?=
 =?utf-8?B?UDUva09GdHhWaktrdUxSQnBjNWN6aFN1QzhwK2RpckRjNERqZVlVdEZaZThD?=
 =?utf-8?B?cDMzRDVETmZTRkZ1OUFpUDF6cjhVZnBXbm93bXhhZWExTlN0RzVhY0p6Nks4?=
 =?utf-8?B?WHhBeXRJZ1VITktQT1l4R3gxeHczSHFLQzJKbVRrUGluYzc4SmNtZ2RjMGFq?=
 =?utf-8?B?OHYyNk5FYmYvUy9wMW5lWTZ2TWNGMnFlYmEzRUdldklqWm96eGpsN3lybWU5?=
 =?utf-8?B?dXhkeVhGa3U1N1lEZU5yWThDR3luRUZvTmNGek5PaFNpTUtGeVBpV1hEVzBL?=
 =?utf-8?B?OFZDbHQ2OWVtalU0Z3dYMmRFWFFlckpaeUp2elhVTkt3QVFDalVwTVpraWRY?=
 =?utf-8?B?THl2VzZCc2w5OTMvVnlaMThISXlzd1ZMdUJuOFFRTmxESGRURG9QYXBHZEox?=
 =?utf-8?B?cms2cVA4aDlkMVJTRFpxeUNqSCtIV2IyL3RVclB2Nk80ak5Hb3NVSlJPU0lr?=
 =?utf-8?B?ejlpaVpyRlFoUWNyYnU5ZXZMc2NBaVpSeXdJMHNKWXdJMXNVSWZ1SXJKSzNy?=
 =?utf-8?B?ZFZoNi81WmU5QVRVVFNEeGRFdUtjYm9xZUNTczlPb2ZhNUR4NFV2b3MzYUJX?=
 =?utf-8?B?bk1NdkFidkJ3US9XT1FCdW5oMUsvUExZdW5peGNPRFBVMmEycnhnWnA5S3Jw?=
 =?utf-8?B?L0dtalNWRzQvYU5odTJYbVBpMXZjVVVXQVVPTXJuTHIzME9rYmhwVUhsU0hY?=
 =?utf-8?B?R3pKbjR6Wm1ON1NqaERJTUdLajR6UXdvamRqRGN4S2dUdnFQM3Zjb3Uwa0Jw?=
 =?utf-8?B?OE5ZWmo0SlFidjNYcWFBdHhHejNoamdFSlpnQnNYWmxlTGMrWFhoa2MzSXBW?=
 =?utf-8?B?Z2RMRk5YcEw1cGJYa3d0d0dHZmIwMzFGWmx5ZWFkQjJMNHloN0JUQ2JidjQ5?=
 =?utf-8?B?dm5aR3ZRcWd2MDZEcEg0V1RYaVJQZEFnanIyVFkrWm1Ccy9kVGpvVUgxeUM2?=
 =?utf-8?B?ZG1wUzZwaHh5cjBtQ2FNV3FoWjlDenJ6STF4RkJxWGxPSEV0enk3SlEzWXVE?=
 =?utf-8?B?VDhEOFdadlFISW8rb1pVekxtVWtpMGFRWk5UN0xhMXdxRkFDai8xUFc4YnNI?=
 =?utf-8?B?bHVtZU84cnlDelIvVlV3UDlJaDZab25iUy9ObjZmeWk1UXFtU1VuZkE5cFZ1?=
 =?utf-8?B?ZzNoa2prcGpCUTF4ZHJHTEFVemtkZ0k5L3Z3SUZlQmdOL0FHalVuUGZSMU8v?=
 =?utf-8?B?eXV5eHhjV1MxQ1ZiV2ZXQWxUbWhTWUhOc1d2d3QvYVVrS1l5Y2w4VE40NHhX?=
 =?utf-8?B?eW5XUzdMdENZb2FtdmZJcUgrbW9IakdrRWpmZCtVM1llNTdtUXN1cEFrb0Fh?=
 =?utf-8?B?SVl1VS94aHpmcnhCMG1xL3M5NVprb3AzQ2hJZGtvVXJyVnd1N2JFdWRtZXB0?=
 =?utf-8?B?UHRZYVIzQXZna2luN1ZqU2xNK3BJRmlya0dyaTR3WnVRWndVMTM1Q2NPR3FY?=
 =?utf-8?B?OHcvaUh4Q1BCdVc2ODA3VW1qSllhWk85Umdob21BbDN5c3EyUElHeVdGUks5?=
 =?utf-8?B?eFpLM1NqTHV6cGRsKy9aWHJ1OGtOZmxZcy9Ca3JYNW9pVnladXk1T3hha21I?=
 =?utf-8?B?V3I2b2w0K09zaDg4djhlZ0dmdWd1cWdpWlVhVzdLbVhmcUI4TWJFWXFTTnJj?=
 =?utf-8?B?bzFPRkhwKzB5TysxUHJrWkNmRyttcUtPY3dTMEtRQXFzQ2R5aktlV3lYWGxk?=
 =?utf-8?B?dEl5dWxvY2VKOURpeUc0Sk5TMlNlTitnR0VkSFVSTXl0NzBtOWI4cklMaDhD?=
 =?utf-8?B?bDdqVTUxWThRR0VEZjZBUjN2UHZVM1pSOG1LdHI3TSs1ZURkeFQxTHdPWGFm?=
 =?utf-8?B?MVcrMWs0Z2hsVVQxQkFUSmxua3BOVDFnaFQ0a2l1YWlDVjNsRzVUUHR3UXkr?=
 =?utf-8?B?OFN0V2lsMUpkalFUazNxQTZIaDhOK2RzZ0h0QjIycjBHUkVXV0psWVd2QkFT?=
 =?utf-8?B?RUVmWUlWVlBMYys0bWlwSkZOcmg4WmZtcXpsNFY4UldHNlZUYzhJdTRHRzRG?=
 =?utf-8?B?SUpIQWJLa3BzQStxczdZVy95WW5BSVpXWWhYZWNvQnhWZ29LMDNvN1ZYczd3?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97CFD5AE40A302449021344B8D390413@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81463a98-9199-4d85-89d0-08db5050c7bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 05:46:48.1755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4jm9okFM2C1xsN74jz14fK7PVUnkMimKFJYCI2ZFHAwDNin2Dk8+7d62hfDKP6hDjQN6IwaKl3T1POc9ddsiyVhFrv9KX4QbcJT2gVRX41g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Handle -EDEADLK case in preempt
 worker
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
Cc: "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA1LTA4IGF0IDIyOjI0IC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IFdpdGggbXVsdGlwbGUgYWN0aXZlIFZNcywgdW5kZXIgbWVtb3J5IHByZXNz
dXJlLCBpdCBpcyBwb3NzaWJsZSB0aGF0Cj4gdHRtX2JvX3ZhbGlkYXRlKCkgcnVuIGludG8gLUVE
RUFETEsgaW4gdHRtX21lbV9ldmljdF93YWl0X2J1c3koKSBhbmQKPiByZXR1cm4gLUVOT01FTS4K
PiAKPiBVbnRpbCB0dG0gcHJvcGVybHkgaGFuZGxlcyBsb2NraW5nIGluIHN1Y2ggc2NlbmFyaW9z
LCBiZXN0IHRoaW5nIHRoZQo+IGRyaXZlciBjYW4gZG8gaXMgdW53aW5kIHRoZSBsb2NrIGFuZCBy
ZXRyeS4KPiAKPiBVcGRhdGUgcHJlZW1wdCB3b3JrZXIgdG8gcmV0cnkgdmFsaWRhdGluZyBCT3Mg
d2l0aCBhIHRpbWVvdXQgdXBvbgo+IC1FTk9NRU0gYW5kIHdoaWxlIGF0IGl0LCBhcHBseSB0aGUg
dGltZW91dCBmb3IgcmV0cmllcyB1cG9uIC1FQUdBSU4KPiBhcyB3ZWxsLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEKPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhh
cHVyYUBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyB8IDI1
ICsrKysrKysrKysrKysrKysrKysrKystLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jCj4gaW5kZXggOTE1NzZjZWMw
MDBkLi5kOTJjOWY2NTlhYjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYwo+IEBAIC0xMCw2ICsxMCw3IEBA
Cj4gwqAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fZXhlY2J1Zl91dGlsLmg+Cj4gwqAjaW5jbHVkZSA8
ZHJtL3R0bS90dG1fdHQuaD4KPiDCoCNpbmNsdWRlIDxkcm0veGVfZHJtLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9kZWxheS5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4KPiDCoCNpbmNs
dWRlIDxsaW51eC9tbS5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L3N3YXAuaD4KPiBAQCAtNTA4LDYg
KzUwOSw4IEBAIHZvaWQgeGVfdm1fdW5sb2NrX2RtYV9yZXN2KHN0cnVjdCB4ZV92bSAqdm0sCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrdmZyZWUodHYpOwo+IMKgfQo+IMKgCj4g
KyNkZWZpbmUgWEVfVk1fUkVCSU5EX1JFVFJZX1RJTUVPVVRfTVMgMTAwMAo+ICsKPiDCoHN0YXRp
YyB2b2lkIHByZWVtcHRfcmViaW5kX3dvcmtfZnVuYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKncpCj4g
wqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV92bSAqdm0gPSBjb250YWluZXJfb2Yodywg
c3RydWN0IHhlX3ZtLAo+IHByZWVtcHQucmViaW5kX3dvcmspOwo+IEBAIC01MTksNiArNTIyLDcg
QEAgc3RhdGljIHZvaWQgcHJlZW1wdF9yZWJpbmRfd29ya19mdW5jKHN0cnVjdAo+IHdvcmtfc3Ry
dWN0ICp3KQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZG1hX2ZlbmNlICpyZWJpbmRfZmVuY2U7
Cj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludCBmZW5jZV9jb3VudCA9IDA7Cj4gwqDCoMKg
wqDCoMKgwqDCoExJU1RfSEVBRChwcmVlbXB0X2ZlbmNlcyk7Cj4gK8KgwqDCoMKgwqDCoMKga3Rp
bWVfdCBlbmQgPSAwOwo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgZXJyOwo+IMKgwqDCoMKgwqDCoMKg
wqBsb25nIHdhaXQ7Cj4gwqDCoMKgwqDCoMKgwqDCoGludCBfX21heWJlX3VudXNlZCB0cmllcyA9
IDA7Cj4gQEAgLTYzMyw5ICs2MzcsMjQgQEAgc3RhdGljIHZvaWQgcHJlZW1wdF9yZWJpbmRfd29y
a19mdW5jKHN0cnVjdAo+IHdvcmtfc3RydWN0ICp3KQo+IMKgb3V0X3VubG9jazoKPiDCoMKgwqDC
oMKgwqDCoMKgeGVfdm1fdW5sb2NrX2RtYV9yZXN2KHZtLCB0dl9vbnN0YWNrLCB0diwgJnd3LCAm
b2Jqcyk7Cj4gwqBvdXRfdW5sb2NrX291dGVyOgo+IC3CoMKgwqDCoMKgwqDCoGlmIChlcnIgPT0g
LUVBR0FJTikgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0cmFjZV94ZV92bV9y
ZWJpbmRfd29ya2VyX3JldHJ5KHZtKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z290byByZXRyeTsKPiArwqDCoMKgwqDCoMKgwqAvKgo+ICvCoMKgwqDCoMKgwqDCoCAqIFdpdGgg
bXVsdGlwbGUgYWN0aXZlIFZNcywgdW5kZXIgbWVtb3J5IHByZXNzdXJlLCBpdCBpcwo+IHBvc3Np
YmxlIHRoYXQKPiArwqDCoMKgwqDCoMKgwqAgKiB0dG1fYm9fdmFsaWRhdGUoKSBydW4gaW50byAt
RURFQURMSyBhbmQgaW4gc3VjaCBjYXNlCj4gcmV0dXJucyAtRU5PTUVNLgo+ICvCoMKgwqDCoMKg
wqDCoCAqIFVudGlsIHR0bSBwcm9wZXJseSBoYW5kbGVzIGxvY2tpbmcgaW4gc3VjaCBzY2VuYXJp
b3MsIGJlc3QKPiB0aGluZyB0aGUKPiArwqDCoMKgwqDCoMKgwqAgKiBkcml2ZXIgY2FuIGRvIGlz
IHJldHJ5IHdpdGggYSB0aW1lb3V0LiBBcHBseSB0aW1lb3V0IGZvcgo+IHJldHJpZXMgdXBvbgo+
ICvCoMKgwqDCoMKgwqDCoCAqIC1FQUdBSU4gYXMgd2VsbCBpbnN0ZWFkIG9mIGluZGVmaW5pdGVs
eSByZXRyeWluZy4gS2lsbGluZwo+IHRoZSBWTSBvcgo+ICvCoMKgwqDCoMKgwqDCoCAqIHB1dHRp
bmcgaXQgaW4gZXJyb3Igc3RhdGUgYWZ0ZXIgdGltZW91dCBvciBvdGhlciBlcnJvcgo+IHNjZW5h
cmlvcyBpcwo+ICvCoMKgwqDCoMKgwqDCoCAqIHN0aWxsIFRCRC4KPiArwqDCoMKgwqDCoMKgwqAg
Ki8KPiArwqDCoMKgwqDCoMKgwqBpZiAoKGVyciA9PSAtRUFHQUlOKSB8fCAoZXJyID09IC1FTk9N
RU0pKSB7CgpXZSBzaG91bGQgbm90IHRpbWVvdXQgZm9yIHVzZXJwdHIgLUVBR0FJTiwgc2VlIHBy
ZXZpb3VzIG1haWwuCk90aGVyd2lzZSBMR1RNLgoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKga3RpbWVfdCBjdXIgPSBrdGltZV9nZXQoKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGVuZCA9IGVuZCA/IDoga3RpbWVfYWRkX21zKGN1ciwKPiBYRV9WTV9SRUJJ
TkRfUkVUUllfVElNRU9VVF9NUyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlm
IChrdGltZV9iZWZvcmUoY3VyLCBlbmQpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBtc2xlZXAoMjApOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdHJhY2VfeGVfdm1fcmViaW5kX3dvcmtlcl9yZXRyeSh2
bSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3Rv
IHJldHJ5Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKg
wqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgdXBfd3JpdGUoJnZtLT5sb2NrKTsKPiDCoAoK

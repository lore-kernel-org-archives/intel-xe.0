Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6C2C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5636410E542;
	Tue, 12 Dec 2023 00:13:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638FA10E542
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339978; x=1733875978;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=m/KKuBhjabKDcCsPGobzHI9WJ5v8RfXrCKrwTNeOM8U=;
 b=PQnPE5sUitqC+17wtwqJmtImEUvQvLKHHwkLko73IkyCBkyTl/+H7kIX
 QdrQ1yIsof48cNuftseDGtw70oeSCubPdVvVEUPLdMjqNwd21C442u+ic
 yS8moE+7aXOX6PjwGUjF5l0dL4f2/n3RVImgLq0TKyyZk6DsANihwwCVM
 9kRdeb9KYZilEzxN20gBthxqF3ME1vQH6X8nXQJnkatz31u41P2acpO9T
 Ru8GHFG82G0N1riXs8+1r9T4KWtUrntkx9FQa6jh81NcuuwO7c25wF9ik
 vGzC+ZMwyKaoxAbkVlKce0X4AR7SsmrX0uUc39/a5JyZINRTPaOXdvB/c Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8093757"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8093757"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766586855"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="766586855"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:12:43 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:12:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:12:43 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:12:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc8aJplHc764ObahpO7tRHm1Emhpoqngum3wLI5G7Hg8lr/99JYczDiAqesC82bCywLjn+vzAuWnjJi3DZKIYdtTj/75ZjS/Ma1VPWzH7K5Jd2c1r0vSyt9mCIQMcofFMIw+jIDb/CyshLIWubI/fhdc3C6lu+UgJHGDjohPR0KUginRDpFstCvzN7PbKgPyk+tEaWDLi+HRr1Vr27DPzolMTI7YPWcnCkp/dvSzyOqijCdXHa6N+P38Kw1HqOhYrE8Hp4or6ws54cco4pzvq3eMJqAVQg6nlmRjetFbVi336WsLH6sXC7LZAPTZmkv859S5oE4233nJYRsJRsLX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/KKuBhjabKDcCsPGobzHI9WJ5v8RfXrCKrwTNeOM8U=;
 b=lPgStjnf3R5Bi3sbtwjlj5H70iVcu4IxS1xK+XuX1JFS2ojylWR1rSI8JgIJufCTwyt9sBzJRp4KBXif2NQDvQLhcMOmL0G9O63agt+O9LZzh8G2inzmfeI26ZyoAjFVTRWHyVblA//aqeDBd9OQ9RgpGViUyAE61YTCPB2xOMlE1YzurS+WkmGhzk9TAZ7dAvWWOmN920DPt/jmeI+67oXyILJKFV6XchWUXodeS3Ojz/W/8f/iY/jalXJOme+qN87KKj3tKBXfpPOtJYaH5OB2AjDxWV8I6TQ2FgJN33SOzFYMQ2YQeO+LNxVaiM1fMdC9FJQ5gIc0+zaf17MNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8394.namprd11.prod.outlook.com (2603:10b6:806:37c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 00:12:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:12:35 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [v3 0/2] Add memory sysfs directory and attributes
Thread-Topic: [v3 0/2] Add memory sysfs directory and attributes
Thread-Index: AQHaLIVhv0lGCKyVH0yDdvBb/+0i0LCktM6AgAAR9YA=
Date: Tue, 12 Dec 2023 00:12:35 +0000
Message-ID: <422c7c1ac2d32ae0ea68a54654b2eed4838948df.camel@intel.com>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231211224112.GA1327160@mdroper-desk1.amr.corp.intel.com>
 <ZXeTxQzkD6U2T-Gq@intel.com>
 <20231211230817.GA1891539@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20231211230817.GA1891539@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|SA1PR11MB8394:EE_
x-ms-office365-filtering-correlation-id: 539fa903-ed0d-409d-d89e-08dbfaa70aef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iWmlRY/lVvDkiKyWKMyRuFTA7gp77HZcCLKVsACA8e3a5TCch9APMfBgL5nHr/Zwt/CXEuwkRomJPVEPUSOrsmEz/kYvVzRhYx+A7x7ARQvdeKyK2R1hu/YShSvtZjfs9DgZIok25wWqaDYQXGn9w8ioZF6LG1xbw46MBsXgIE5TLKj/taZF+8fCUzsTcVcs0XRuH40vA7mfHmV32B7z+0Ik0Eyp+wICej4Ag5d6hfewJiD1YhhOYZfhjDA8yDJa2Cc0bI3pTONS1YnvMy4RM69boMcI9lwgAmJS6ePJwtSvwZfDpOKtuSMPoILUWjzCUqpCpB592z3z85RBj9ZwxG7SoKU52whMhVR5knzBAc84wc6LKjnJHDCGCPOOiM/E4g1lf/rW0CTvRKw7MebnNqCUEJtzUb0lET5nnQ8sP5GdVPwVSKlFZeYAtiuTH+JV8yBa8ADXW/szxwECHXnb/eIDAGp07t5pgOvJiOh26okwDON6znBhGKLy39nq69epUkMi8qPmocId9LWFqEKvQj0De65jVvqzPr6L29auQUAD6/Unx1jYXNkr90j/fmMSjQ7Kx7tiaumZQz16/TJwKWKV+BRGvyuGpg1rBhkzL2lb1wuPxwe8mFSeqJqxeI8l
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(6512007)(2906002)(4001150100001)(6636002)(66446008)(64756008)(66556008)(66946007)(37006003)(54906003)(66476007)(71200400001)(122000001)(36756003)(86362001)(38100700002)(4326008)(6862004)(8676002)(8936002)(5660300002)(316002)(76116006)(478600001)(91956017)(6486002)(41300700001)(82960400001)(38070700009)(26005)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REZrclhDdU5JTW5BN0ZqNDFSOWtsWVFPQlYvYXlRUklYcVFaYkxhb2RYN0dU?=
 =?utf-8?B?Y2VWcjRVVG50VDFGaDNTeWxLNXNXUVJtam1VZzdibFc0YWQrYmFzYmd6RWto?=
 =?utf-8?B?dGoyVUVhZmRnUWt6Njhac0FEM3Y3dURyVUNQVnFlUmNLRkNIclBXYXZEckkr?=
 =?utf-8?B?eVJ4UzhHaVAydkYwL0p1MGVVVVZaZEhOaFZFWERVUFhNaFR5Z0NpZTlLM0dI?=
 =?utf-8?B?YS8weUUybDFrbXVoNnB4cVVqaEVIU2Y4S0hMOXBjb3IrUWQ0MnBqYmNYYVhP?=
 =?utf-8?B?UldveXhPNWt3NGE2VVZyd0tpWjV6bnNheDh4aE9OWUsva0k0cyszYVNaWmQ4?=
 =?utf-8?B?YmJ5Y3pXRlFEeXBETGdEUjhlRHh3NmJhVk1kalFKOFp5ak5KZVhoSTF0Wm5L?=
 =?utf-8?B?dEI2OWwvTjhNb0lUWjNOcnArdldmTVIyUWtGaG9FUFhVd1VMZTU2ZTVtUVB0?=
 =?utf-8?B?VUd6bmRIY1FqblgvWk84VkZtU0V5M2tXZmhNZ1RualBtZExWdUN0dWNrcW4v?=
 =?utf-8?B?QjNtbXp4SUdua3hpa1VnNnUyeDh6WStmVGxyYVFWSzRZcERQY0V4dm9GT3hF?=
 =?utf-8?B?UVN4ZEExMFdVclJxNTczYkZFdmRCejBvZlVjbGZWOVhzRHlEZkJLTmo3dXdF?=
 =?utf-8?B?SGc3a1VhSHZpd3VhWjdZUHQydnQvYjRqK0tyYnJvRUpxWm1LQTlUcExzVE53?=
 =?utf-8?B?TGJJOHB0S3dDVXJxUUViZlAyUUV1TTk3S0cvbUFVTWxNUzVFWGVkZCsyZys1?=
 =?utf-8?B?bEJ3U1pDU3p6L2pZSnEzK2hwT2kvMlg2S3lGU25KYUdDTHFMTUs1OWpqVEd4?=
 =?utf-8?B?Z0tQVzNmYXRMeXZtNzI2Rk5idGFWZWxkcTFiYWVmem4ydGE2NlpRazV4MEoz?=
 =?utf-8?B?cVByUThlMmJaTTlPUnpuK2hhV2g1TGRGcWZHdmtzN3l4cXMxTy9ZL2FLWHA0?=
 =?utf-8?B?YjByVFpjMFdzaXJZQnRjajJUckhHTmp3bitpRmRWdHl2cVJ3TUtYS3FwNTJz?=
 =?utf-8?B?T3hPZDVCd2g4WE11L1JwVVhVQlFDa0VMR0FQMGtvSE1PVGZJdzhLQXc4dmZN?=
 =?utf-8?B?eS8ydFZrbndmTXlZVHVXMXlINjZBeTVITnlXcjl5d2RxTGtDY0dJRVFSQXN5?=
 =?utf-8?B?SVYwYzhUeUtKKzhRZEZVcEF5V3BXSGhuV1p0ZkZjdFQvQmg4d2x4ZEo0LzFl?=
 =?utf-8?B?VnZ5VVJEa3hXTlZFekFGTkQ1MFZUMFJYWVJSTGJVRXQ3K1lxeU5nWnBHZVdq?=
 =?utf-8?B?QS91UG85NTB5emFKRGc5S2RUbElJek12SExnNGRwUUZFcXVsWXJaWWRaekU5?=
 =?utf-8?B?bnNESCtKcmh5QjI3c2ppYnpDamRiZEtFNWJrdHd5MERPZUR5Ny9xTGVIN1dm?=
 =?utf-8?B?TEFSemIvRkllWkVhNitKbjRlcWlVOU5ZM2JOTFhuWDl6VDNJTDZ6WWl5eGRm?=
 =?utf-8?B?anFPclVPak1FRlJpMUY1TUhsTVJwVXVNaHIxRDNzbkNRY2t0WW9GdXhkOGhM?=
 =?utf-8?B?eGlqODd1bldhUWNTZDQ5ZUg2TFhJZ3FLYnV0NVRGRXA0SnR3NUVTNldPY0cx?=
 =?utf-8?B?TFNUUEZQVDBJRTJnV042SXBWWGVtOXBaT3VzeXgwNjJRYldTN3dSSFQ1S0Mv?=
 =?utf-8?B?QWlnbjBYNUcybGE1VG9oT1M3SDk0YjhZeVBXcjZxclA2bHdJNXRLZ01aY1ZO?=
 =?utf-8?B?Wm5OVTRPZmNNdStvQktXQXNxeDZMSGVsS2FDNHlESkFzMmIrbzdJbk1lbTYx?=
 =?utf-8?B?QXNUVVU2M0tIOWtuTVB6K2pjSkRvNlpvdDA2S2t6dk8xSWozd0tIcDgxUWx4?=
 =?utf-8?B?a3ZjYXRHRHhRbUdiajlKYTkvbFRQUUEzenFOYzBhQ3NWK0k4SkQyMzRaQkhD?=
 =?utf-8?B?K2pzTllDUVhwOVVMTGpsNkZLK2I3T0RNVCt5Wjc5aHJoTkJZVjRPVUNjVG93?=
 =?utf-8?B?VkN1dHZtY3FOcFVLbW41VHVkd0t0MGJIdkwreS9qdVdwcXBMRzFVeGtCMHVX?=
 =?utf-8?B?R2dJaXFmZ0NDckFEekZzZzlhV0FYTW5zTHFGN0tKeXJCNDljNHJwVUdUWjQ2?=
 =?utf-8?B?T2xaRjZXSFQwc3hScnhUYTk0MVhHWUJjWUh5K1RLOFJlQ3huUEJRWnZhdnF6?=
 =?utf-8?B?UnhITHVWVUZtMGppcGxaMHdOVDM3VHA0OE02dzFEWXYrQjJXK1o3ZzhNUHRB?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0B44AD0019748408AA3BAA544614EAF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539fa903-ed0d-409d-d89e-08dbfaa70aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 00:12:35.2667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ad7pVv/32UamgVUdo0hoH25PRBNQAOvbMcSNxrLwGo9lK+A0770EAyk6/1OFO1XvCTu+leEEG1Nck0C2kJExwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8394
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTEyLTExIGF0IDE1OjA4IC0wODAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBNb24sIERlYyAxMSwgMjAyMyBhdCAwNTo1NzowOVBNIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3Jv
dGU6DQo+ID4gT24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgMDI6NDE6MTJQTSAtMDgwMCwgTWF0dCBS
b3BlciB3cm90ZToNCj4gPiA+IE9uIFRodSwgRGVjIDA3LCAyMDIzIGF0IDA4OjQ3OjM3UE0gKzA1
MzAsIFN1amFyaXRoYSBTdW5kYXJlc2FuDQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gQ3JlYXRlIGFu
b3RoZXIgbGF5ZXIgb2Ygc3ViIGRpcmVjdG9yaWVzIHRvIGNsZWFuIHVwIG1lbW9yeS92cmFtDQo+
ID4gPiA+IHJlbGF0ZWQgc3lzZnMgcGF0aC4gQWRkaXRpb25hbGx5LCBpbnRyb2R1Y2UgdGhlIHZy
YW0gZnJlcXVlbmN5DQo+ID4gPiA+IHN5c2ZzIA0KPiA+ID4gPiB1bmRlciBhIHRoZSBuZXcgcGF0
aC4NCj4gPiA+IA0KPiA+ID4gV2hhdCdzIHRoZSB1c2Vyc3BhY2UgY29uc3VtZXIgb2YgdGhpcyB1
QVBJP8KgIEhvdyB3aWxsIHRoaXMgd2luZA0KPiA+ID4gdXANCj4gPiA+IGdldHRpbmcgdXNlZCBp
biBhIHJlYWwtd29ybGQgc29mdHdhcmUgc3RhY2s/wqAgSXNuJ3Qgc3R1ZmYgbGlrZQ0KPiA+ID4g
dGhlDQo+ID4gPiBtZW1vcnkgc2l6ZSBhbHJlYWR5IHJldHVybmVkIHZpYSB0aGUgcXVlcnkgaW50
ZXJmYWNlPw0KPiA+IA0KPiA+IFBsZWFzZSBub3RpY2UgdGhhdCB0aGlzIGlzIG1vcmUgZm9yIGZy
ZXF1ZW5jeSBtYW5hZ2VtZW50LCBub3RoaW5nDQo+ID4gcmVsYXRlZA0KPiA+IHRvIHRoZSBVTUQg
aW5mb3JtYXRpb24gdGhhdCB3ZSBleHBvc2UgaW4gdGhlIGlvY3RsIHF1ZXJpZXMuDQo+IA0KPiBB
cmUgeW91IHN1cmU/wqAgVGhlIGZpcnN0IHBhdGNoIGhlcmUgaXMgbW92aW5nIGENCj4gJ3BoeXNp
Y2FsX3ZyYW1fc2l6ZV9ieXRlcycgZW50cnkuwqAgSSBiZWxpZXZlIHdlIGNhbiBnZXQgZWFjaCB0
aWxlJ3MNCj4gVlJBTQ0KPiBzaXplIGZyb20gdGhlIG1lbW9yeSByZWdpb25zIHJlcG9ydGVkIGJ5
IHRoZSBxdWVyeSBpb2N0bCBhcyB3ZWxsLA0KPiB3aGljaA0KPiBtYWtlcyBtZSB3b25kZXIgd2h5
IHRoaXMgaXMgYWxzbyBpbiBzeXNmcyBhbmQgd2hvJ3MgdXNpbmcgaXQuwqAgSXQgd2FzDQo+IGFs
cmVhZHkgaW4gc3lzZnMgYmVmb3JlIGFuZCBpcyBqdXN0IG1vdmluZyBsb2NhdGlvbiBub3csIGJ1
dCBpZiBpdCdzDQo+IG5vdA0KPiBuZWVkZWQgd2UgY291bGQgcHJvYmFibHkganVzdCByZW1vdmUg
aXQ/DQoNCnlvdSBhcmUgcmlnaHQhIEkgaGFkIG1pc3NlZCB0aGlzIGhlcmUsIGJ1dCBJIGhhZCBi
dW1wZWQgaW50byBJR1QgdXNpbmcNCnRoaXMgc3lzZnMgZW50cnkgYW5kIEkgYWdyZWUgd2UgYWN0
dWFsbHkgd2FudCB0byByZW1vdmUgaXQgZW50aXJlbHkuDQoNCj4gDQo+IFRoZSBmcmVxdWVuY3kg
c3R1ZmYgc2hvd3MgdXAgaW4gdGhlIHNlY29uZCBwYXRjaCwgYW5kICJ0aGlzIGlzIG1lYW50DQo+
IGZvcg0KPiB0aGUgZW5kIHVzZXIgdG8gdHdlYWsgZGlyZWN0bHkiIGlzIGZpbmUsIGJ1dCB0aGF0
IHNob3VsZCBwcm9iYWJseSBiZQ0KPiBzdGF0ZWQgZXhwbGljaXRseS4NCj4gDQo+IA0KPiBNYXR0
DQo+IA0KPiA+IA0KPiA+IExpa2UgZXZlcnkgb3RoZXIgc3lzZnMgaW50ZXJmYWNlLCBpdCBkb2Vz
bid0IGFjdHVhbGx5IG1hdHRlciB3aGF0DQo+ID4gd3JhcHBlcg0KPiA+IGVuZHMgdXAgdXNpbmcg
aXQuIEluIGdlbmVyYWwgdGhleSBhcmUgZm9yIHN5c3RlbSBhZG1pbmlzdHJhdG9ycyB0bw0KPiA+
IHR1bmUNCj4gPiB0aGUgaGFyZHdhcmUsIHNvIHdlIGp1c3QgbmVlZCB0byBlbnN1cmUgdGhhdCBp
dCBtYWtlcyBzZW5zZSwgaXQgaXMNCj4gPiBjbGVhbg0KPiA+IGFuZCBzb21ldGhpbmcgd2Ugd2ls
bCBiZSBhYmxlIHRvIG1haW50YWluIGxvbmcgdGVybSB3aXRob3V0DQo+ID4gYnJlYWtpbmcNCj4g
PiBjb21wYXRpYmlsaXR5Lg0KPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IE1hdHQNCj4gPiA+
IA0KPiA+ID4gPiANCj4gPiA+ID4gU3VqYXJpdGhhIFN1bmRhcmVzYW4gKDIpOg0KPiA+ID4gPiDC
oCBkcm0veGU6IEFkZCBhIG5ldyBtZW1vcnkgZGlyZWN0b3J5IHVuZGVyIHRpbGUNCj4gPiA+ID4g
wqAgZHJtL3hlOiBBZGQgdnJhbSBmcmVxdWVuY3kgc3lzZnMgYXR0cmlidXRlcw0KPiA+ID4gPiAN
Cj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGVfYXBpLmjCoCB8wqDCoCA4ICsr
Kw0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMgfCAxMDENCj4g
PiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gPiA+ID4gwqAyIGZpbGVzIGNo
YW5nZWQsIDEwNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+
ID4gLS0gDQo+ID4gPiA+IDIuMjUuMQ0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gLS0gDQo+ID4g
PiBNYXR0IFJvcGVyDQo+ID4gPiBHcmFwaGljcyBTb2Z0d2FyZSBFbmdpbmVlcg0KPiA+ID4gTGlu
dXggR1BVIFBsYXRmb3JtIEVuYWJsZW1lbnQNCj4gPiA+IEludGVsIENvcnBvcmF0aW9uDQo+IA0K
DQo=

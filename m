Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D4CC982EA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 05:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FE710E7F9;
	Wed, 23 Sep 2026 05:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhvBX3Kx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFFD10E7F9
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 05:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790142602; x=1821678602;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oLy5SrGizKFW6jCseaNePuQBe+IA1haKuepL1azu530=;
 b=lhvBX3KxfsG8uNNaBGDa5KcFpyR8LJwO1SEvi/IXoiavv9aTwP5064wB
 nlNUowDG3jM7cy8SJEAgVnLK3y3NL9gex7/pwgGmjqOHPeRxF4JLZ4Qk8
 Mj6p43tI4uQ2RY/KGyRsqBzQZw8ozSvlimOj5hic+Bi8eOxjLkrbX9EHE
 q2gdrqrRDzdVOFRQoO52mlYJpvXvX48W9ZI9XfqHDimUuxYOvT4mFYruD
 0uMcRHdqeSSGxrz8VU0RuVSTkGMpX/llkSwyWG3W+lk2yH9OypN+VmFcA
 6h8LWdLFc1LHU1Lh/DJulBjST42EjNBhgEsWXKbnWoFsU1nqWu/g0CwPq g==;
X-CSE-ConnectionGUID: +mAmj8gWSwauV1uBewP+OA==
X-CSE-MsgGUID: m4ZgOSWOQL+4sylQzZfiuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="116330725"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="116330725"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 22:50:02 -0700
X-CSE-ConnectionGUID: ForAm+EITUa68YWgKPt6qA==
X-CSE-MsgGUID: pqQy/RiiS6WM0IxyyE2v9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="272943847"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 22:50:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 22:50:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 22:50:02 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 22:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxYwGVakBsmMqR8XSBLx5FUJMA78gnbNKXerV+XSIsOksg3gNgDJbYzMcOaPghwTB2q85NAP8Cyk9O7TQ5wug/jpUNvEKZNKSD/s4WSFIwqxbgh12HJN0zYcJB9RTO4wwCbjIuIsqHegK1sXgEVmCkuGD+8G/abHOwDe7UNbuqXR4sq/Q/gowIpqvC63NWpR2vkPHqFoNIS2/JLR12xs3jso3uY0t3J1IV0jTgtZmKdNHm/J4grBnXroIblCGev122R194w15rnaldP0fctD40faSrN9vCtu1qK+Zd/lSOC0dgQSi2HrhxHhOH7Ugkv11dBYQKaUvhPhn47lh/SPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLy5SrGizKFW6jCseaNePuQBe+IA1haKuepL1azu530=;
 b=LkSPVoGx0dtjtSGXcqeyVMyRStfsgnT7iC7sNvufgB44UQ6DlbkLldtNt7hH8VSCaBBcuG4mmW93AveLKt7ZSJtb+/3qJqs3cRYDcXFLI9o0yG5UltrUHQSgM8n5nGjT7yGvtfeuGj96luQIg0vfTHncSvkxSb3CYNf5y5BZG1Gl2TtY2N3cfzdr1Biwi5rroE12I0Vl/jZacVbXhq5jMaifh6mwtX2Xp3Cx64ZXqRynNHJ4hNOefisZhQX9vl1QxRZcm/gVbJMEhfe1/DC6rVCXTAz3HKGRbtDWR1lW3uGAa67KvtI8yPVhqOjI00co6KNSuRxRa5NpKq1fMfADgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by DS0PR11MB7458.namprd11.prod.outlook.com (2603:10b6:8:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 05:49:53 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 05:49:53 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 07/13] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
Thread-Topic: [PATCH v3 07/13] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
Thread-Index: AQHdP39BPefrI4ObKkGLv3oLwB+hP7bFAicAgBat9ZA=
Date: Wed, 23 Sep 2026 05:49:53 +0000
Message-ID: <BL1PR11MB5413B6EF457B0DB77AB46969E2822@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-8-dnyaneshwar.bhadane@intel.com>
 <c5ad8aa2-0b3c-4ac2-8856-82ff53bde557@intel.com>
In-Reply-To: <c5ad8aa2-0b3c-4ac2-8856-82ff53bde557@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|DS0PR11MB7458:EE_
x-ms-office365-filtering-correlation-id: e114616f-96b3-4627-0b03-08df19367d60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|10067099003|38070700021|56012099006|4143699003;
x-microsoft-antispam-message-info: WCh746slJobzuhkD2Pl/4lRLqbPM2viSONVSa/KPjKbYuMDUMlQDTFPmiFf/yncKsXVAv5FN5XMElBLMXaT4vojFUu82NysUGfSEbBgleI1CdYeF4yihiJXZ09RvDipv5dMnTXItgaSTF8GmUvcfiPJ36jCZZe6Hql1k6k0UBPAnb/VSVQxev+Iuz2/VRRd866ShLa5NQksHutt5P40630/7VFtWQczln/0MOyuIUbaLy+8Nev/QtxvNfd7qv16VPwBwazjfnJLsfSsD+MgrFKcsBQbUR8Tjxx/29hDtfwbVT/DUgOjQLrqvBf43OEAO18D1G79FNf07+ihPhLTEIWLrcFMYFG7LWhrfBAQ6ZXheP4qBE8vZXdj7BQFecFlesFNkiH/1Bakk6P54WrQyfABbdAX5Vl9SMrTdK+pZarIRpzO4MgY4odAaNnNzJIS8wKrZ8Ixhr8A4LJ4cn1rKeeNJDcknlzaJMrDwyMmBr0j3BSH9X34w8nX3rJfC2q9PxVTUcFO5/4v5zpigfmq1sB2ExE3OSHaAGcsz/A05mX65fBLVyAuqObOnsQ2i77VlRb2D2cADdnfA+fztAb2WtkT7mspqYbywtFcxtC/hf13Rjz2lK0vR4/stBwrs8j34OEhFdJAeb4oS4JaTjmImSzVTHYia5V4PAVMLA/vptRNRf/N3dM5ErJ1vtV1iRZ+QpaSMsWr4Fy5ywn/GJkGgGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(10067099003)(38070700021)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2UrRHY4NzhUcldzenpYTkE1ekJ6V1plcVh4bC9QREliZ3M5OHZ4WXFPaTFG?=
 =?utf-8?B?ckVRdWd4Wk9NMjJ6V2hMYittZHBIUWxDbHNiWlgvVU03RGk1ZjVvcTB4YVhE?=
 =?utf-8?B?eks1cTVWdVc3ODRoK0YzSmgxbWNKVXEvaFdTWDhjdWhveldxbWZGZ281cDdO?=
 =?utf-8?B?SnVGOGVRSlViT3lUTUowSk4rTFRjeW5RTXpTbWl6eUdUcVM1eVI1OG5IM3dr?=
 =?utf-8?B?THo2cGI1N3I3dWE5V3cxS3lkQjZxckVaSXYwSDllSmZlSWZPcmRIS2IzUkdQ?=
 =?utf-8?B?Rm9OTnBjZzlFZ0pPMURMNjFvM212TmszbUZhR2t6QmJVN3pDakhUSnJYcVRy?=
 =?utf-8?B?UkRibHp5L1h5dk9iVENiVGFmK0l5dGZ3OEVob1RWbmNwLzJUL2FmNHkxVXdn?=
 =?utf-8?B?ZmRpM3dNQzAzcDFzbzIxaGNaSzdsemw0K2ZlOFZ6V3VCLzljc20xRjlVU0NT?=
 =?utf-8?B?dndPUldjNmViUE5iWURxdG5BZGIvQ3ZXVk00UjZSdUY1NmxYQlVPbFg2RGYw?=
 =?utf-8?B?VlZjeXVzcEVYRUpCRjlreHA3WGpDZFZOV3JhYy82KzNsWjVzQXVCV1p3bHhK?=
 =?utf-8?B?anA3VElZcHgzaHZrV2pxck52bSswSWZaYlM5VGMwYjNXY3g1RzNzeEQzQ1Zn?=
 =?utf-8?B?Nm51SFRzUmlmamYrOE5icEo5NmJmcE1tcm5pcVFFbzVEc0EyQm1KTm1TV2FE?=
 =?utf-8?B?YmY2WnBmVEZ6TDl4bVcweWtWbWhxcXRRY1FTNkhLQS9tMFlCWEV4TkE3emNi?=
 =?utf-8?B?YVVDZlpDTnltc2szSkVubGNibDU4bmFNMStoSWFJMC8vV0lLeEFENGh6MzJD?=
 =?utf-8?B?ZHljT0p1WE85SWREeTkrb3pCSWZMeWdNaHdBMHBkQU5abDZXSHBzY3RFVlZS?=
 =?utf-8?B?TUZ6V2lXYjZCd2pzQkdEVVh4b2ZycE9ucjhBNjNKQy9pbEtZZ2JsTXRxM1NR?=
 =?utf-8?B?NnlUcXJ3UVllQVlYWnZ6a0lXUmVmM2lDNGQ2ODVuRURCWEcyZDlhanRGNVRj?=
 =?utf-8?B?aUE3aldVcVovVVVGLzhxQjcyYjNjbzd3aEFHRGhnQWJrS1k2M0hPWTlYbE5Y?=
 =?utf-8?B?SG42Tk5tSnlZMHBXMEZOTGZlWTNZZTNnaGxHeG1CVTRaZjcxSFZhZGdjT1Vl?=
 =?utf-8?B?dWN6Z0xEMFQyWGE0OVZKWERvMVRrTnY5cGRJSTNXRm1UU0hSUGRVWWM1b1Vx?=
 =?utf-8?B?a2Nyb1doeW8vTDYzRi81eGswRmljdmNzdVdFbUtacGk4eklkZ1hPUTdsNzgz?=
 =?utf-8?B?WHI3eG1Id1RJS1lLVHRVQStnTktxbFI2ZjJ0SE9EYk44eHlwNHFRTFlDMDVY?=
 =?utf-8?B?V2NyTHprc2Y5blVRK3JBZjR6TkFRNTlzT1MwdGJoa3UyeUJsQTVnZmdmYXhm?=
 =?utf-8?B?Q0ZMZWFRekZRN3VSOTdBSXFsdm5keE1xaUZVV3hmakVXYkpWa1o3cGthMStF?=
 =?utf-8?B?Ty9MdnZCb21vWTJqazY5bzNKTmlqNFFxR0lkRlpYY3NZSHExb2ljb3VhOGNk?=
 =?utf-8?B?eU5Md0pXdDZ6R2Y2cWxVOVN2aFZpdk9wNmgzRzNBMEM4MC80MnpCSGcydFIy?=
 =?utf-8?B?bHRvNGFYUzFIOTdxVjNSei9IeDNRSktPV1djKzRTUG1ISUdUcThZdHFoK2p1?=
 =?utf-8?B?MWZzL1Q1Rk14TXVWamdBaE1mbmV2MlNkSGZnZU5Icm4zb2JsZGdBRGhhMG5X?=
 =?utf-8?B?RFhkdW5lVll3N05GQjFvTnJmYzFFa3FSbXBqU2NMczZZT1RaSjRpMmZqUTJa?=
 =?utf-8?B?UzdPaUF1S3dDMTRnZG9qcHZmc2U5ZFN5RGl5UVplT2pUc0tmSDdiTXlXTVNl?=
 =?utf-8?B?VVJMN2RFM0Q2RklGWVR0UGdOTWM4QmNRVjk2elpabmhCMlBTajA4dkdlN1J6?=
 =?utf-8?B?bGJVSnFHVUFoNWdTT1BIM1hmaTh1RnIybGV0bEFaSzZPWjR5ZWFhYlRBd1hj?=
 =?utf-8?B?TXdoNW9TNkFObE10OERRZzRGMm5DNEhORjV3aUJxekZ3QlVJODBPS3VIRzJR?=
 =?utf-8?B?U2dMTFFGaXduU1NyUFFEK21oL1BvcU8wdUtaMFNMR1VTT3hWR2tib1FtRGlL?=
 =?utf-8?B?c2g3Rm04V3kwYmZWMlRYVXZWMGQybmhHdTNiQWcwVVBHcmNCbG90KzFPL2Qy?=
 =?utf-8?B?dnBwQk5iUnRBdzNSSXVxM3k4a1M2VEFTWTA2dU96eWZTRnFpQ0grN1hwMW0r?=
 =?utf-8?B?Y0h4Z0E2Z1hzTE8zYXo4TnNPOEZqSG1MZHBDenVlTmZiUTRCYzYyTHgxaTBF?=
 =?utf-8?B?SGwyVTIyQWVoWWVHcTNic2piM1NlMFBZSzdkMTkvUTdXeTdraEFpeXozVEVk?=
 =?utf-8?B?RzZ5ZUlaWlV1aWJmcUNRQVBxZnozbitLR0V3ZjNiUmNPTFB5WGlHNzFpZTEx?=
 =?utf-8?Q?1t+JDHB0VkrgyBgY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: onZbeQ03vLNu07QOKpMLXifxRhvOEMYcPt3hOHOc4v/lcteAkzUWG+L7GDzbsDpZMtMwUC/sj4NkcKOoIM2dkiV/BEWvyBybJy1I801F105lkgeLAmn9jFfKw6TW9tHYCOMf/Ns6/vEZNI+qV41FnmPqixjqhBhaCvin2eyNpd+0Jn/9DXz2mO9WLn1XYRqWrmGUfXnCB9HGmrkaMy4EgMpUb1muvZEEYMuXkRRB54vygKsuNkTmmxE8taSyyES7xcgdqdFDK/vtLOkOx9FROzaAX+CYk64JK89nSXN5FmOvAW7wIw1SiPm13A89yhj+VuJT2pyhh2u/byu8UnuHbA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e114616f-96b3-4627-0b03-08df19367d60
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 05:49:53.1924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AhFQiLozaNwD1Yszz42Y7noZW98HYOL5SOq8lkHBX1wjoCVgfo9Ookn1KmwMeTpAafXEXsMfvL99jqg7O7uOsSfP4tRqi4ymnOR0OLRQhGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7458
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FqZGVjemtvLCBNaWNo
YWwgPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRl
bWJlciA5LCAyMDI2IDEyOjA0IEFNDQo+IFRvOiBCaGFkYW5lLCBEbnlhbmVzaHdhciA8ZG55YW5l
c2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYzIDA3LzEzXSBkcm0veGUvcmVnX3NyOiBSZXBvcnQgc2F2ZS1yZXN0b3JlIGVy
cm9ycyB1c2luZw0KPiBzdHJ1Y3R1cmVkIHhlX2xvZyBBUEkNCj4gDQo+IA0KPiANCj4gT24gOS84
LzIwMjYgMTI6NDUgUE0sIERueWFuZXNod2FyIEJoYWRhbmUgd3JvdGU6DQo+ID4gUmVwbGFjZSB4
ZV9ndF9ub3RpY2UoKSBhbmQgeGVfZ3RfZXJyKCkgY2FsbHMgd2l0aCB4ZV9sb2dfaW5mbygpIGFu
ZA0KPiA+IHhlX2xvZ19lcnIoKSB1c2luZyB0aGUgUkVHUyBjb21wb25lbnQgdGFnIGZvciByZWdp
c3RlciBzYXZlLXJlc3RvcmUNCj4gPiBvcGVyYXRpb25zOg0KPiA+DQo+ID4gICAtIE1DUiByZWdp
c3RlciBtaXNtYXRjaCBjb3JyZWN0aW9ucw0KPiA+ICAgLSBGYWlsZWQgdG8gYWRkIHJlZ2lzdGVy
IHRvIHNhdmUtcmVzdG9yZSBsaXN0DQo+ID4gICAtIEZvcmNlLXdha2UgdGltZW91dCBkdXJpbmcg
U1IgYXBwbHkNCj4gPiB2MjoNCj4gPiAtIERyb3AgZXJyb3IgdHlwZSBmcm9tIGxvZ2dpbmcgZXhw
bGljaXRseShNYWxsZXNoKS4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEbnlhbmVzaHdhciBCaGFkYW5l
IDxkbnlhbmVzaHdhci5iaGFkYW5lQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3JlZ19zci5jIHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3JlZ19zci5jDQo+ID4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcmVnX3NyLmMgaW5kZXggZTMyOGY1MDcyNTU3Li5lZTE3ZThjMTBh
NDYNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmVnX3NyLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmVnX3NyLmMNCj4gPiBAQCAtMjEsNiAr
MjEsNyBAQA0KPiA+ICAjaW5jbHVkZSAieGVfZ3RfcHJpbnRrLmgiDQo+ID4gICNpbmNsdWRlICJ4
ZV9ndF90eXBlcy5oIg0KPiA+ICAjaW5jbHVkZSAieGVfaHdfZW5naW5lX3R5cGVzLmgiDQo+ID4g
KyNpbmNsdWRlICJ4ZV9sb2cuaCINCj4gPiAgI2luY2x1ZGUgInhlX2xyYy5oIg0KPiA+ICAjaW5j
bHVkZSAieGVfbW1pby5oIg0KPiA+ICAjaW5jbHVkZSAieGVfcnRwX3R5cGVzLmgiDQo+ID4gQEAg
LTg3LDE1ICs4OCwxNSBAQCBzdGF0aWMgc3RydWN0IHhlX3JlZyBzYW5pdGl6ZV9tY3Ioc3RydWN0
IHhlX3JlZ19zcg0KPiA+ICpzciwNCj4gPg0KPiA+ICAJaWYgKGlzX21jciAmJiAhcmVnLm1jcikg
ew0KPiA+ICAJCXJlZy5tY3IgPSAxOw0KPiA+IC0JCXhlX2d0X25vdGljZShndCwgInhlX3JlZ19z
cl9lbnRyeSB1c2luZyBub24tTUNSIHJlZ2lzdGVyIGZvcg0KPiBhZGRyZXNzIDB4JXgsIGZvcmNp
bmcgTUNSXG4iLA0KPiA+IC0JCQkgICAgIHJlZy5hZGRyKTsNCj4gPiArCQl4ZV9sb2dfaW5mbyhn
dCwgUkVHUywgInhlX3JlZ19zcl9lbnRyeSB1c2luZyBub24tTUNSIHJlZ2lzdGVyDQo+IGZvciBh
ZGRyZXNzIDB4JXgsIGZvcmNpbmcgTUNSXG4iLA0KPiA+ICsJCQkgICAgcmVnLmFkZHIpOw0KPiAN
Cj4gc2hvdWxkIHdlIHVzZSB4ZV9sb2cgaGVyZT8NCj4gdGhpcyBsb29rcyBsaWtlIG91ciBSVFAv
d2hpdGVsaXN0IGlzc3VlDQo+IG1heWJlIGl0IHNob3VsZCBiZSB4ZV9hc3NlcnQ/DQo+IA0KPiBv
ciBpZiB3ZSB3YW50IHRvIHVzZSB4ZV9sb2csIHdlIHNob3VsZCBhZGQgUkVHX1NSIGNvbXBvbmVu
dD8NCj4gbGlrZSB3ZSBhbHJlYWR5IGhhdmUgUlRQPw0KPiANCj4gPiAgCQlyZWdfc3JfaW5jX2Vy
cm9yKHNyKTsNCj4gPiAgCX0NCj4gPg0KPiA+ICAJaWYgKCFpc19tY3IgJiYgcmVnLm1jcikgew0K
PiA+ICAJCXJlZy5tY3IgPSAwOw0KPiA+IC0JCXhlX2d0X25vdGljZShndCwgInhlX3JlZ19zcl9l
bnRyeSB1c2luZyBNQ1IgcmVnaXN0ZXIgZm9yIGFkZHJlc3MNCj4gMHgleCwgZm9yY2luZyBub24t
TUNSXG4iLA0KPiA+IC0JCQkgICAgIHJlZy5hZGRyKTsNCj4gPiArCQl4ZV9sb2dfaW5mbyhndCwg
UkVHUywgInhlX3JlZ19zcl9lbnRyeSB1c2luZyBNQ1IgcmVnaXN0ZXIgZm9yDQo+IGFkZHJlc3Mg
MHgleCwgZm9yY2luZyBub24tTUNSXG4iLA0KPiA+ICsJCQkgICAgcmVnLmFkZHIpOw0KPiANCj4g
ZGl0dG8NCj4gDQo+ID4gIAkJcmVnX3NyX2luY19lcnJvcihzcik7DQo+ID4gIAl9DQo+ID4NCj4g
PiBAQCAtMTQzLDEyICsxNDQsMTEgQEAgaW50IHhlX3JlZ19zcl9hZGQoc3RydWN0IHhlX3JlZ19z
ciAqc3IsDQo+ID4gIGZhaWxfZnJlZToNCj4gPiAgCWtmcmVlKHBlbnRyeSk7DQo+ID4gIGZhaWw6
DQo+ID4gLQl4ZV9ndF9lcnIoZ3QsDQo+ID4gLQkJICAiZGlzY2FyZGluZyBzYXZlLXJlc3RvcmUg
cmVnICUwNGx4IChjbGVhcjogJTA4eCwgc2V0OiAlMDh4LA0KPiBtYXNrZWQ6ICVzLCBtY3I6ICVz
KTogcmV0PSVkXG4iLA0KPiA+IC0JCSAgaWR4LCBlLT5jbHJfYml0cywgZS0+c2V0X2JpdHMsDQo+
ID4gLQkJICBzdHJfeWVzX25vKGUtPnJlZy5tYXNrZWQpLA0KPiA+IC0JCSAgc3RyX3llc19ubyhl
LT5yZWcubWNyKSwNCj4gPiAtCQkgIHJldCk7DQo+ID4gKwl4ZV9sb2dfZXJyKGd0LCBSRUdTLCBy
ZXQsDQo+ID4gKwkJICAgImRpc2NhcmRpbmcgc2F2ZS1yZXN0b3JlIHJlZyAlMDRseCAoY2xlYXI6
ICUwOHgsIHNldDogJTA4eCwNCj4gbWFza2VkOiAlcywgbWNyOiAlcylcbiIsDQo+ID4gKwkJICAg
aWR4LCBlLT5jbHJfYml0cywgZS0+c2V0X2JpdHMsDQo+ID4gKwkJICAgc3RyX3llc19ubyhlLT5y
ZWcubWFza2VkKSwNCj4gPiArCQkgICBzdHJfeWVzX25vKGUtPnJlZy5tY3IpKTsNCj4gDQo+IGFn
YWluLCBpcyB0aGlzIHJlYWxseSBhIFJFR1MgKElPX0JVUykgaXNzdWUgb3IganVzdCBpbnRlcm5h
bCBjb25maWcgbWlzbWF0Y2gNCkhpLCBkcm9wcGluZyB0aGlzIGNoYW5nZSBhbmQga2VlcGluZyBp
dCBhcyB4ZV9ndF9lcnIuIA0KPiANCj4gPiAgCXJlZ19zcl9pbmNfZXJyb3Ioc3IpOw0KPiA+DQo+
ID4gIAlyZXR1cm4gcmV0Ow0KPiA+IEBAIC0yMTksNyArMjE5LDcgQEAgdm9pZCB4ZV9yZWdfc3Jf
YXBwbHlfbW1pbyhzdHJ1Y3QgeGVfcmVnX3NyICpzciwNCj4gPiBzdHJ1Y3QgeGVfZ3QgKmd0KQ0K
PiA+DQo+ID4gIAlDTEFTUyh4ZV9mb3JjZV93YWtlLCBmd19yZWYpKGd0X3RvX2Z3KGd0KSwgWEVf
Rk9SQ0VXQUtFX0FMTCk7DQo+IA0KPiBidHcsIGFyZSB5b3UgcGxhbm5pbmcgdG8gcHJvbW90ZSB4
ZV9ndF9XQVJOIGZyb20geGVfZm9yY2Vfd2FrZV9nZXQoKSB0bw0KPiB4ZV9sb2cgPw0KTm8gcGxh
biB0byBwcm9tb3RlIGl0LiANCj4gDQo+ID4gIAlpZiAoIXhlX2ZvcmNlX3dha2VfcmVmX2hhc19k
b21haW4oZndfcmVmLmRvbWFpbnMsDQo+IFhFX0ZPUkNFV0FLRV9BTEwpKSB7DQo+ID4gLQkJeGVf
Z3RfZXJyKGd0LCAiRmFpbGVkIHRvIGFwcGx5LCBlcnI9LUVUSU1FRE9VVFxuIik7DQo+ID4gKwkJ
eGVfbG9nX2VycihndCwgUkVHUywgLUVUSU1FRE9VVCwgIkZhaWxlZCB0byBhcHBseVxuIik7DQpP
bmx5IHRpbWVvdXQgZXJyb3IgaXMgcmVwb3J0ZWQgYXMgeGVfbG9nIA0KDQpEbnlhbmVzaHdhciwg
DQo+ID4gIAkJcmV0dXJuOw0KPiA+ICAJfQ0KPiA+DQoNCg==

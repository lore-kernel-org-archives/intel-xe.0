Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9447CC982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 18:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEC810F4C0;
	Fri, 18 Sep 2026 18:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B26fqpvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBBD10E58C
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 18:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789757373; x=1821293373;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KBsYAwJcfvZgn0a3N+u4uhDYgs85b4yqg4L4KFa2EYs=;
 b=B26fqpviFzKbiIuYE9aP+jJ/5mstHvdgpskare+qKBul+msVLTMUHT2E
 lu02+JnwaWBX03S7hrdGMyL8qaibUxbIrglbnz6OOfqD99PpguwtiRKrZ
 WjVDG7F7PmkhxctRhT4/UUYQTfWbSvU7O1l3oAUfm7HHjJq6+ob815UDs
 rZrexvi3+CRfGDBCzDg/yh4oZY6fXXzNYtY3b6O9UNHZD+63jlIOM9eed
 aM3FLN6v3+KA+Zw3+z80jyhnwNu66DPg4H3bfEVRKJQ00ZCc+jFiu+SZv
 9sm5SBIh3zkXBkDZZFaohGYCLdFjddHEo0QI1gkmfrQ1IMXMkWNykugAX g==;
X-CSE-ConnectionGUID: jJ2eyHA9T3SrzKwS8/r8eQ==
X-CSE-MsgGUID: lOaTcd2IQiK4dGiOJDyrQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="92793056"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="92793056"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 11:49:33 -0700
X-CSE-ConnectionGUID: uAX/iR0GReeZc8CCFwVVdA==
X-CSE-MsgGUID: kFE+BXOORh2+VIQSmKRbcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="270238857"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 11:49:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 11:49:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 11:49:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 11:49:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbUXKjjwgqpTgLp1+UDmtrMc/2/vFOS6d6C+hxdu3YXaw7tXWnzg3P2eruQ6Z6K5GGdyoiE9aCXSbA7rrD8j33aX5uPdmnQzSUL5OvE0KawznXFMxCSlYl+FwOgaQkw7kTx0cChaXWSXR0i/FPpVnv4epUduDKDO2eea8I+pzSqsbIkDHvU7JKmI8/wrqWHfQdRV7DP9J9qAM7mepcQl8bFiG35nu3FKKC2feXf0flHoRZOdwMq+4lCb16FVShvA5tbS5ieB4wD9XB5IC/yZaNPE3HX26dLeSRbGuw9kl7gktP2X4pu7FJeDiz3NvecEbBTqGwtZ2nYpOyg5JROXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBsYAwJcfvZgn0a3N+u4uhDYgs85b4yqg4L4KFa2EYs=;
 b=COwnlulNRM+7Qy6toJOB1F/4SSIaLabUNqB1/evU+OeBl+Fj1egeO95aqdq8PsKkiTJ90DvvdZR05htAopXYAQx23gtppcFP/Bq84Aqu3Slj/9WDYJ+tzRpC8bkslW3dphDnhQedye08IwgysfORnfu6NPjsf/7i33b37IJLudMjI6DWVK0Gro0mw5auOZuTKFVnSzaCkgQBM3Os471mFc6rFOXAMHY8rs90BX7r8bOSr/icggacsbUJnkKPqpic5E3dscJKdhNQv0Te8ktdrxv3NiRlH3am8QBUDR+EJetdxN18CfWiYHefWK1kjevOJq8kS0r3TSM+BVaI0HpUPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 18:49:25 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 18:49:24 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Consolidate semaphore instruction definitions
Thread-Topic: [PATCH] drm/xe: Consolidate semaphore instruction definitions
Thread-Index: AQHdRvS4Eje5ZiqfSUuqBPmhT9svqrbUrsOQ
Date: Fri, 18 Sep 2026 18:49:24 +0000
Message-ID: <BL1PR11MB5413DB47B9E6359DFF0DB27EE2872@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260917-semaphore_inst-v1-1-61e49405f71d@intel.com>
In-Reply-To: <20260917-semaphore_inst-v1-1-61e49405f71d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|SJ0PR11MB5917:EE_
x-ms-office365-filtering-correlation-id: 07a4ddb9-cd7c-4742-317b-08df15b58f64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: W8jtTgamw/5kvpsl3V0O+cZnBq6bTGLR7X4Cqkwj2K2dg5X/G5edTtjMZc12uz1G/xCQLuIJm9GE/EYbPYvDXU8TMmpCvoV8hqJAY9B0iNoB2SWZqluhqyNnl2I0zZO0BxKbByVvjIwhZomI1zJhC1tgYG4thiRYhgx+G6XOALOsCj4no/RVzy4WnNWPsuYSqDqVPpuSsqYitKutd0OU5ur0Q996ur+MqlyUhYwkOi8L2LukNipezvPB61+DSSMsASz3UBYRLZ4n3Q+JqHqGW6dsvwxC7qdCSDVDE2J731VMVvFvUgx8B8Aqd4MyQy4ArnsvjJMvV2leWeKCxLQ7FLbkEoHo5tISAtz84Gv09UVFLw6miPx2005Uhh/ESs5296rb40dnJvY2Czv5FbWspl67SZvq7Vq54owP2JzqzDkTPc7buJrnOsP+S/3cFhYybuuAcLlDXO9AfgFyIIps3rOzhqSsN9iFdlLmHSWGTXTKUChIJKRyGBWFHeQWgoDvfI3QjEmK/Pm5aiHl3YmKbZtwAi4I6iqtQJjgVbEiMVCjtqmeynC6tRu+OzpxHrSH5m2W2sO2PV0gFhY8FNOmvkfVt2XZcDZ2OGtVqj8KngSfAZnNuXftixVt+FBG7EqE6Fmv/xFGqvoTv+l1iBbshPtkKOb/uqhOWB7+fl+c3xFO83HEVQMUBtWzQ0zMJnl8PNHYSc6TlGXzN+1MGmA0xQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkpzSzUwRE9vdENWTzJxM1FXdEdKaFh0dFhqQS85R3VZN2xoQ2gvUEplL21W?=
 =?utf-8?B?LzE4aTlETXl1YksvaUF4V3lldCtHOXYvYVZMRm16SnpTUEp3cXNuZWFGTkhk?=
 =?utf-8?B?VGFCU1poTm1KdC9TU0NaK2Z1ZEtiVEd0NVlEcUxHOGNRTXJxR3JmSXdIdFRa?=
 =?utf-8?B?U2xCM3ZNalJBbUh3b0dyVUtoNTAxU1J3TGp0aHprTzdyS3lLSU1TVExsMity?=
 =?utf-8?B?R3QwNWp1Y2lpalB2Ynk3KzRXaS85YnAyMXRMb0RzMk1kK3NnTUF1UEtaMmpK?=
 =?utf-8?B?a0V4QUtoUjUrNkQyM0NFRTRESWxZR0ExZnh5UFRJUEFQcWRSdEh0UnhqaWxi?=
 =?utf-8?B?V2NOVUJMSDUrL2dvUU4zZTFWNGxlQk1JNDVMdWFZYzRJNm1rZk1EQUdvZDBL?=
 =?utf-8?B?d2JkS0pmMFhtWXJEbFJ6NEFLNHRYNmR5QkUvZUZPODEzVTZDMWdpZGhnZGdj?=
 =?utf-8?B?Q2ViRnU2V3JvWm03TjB5SFpZZWM3cFlJdXFkME1HTTNCdHFUSzk2elF5dHU2?=
 =?utf-8?B?bEpBNGRwZlRVSE16Vy9FL1c4WmJoWGt4WXJ1NVRsREN2QzVpTjU3dE9DbllD?=
 =?utf-8?B?byttZ0x1bVRtNW9rdkEyMHg1aURER2dqMWwvdksxZWpBcGdqQnhqcENMMXVC?=
 =?utf-8?B?ZHBFYlFHTVlYSGJkM3VrTU9uL1NFUkoxOVRiT2ZQMTcyd3BZSStUWTM1Y216?=
 =?utf-8?B?eXZUcVVGMUlHQUdUb3hXellqNStmYUd2UFJvbmxINytLVGRxeUpwZ3piWjBZ?=
 =?utf-8?B?NTZaeVRTeHJueVV5U0dEYThiRFRVR0tROTJEbVh3cTJXVC92SG9lL1ZsRm9M?=
 =?utf-8?B?dmtmMjluSytzckFBTFRsbFdQVkNnQ004bmNZWVBiR2pUVmVqU3hoNXl0NjRn?=
 =?utf-8?B?ZHBiQ2JwNGZNV0VXa29kTmdTaGFQVG1MMUQyN08wanEyMWlCWmxvcGZqMkpm?=
 =?utf-8?B?MzNsbDBOeUZ1cVJDTHdIc21jRVFjMTRTckVlOTJ3THRqYTdlTFIwYmNXd2Fq?=
 =?utf-8?B?WnZQeWpKWlhHUjBnaGlkNUJQUUFYWlpoeTIybnBZRW9oZUpSWWJtejVobU1H?=
 =?utf-8?B?WGZjbGJLMHVBNm5BM2ZZMisvbm94ZytRblQvNVZKSERPSVpLQ21rbldZM2tD?=
 =?utf-8?B?SnBRSHU1cjU4UDBzQWkyRDZUQll6bDBKYXhmSWRHMW9QM3hMZUhocWVvNmNV?=
 =?utf-8?B?Q0xiMmM4bTVaTkQ0RHdBbXg2Y2JCNzNKV0owcUQ2dHhLTFVCckpDRlZyZndN?=
 =?utf-8?B?ajlJZ3p2aElUcHFZTlZuNythNVpSaHFxeEpISG9KQjd4TWs5WjY1Um9LdWFu?=
 =?utf-8?B?MUFQU2FIcVNBTGtxSFNrZnhtLzFrdzJiSEZsUndpMlVNWDBzRzl4ak9Jem1h?=
 =?utf-8?B?ZzlweThSYTJZNEtkUlFsdSsvbWxBVVE0K1FRZ1pPeVYzS3RGdjFQT0JCMUta?=
 =?utf-8?B?dWJrb0Y4ZkNJcmhkd2V2bnQ1MW5VaCtWcFRpQUdaemhRbzhFM1owdTU1Mm9L?=
 =?utf-8?B?REhaNFh6N3MzVmJ2eFM3Zjh1d3BVRTZaUmZERTBZMXM5bUtmUklQSzJBMFV4?=
 =?utf-8?B?dTcrYnowc202d3VORC9Rc2JPbVUxNkFlbXlvbHhERS9ONzhDT2d6SE5POWhW?=
 =?utf-8?B?a3dpOTBnbjZXR2crUm9HOWNYcDJHaWxHT0I1cFpkazNheGRBK2Z2VmZ3K0JM?=
 =?utf-8?B?MXZmUEZyU28yVlVVbVR3V3RndnVkdE05dUlCc2pLYVJFM1E1M3FnN05qaHpO?=
 =?utf-8?B?Z0RqUTNBQnJjUUVJWGwzTDNyU2hkMVRKWUJHcWd4T0grMUp6a3J3ZVZ6ZHVN?=
 =?utf-8?B?cm41T1lXUEFSOGZlRXdnYnBRYkhuMERxeWhBYUNiUys3YVlMUE5keWhLZ0x6?=
 =?utf-8?B?UDdsQjgrQXpNOVVoTlNPcTBEcGVJRjBTTzgzT3JhUEo5OW92L3ZKcnQrLzZm?=
 =?utf-8?B?UUxZcFh0UlVxWE5nVm9ZM1RFUlUwWm9WcmFNaW40MjhHRjNOaEdOd0R1anZX?=
 =?utf-8?B?QUZaUFlWRVBJVlYxQkJmSnVGbG53d3N6WVJvVFZzZlFDSlVNL0Nvdm9wSVR0?=
 =?utf-8?B?cEtZSkk5TUZFZnIzeGlibUY4M0orRlQ5UWE1aW4rS0NEUk5TUVRhcFFIVnlp?=
 =?utf-8?B?dXJtQy9sWlRaOWpLbjB2M0pHaERUaGlpbWw2dUREcEpBSWtqZzY0VmhVVWRW?=
 =?utf-8?B?WDNheDR4QUpEY1BTek1PUGRVc3ROWUpRTjdLdXhoNnFvcy9QdFpHbjRqL2pB?=
 =?utf-8?B?d0RFYTJSbWo2VGZvQzJBZnVTTnRwT2prdm1IYmdSMWFHR0pvUFZNTWR5aFJp?=
 =?utf-8?B?aGxxNzBQdzE0TUlqV3VIRlJLNzFjOTMwa29ESmVxMUdBaWZ0NFVXZUorSk45?=
 =?utf-8?Q?XYB6BfSSSV68u9fc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QH0vmUvq5HZRH51cHCijS9sv+UKrr+VVkn22obpLVhR/kj6U01hG4pNJ0gXK6mBiyfarxQ1AbeYV3knWWrdu+wEJRZxkX9ob5WPe229xposbrUDmm7Pe85o5dkhZRutVAOltq2YvBDdPsg3CLTegfB/qAD9smvsncm/w/dw1KpMa9x24xlQ1IjNAgnd8kkkz0shsAtw/2FzcnroL3ksZlpt6ZbnFhH/zBv/bvMV+KWXN2EY4y726v8sLqEwofya3Lr+7yarJnhwq08ExJLCsHrXMrzeZBkZTt0wrHZxI/biRv9tHvOGIgv6RdWNlA7G1jcefCx1fOVuiCSmRUzJ5WQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a4ddb9-cd7c-4742-317b-08df15b58f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 18:49:24.8256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X36GLJvYV3ORMkxElmvBZmBL5ETi2P1t67zg1Lg2T41iCT9Tf4Q013Avnv2RMBRB7repmI87o91i1jAXnaqGabpPgsjFMXaPo7zznY9FyYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTWF0dCBSb3Bl
cg0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAxOCwgMjAyNiA0OjA0IEFNDQo+IFRvOiBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRo
ZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3hlOiBDb25zb2xp
ZGF0ZSBzZW1hcGhvcmUgaW5zdHJ1Y3Rpb24gZGVmaW5pdGlvbnMNCj4gDQo+IERyb3AgdGhlIGRl
ZmluaXRpb24gb2YgTUlfU0VNQVBIT1JFX1dBSVRfVE9LRU4gYW5kIHJlcGxhY2UgaXRzIHVzZXMg
d2l0aA0KPiBNSV9TRU1BUEhPUkVfV0FJVC4gIEJvdGggI2RlZmluZSdzIHdlcmUgcmVwcmVzZW50
aW5nIHRoZSBzYW1lIG9wY29kZSAweDFDDQo+IGFuZCB0aGlzIEdQVSBpbnN0cnVjdGlvbiBoYXMg
YWx3YXlzIGJlZW4gbmFtZWQgIk1JX1NFTUFQSE9SRV9XQUlUIg0KPiBpbiB0aGUgb2ZmaWNpYWwg
c3BlY3MuDQo+IA0KPiBUaGUgIipfVE9LRU4iIGRlZmluaXRpb24gYXBwZWFycyB0byBoYXZlIGJl
ZW4gY29waWVkIGZyb20gaTkxNSdzIGNvZGUuDQo+IGk5MTUgbmVlZGVkIHR3byBzZXBhcmF0ZSBk
ZWZpbml0aW9ucyB0byByZWZsZWN0IHRoZSBzbGlnaHRseSBkaWZmZXJlbnQgaW5zdHJ1Y3Rpb24N
Cj4gbGVuZ3RocyBnZW44LWdlbjExIHBsYXRmb3JtcyAoNCBkd29yZHMpIHZzIGdlbjEyIGFuZCBs
YXRlciBwbGF0Zm9ybXMgKDUgZHdvcmRzLA0KPiB3aXRoIHRoZSBleHRyYSBkd29yZCByZXByZXNl
bnRpbmcgYSB0b2tlbiksIGJ1dCBYZSBvbmx5IHN1cHBvcnRzIG5ld2VyIHBsYXRmb3Jtcw0KPiB3
aXRoIHRoZSA1LWR3b3JkIGZvcm0sIHNvIG9ubHkgYSBzaW5nbGUgZGVmaW5pdGlvbiBpcyBuZWVk
ZWQgYW5kIHNob3VsZCBtYXRjaCB0aGUNCj4gb2ZmaWNpYWwgbmFtZSBnaXZlbiBpbiB0aGUgc3Bl
Y3MuDQo+IA0KPiBCc3BlYzogMTQwNTQsIDQ1NzQ5LCA2MDI0NA0KPiBTaWduZWQtb2ZmLWJ5OiBN
YXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KDQpMR1RNLA0KUmV2aWV3ZWQt
Ynk6IERueWFuZXNod2FyIEJoYWRhbmUgPGRueWFuZXNod2FyLmJoYWRhbmVAaW50ZWwuY29tPg0K
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5k
cy5oIHwgNyArLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYyAgICAg
ICAgICAgICAgICAgfCA0ICsrLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9p
bnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0
cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiBpbmRleCBhZDdkOThmMmRiYmEuLjgzNWVmNzVi
YmViMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9t
aV9jb21tYW5kcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVf
bWlfY29tbWFuZHMuaA0KPiBAQCAtMzYsNiArMzYsNyBAQA0KPiANCj4gICNkZWZpbmUgTUlfU0VN
QVBIT1JFX1dBSVQJCShfX01JX0lOU1RSKDB4MWMpIHwNCj4gWEVfSU5TVFJfTlVNX0RXKDUpKQ0K
PiAgI2RlZmluZSAgIE1JX1NFTVdfR0dUVAkJCVJFR19CSVQoMjIpDQo+ICsjZGVmaW5lICAgTUlf
U0VNV19SRUdJU1RFUl9QT0xMCQlSRUdfQklUKDE2KQ0KPiAgI2RlZmluZSAgIE1JX1NFTVdfUE9M
TAkJCVJFR19CSVQoMTUpDQo+ICAjZGVmaW5lICAgTUlfU0VNV19DT01QQVJFX09QX01BU0sJUkVH
X0dFTk1BU0soMTQsIDEyKQ0KPiAgI2RlZmluZSAgICAgQ09NUEFSRV9PUF9TQURfR1RfU0RECTAN
Cj4gQEAgLTk0LDEwICs5NSw0IEBADQo+ICAjZGVmaW5lIE1JX1NFVF9BUFBJRF9TRVNTSU9OX0lE
X01BU0sJUkVHX0dFTk1BU0soNiwgMCkNCj4gICNkZWZpbmUgTUlfU0VUX0FQUElEX1NFU1NJT05f
SUQoeCkNCj4gCVJFR19GSUVMRF9QUkVQKE1JX1NFVF9BUFBJRF9TRVNTSU9OX0lEX01BU0ssIHgp
DQo+IA0KPiAtI2RlZmluZSBNSV9TRU1BUEhPUkVfV0FJVF9UT0tFTgkJKF9fTUlfSU5TVFIoMHgx
YykgfA0KPiBYRV9JTlNUUl9OVU1fRFcoNSkpIC8qIFhlTFArICovDQo+IC0jZGVmaW5lICAgTUlf
U0VNQVBIT1JFX1JFR0lTVEVSX1BPTEwJUkVHX0JJVCgxNikNCj4gLSNkZWZpbmUgICBNSV9TRU1B
UEhPUkVfUE9MTAkJUkVHX0JJVCgxNSkNCj4gLSNkZWZpbmUgICBNSV9TRU1BUEhPUkVfQ01QX09Q
X01BU0sJUkVHX0dFTk1BU0soMTQsIDEyKQ0KPiAtI2RlZmluZSAgIE1JX1NFTUFQSE9SRV9TQURf
RVFfU0REDQo+IAlSRUdfRklFTERfUFJFUChNSV9TRU1BUEhPUkVfQ01QX09QX01BU0ssIDQpDQo+
IC0NCj4gICNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdf
b3BzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiBpbmRleCAwOGI0
YTQyODNlOTYuLjQ2YWIxZjBmMzU2NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3Jpbmdfb3BzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMN
Cj4gQEAgLTU1LDggKzU1LDggQEAgX19lbWl0X2F1eF90YWJsZV9pbnYodTMyICpjbWQsIGNvbnN0
IHN0cnVjdCB4ZV9yZWcgcmVnLA0KPiB1MzIgYWRqX29mZnNldCkNCj4gIAkJIE1JX0xSSV9NTUlP
X1JFTUFQX0VOOw0KPiAgCSpjbWQrKyA9IHJlZy5hZGRyICsgYWRqX29mZnNldDsNCj4gIAkqY21k
KysgPSBBVVhfSU5WOw0KPiAtCSpjbWQrKyA9IE1JX1NFTUFQSE9SRV9XQUlUX1RPS0VOIHwNCj4g
TUlfU0VNQVBIT1JFX1JFR0lTVEVSX1BPTEwgfA0KPiAtCQkgTUlfU0VNQVBIT1JFX1BPTEwgfCBN
SV9TRU1BUEhPUkVfU0FEX0VRX1NERDsNCj4gKwkqY21kKysgPSBNSV9TRU1BUEhPUkVfV0FJVCB8
IE1JX1NFTVdfUkVHSVNURVJfUE9MTCB8DQo+ICsJCSBNSV9TRU1XX1BPTEwgfCBNSV9TRU1XX0NP
TVBBUkUoU0FEX0VRX1NERCk7DQo+ICAJKmNtZCsrID0gMDsNCj4gIAkqY21kKysgPSByZWcuYWRk
ciArIGFkal9vZmZzZXQ7DQo+ICAJKmNtZCsrID0gMDsNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1p
dDogZTMzNzhkMjc0NjI0MWRiMWE5NThhMjNjNTY1MzMzZmNjMWUzMGFlZg0KPiBjaGFuZ2UtaWQ6
IDIwMjYwOTE0LXNlbWFwaG9yZV9pbnN0LTJkYmNkYmQzNGRmYw0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiAtLQ0KPiBNYXR0IFJvcGVyDQo+IEdyYXBoaWNzIFNvZnR3YXJlIEVuZ2luZWVyDQo+IExp
bnV4IEdQVSBQbGF0Zm9ybSBFbmFibGVtZW50DQo+IEludGVsIENvcnBvcmF0aW9uDQoNCg==

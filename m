Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8420CFF886C
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 18:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C8610E8A5;
	Mon, 27 Apr 2026 18:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccSmiVzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304A110E8A5
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777313299; x=1808849299;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0W8eT2Gk3bzJs1AL6yU61BGirIKMb/+8rkn7dMB3uSI=;
 b=ccSmiVzcbOLBWyc6Ic3as4akgBlqqZ9c/pspi1dSrHm1shlq9KFf8UGz
 BfHsLBTXD5VyVCv3scfEJ7pso4rIuLNSkXJSnGtrHIyRChdGih2PNgOpA
 8iMZ4x0xmLrwPgLjp9FOn/iexXGKXacAvA83CSwuT5FWkcZ54mUEhUagy
 Pzc38RGDlDe7MwQxR3Bp2gJR1YA8g0JuAwahw40CDlQ4cuZuCPH9BBJat
 ukTHWDRww7LrLAmqXkLVjluMQZAwZH45ljvQUNx41MQxoqe4pOfHye2rC
 gesDLkQZrkM0VQb2yMOO9wpKNdJLsfdPNUmZqYxVodcZYXeE1CiYqwml4 A==;
X-CSE-ConnectionGUID: jVPcZCKUTymsp2atHOsZFw==
X-CSE-MsgGUID: 2M/HBbxOSR+ekJZKF/Zuew==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82061243"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="82061243"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 11:08:18 -0700
X-CSE-ConnectionGUID: Z0a6lakETcGHrZQri4lklQ==
X-CSE-MsgGUID: btzEd+IHTR26ewWorW3teg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237682231"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 11:08:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 11:08:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 11:08:17 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 11:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlATqxQ13tIztF8GPg2KuoHTfDUsdyyO5PWR2b5BiwRaf8SPj86J8IYeQV6GVXNYDD7RZs845NsUssjawvHvnrHL33wCLiFF7EfUY1CUt4dKXdmfgA5IFUAoswGX7Xreo+E1F8UdOqrvTzB3mGHLC89+TGMd8/dXN5pcHuMCHWGSDA8rKuQttwvFIDtUbDaFSlHJxGpiHnfFGEpGmR+cY9WenoWLdI6FvvEnvRYyl8pirJ9WmXjse7LchEIalDWO8I1b8GBOIJ9HcEBeF2V5w9oPfM8sK26MrRwfmaYquZbsL8IGS63opW/rwLklNEsXDarr3RxB89k8vb0hd/qpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0W8eT2Gk3bzJs1AL6yU61BGirIKMb/+8rkn7dMB3uSI=;
 b=Os2r+EssKnfMLjfX4r677UK0mscS5NpvsIOG4Qi4YocQOezhzxwm4UXBfIr1WhQHaY4WhW7wOSxwjOiAcYr3NaP9arOPN+3sQtfEkLnh0lTvjWBZ9G+EaFDOLrROTogpNoBmtX/13N1i3aL8R8+056kLixpx7Nkn/6yzE3hsm6OXd8LVBrziAxX26FImVdnh4vF7Qmeud2zzyV+z0m9kmTE5R1eY1vUXu5IaFgNPZ7R2fM7G4JkS0P7PjDUlbE+VlcvTbpb7qSW0lDc4YcgaBKIYQpAlGNmqtvZz4eUfqHW1c2rZspQmO3FKzYQa5OXm2GOwB1b25mL/n/LeLe2KOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH8PR11MB6561.namprd11.prod.outlook.com (2603:10b6:510:1c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 18:08:08 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 18:08:08 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 08/10] drm/xe: Drop unnecessary STOP_RING clearing
Thread-Topic: [PATCH v2 08/10] drm/xe: Drop unnecessary STOP_RING clearing
Thread-Index: AQHc1CwXT0rTjjDlIEagdnl8DJZ3wbXzNq9Q
Date: Mon, 27 Apr 2026 18:08:08 +0000
Message-ID: <DM4PR11MB54564138FF5052CE5577471DEA362@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
 <20260424-engine-setup-v2-8-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-8-59cc620a25f1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH8PR11MB6561:EE_
x-ms-office365-filtering-correlation-id: eaaa6e36-3f59-4013-f725-08dea487efa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: oJQ5R/A+7PG59EZkh9zVxEeH//1SfVhaoTXzecp8AhW/msDDugwkP2n6H9mEXwZdy36HCXx87W0rbly9HcwMxNPmVectR5ievfIQ6njCFvrbXbEoCAKYNp75IeMr6p5xqTxfMrQetFHuYNJxnTr/+O+mtu5bEPaCirwFBhPmCt89nOBtn1iwDPXr5FFuHiiv083mjqb180w2ugYlm6ozpYpWuS1XqFhDY6zFGgv/WLUSKsyiJgFuwPY6yUWKrXlPzZ+oM1ZeVE9ghY8fA1Zb2V426xJ1xwbO5N7p/R4x14cCFy1w9E+6VsouwFd2cr8cQUeJhN3LpKq8+iwoWv+u95oftGPG7XShdWyUe2iutNY/PYgnntsX5cTr4dkA9GkfRT7DCULktMHjJhFnBKPdNyfyV1ldWur2UywEn4GQKuyt15Jp49T7Y0RDk2OUpndAzxan/jR10c6FMy8xPr4/QPsoMbLCiW65erpMjM1PgAidqavdnZEBgA8uXoecb0FPLYcxxUfgKHYL4tllAGYD8pRxMPlBQhtb4k27UKAmSEo9TEvbBAwmgoDJfJkOOlSdL5LaJZdWl3rkziqYGQzaaQjxrWPb8hU6nDvmLqv3AdAJ1xeHY9ae6PlJ7y5BqvcyLBqEmd5HRg4NehsBveOEdfPQ6Sg+jwjZjdKIUGfy2aYGRiPescAosMyvGLqJBWwzrG5Co1e8dW5z8Fq3VmRc9TlmsOCuJE9Dy91JKhsM7rr6ORkdJDU4gIBvooi1pzf4voxH1WsLbg/jj5nVr1xmLty4K4FRTNqJExHC6WnzZEM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHBxWkJDS2VWRU1BeS9vUWM3WDE0Y0R2YjlsUjNNbHNpTStmQTQxU3QxZjFS?=
 =?utf-8?B?c1Q1K2NMZkp4THhDN1pHNGlJNWZrMTJVcm5QL0hJQXRqYy9MV1p4Rnhyd1Jj?=
 =?utf-8?B?K1RveEs1Y2F2MzExZU1mdytuWmFZVlRsOFdteTNVLzRuVlBzWjFKaS9SNkg4?=
 =?utf-8?B?eXFpMS9UZGkvVE1Ld01GYW52TVlqT0xaQVY2U3V2QnBiZ1lzNElRODBHTy91?=
 =?utf-8?B?Y3FiclF3NkhnWXR2cjNYdDkvMWwyWTJHaDJpQytiTHFLSHoxaVc0SXRrTWor?=
 =?utf-8?B?SUhOT05Hb1F3NE9KZzJER3dsNjc4amhZbWFiTTZWb1JQUDlzS3V3Um5XT01N?=
 =?utf-8?B?eW1qemtZSmZ5aERVWkpmbVVPUjJ4aGNkbXp5dHJhTWdlbE5UU1lUclQyMXZl?=
 =?utf-8?B?WGkxc3hMRHBtQ3M3dGtxQ3pmTDd2YlBSUDdIZWRZT1hoaDJhZndwL1RhRDNB?=
 =?utf-8?B?dkdZc1RoY2dNMFJLbXBXOTNXUUJjZkJCVCtaUUl4MkVnbCs1YnRMR25kTWY1?=
 =?utf-8?B?MlBra01VanhURnhxRThMMndLUHFJcUtkdFBGcW40NHA0bkR1Z3ovS2RjN0Y3?=
 =?utf-8?B?VVFBN2RIalBra1VYbFZWN1BCZEJ1Zjl2YW5WUTh5c01sU1JSYWsvcXlWNThG?=
 =?utf-8?B?emtPZ0ZnWFhlM1hEdUR6WWtkRE9uRWJla2pMTVpNMmR1S2hZRFBieGtkVm1l?=
 =?utf-8?B?bCtyUW1WSVZldDRhNTZCZjFPNzlScWFtbEN3RWRFVk50cGdsR1pLdUMwL0RG?=
 =?utf-8?B?MVhySmxkQjBjd2RZZ0g1YWdycmxiVGpNSnNZL1VqUGt5TEJFcGtwbnRXRHNS?=
 =?utf-8?B?Ry9KT1Yvd2tIZjZucWNxL29TMDBzcGxUQXRucG1OYmJuMmhHeXFhUC9yT3I1?=
 =?utf-8?B?MEhvU0g1UzBqRWtPSkNBT2pML01tK0IyQ3R0K0Y1c3Z4eURmcGRnWCtTV1NC?=
 =?utf-8?B?VzFjM3FGbGhYT28zSGNYcWpURktoUlpUZDAvSXc1bEJkNGN6OHpXYllPN3M4?=
 =?utf-8?B?cVJnRmo4M1lSZGU4RGMrMkxIb095NEhTQ3hwZTkvRFRNc1FTNW1yWElucm9h?=
 =?utf-8?B?WEI1S3Y1M3l6RjBmYlNzWm9ORDQwempzc2NYRDRnNUZ4NFgwVEJJQlJGVmth?=
 =?utf-8?B?bFpTTFp5dnVkd0ZpMnZTaDdicWhTczYvaGpFREpkak9jSGR3dHRaLzJORTNj?=
 =?utf-8?B?N1ZKYkJyUVVNQS9Hd1dOWFlzLzlsT1NyRzlTcm9iaURuaEJGd0x3Ti9SZHdo?=
 =?utf-8?B?TmR3UVh1UExFZmdsVENMRVRsNmZJOE9MbVd5Ky9wcVNMdXJYOWYrSEJhWHh1?=
 =?utf-8?B?V2JMZk1seVBvWHdkNXUxRlpCQS9KTG1MLzZSZVZqY3VXOThOb3I0ZzFWNnRv?=
 =?utf-8?B?emRndzV3T2FiT0NRMVoxRmpHUFhBVm5va3M2RkJMZEVpUVYyNkprV0JCMDhL?=
 =?utf-8?B?c0thZnRQZ1BHVk5YeTQxY29Hck9YOVBRK3lPajc5UjY2U3hIWXAycEt0OHQv?=
 =?utf-8?B?TUM2ZDdzMmhBakxGUjlzTHEwY1FQanVEeWF4YjM0YXc5MG1Od3BWZS9WbFpD?=
 =?utf-8?B?L2pmVFZ5TFhrYUtQWWVIMkRNUXpIcThVamlhbzJiZk9hZEl1TGptNk5sb09a?=
 =?utf-8?B?S1dtYXF1NkJ1OGtxUDZTMFh6UUY2dkRKNE5iUmhrdGxZSTBKQkQ4c3ZzL08v?=
 =?utf-8?B?QjFCeU9WY01INCsySjd4R0k2UVlhbDZDYzd3ckh4SW1tNnZYT1Q3RlFXNUM1?=
 =?utf-8?B?NjlEWDFkTEVlVEpFckxqU29Sd25uREd4dkVheUhlTXU0L20zczlvRC9hWlZL?=
 =?utf-8?B?R213YTdjQnRkTlUzaDBFdFNkQmxyOFRUVnZCNG5Od29GU1VrRnRGQ3VCV3NT?=
 =?utf-8?B?aVRYczNVOUUwWjV6TFMzNW1Ka2NSdXVxNHF1VWcxSUNtRlFkVlJtamdYb0Nj?=
 =?utf-8?B?RmRUQVZTSDhEeHFJQWRFNGVsTDZDVWt3ZWJydXpISWltaVlXOGsvUHNCMkY2?=
 =?utf-8?B?WDhJYTg3bG81KzdYT2JDUjhuUlFBcUtISFI4SVhKZDBZVUwyck5UT0dVTERx?=
 =?utf-8?B?cktLNE50ZE40UGlicUdwaklOSThad2lIV29pWmJSbFBjbkYyT0hnN3IvbFoz?=
 =?utf-8?B?YnkrZVhralNqR1l3blNtN05ycmlXUnVFT21IYnE1Z1gvMXhVb2xuM1ErUDcz?=
 =?utf-8?B?Zmo2b0FmMmtlNlo2UEQ2M1ZOTTdXMmdDR2dnTGtlUGJucDlmRldLbFY0Y09G?=
 =?utf-8?B?VXhaTUlTVkdkN0xHNGpqSjE4WmMzeTE3TVlTNDZRQlJ1a05UdU91NXlsSWps?=
 =?utf-8?B?Q0dHM3RhRDJEN2lTeUpQYVBDR3pzcVJuczBzZGZQOTljZmxiR0JRUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dR4nQ81N801KpTj8VVQ+wcHd86xaWJkSrEYn/MM0SX6Q4AxAe1dEEMQICu7+Ic6G1uCF+PC2AsbPw9laoHcE4eE5dj/cHfAhUqdxdqWcD3v4KVSBpGEy9tX9mqbt/shaexufi/GxdBURU+IFo3T1lWqJ5Rv32tvrHs8Z7OsIoiz6Bc9owXjZelaZWHmH6iS5+oLZonZUu3U8epBEl5z6ftEcN5jpql4gN4cyBu9agwVQo9dZCNGysKSEP9Au3shCbUbLSjmRdQMkKJlKxNqAYacoPloVTjHg62ibPdk9VItz+wurQcOuxslgYI7vJ2Rr+poyqE5B5NGA0/Ztyaq6wQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaaa6e36-3f59-4013-f725-08dea487efa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 18:08:08.0645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c/q0zxSZ+OBQxVS67tBcqdWfzj0uO9n7znppmHPo4H7ItVVTolJsr/+WasxeMkqiF6ZASErU4IYCgdMi1rwRNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6561
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

T24gRnJpLCBBcHIgMjQsIDIwMjYgMTo0OCBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBUaGUgU1RP
UF9SSU5HIGJpdCBpbiBNSV9NT0RFIGlzIGFscmVhZHkgY2xlYXIgYnkgZGVmYXVsdCBvdXQgb2Yg
aGFyZHdhcmUNCj4gcmVzZXQgYW5kIHdpbGwgb25seSBiZSAnMScgaWYgdGhlIGRyaXZlciBpbnRl
bnRpb25hbGx5IHNldHMgaXQgYWZ0ZXIgdGhhdC4NCj4gRnVydGhlcm1vcmUsIE1JX01PREUgaXMg
cGFydCBvZiB0aGUgQ1NGRSBjb250ZXh0LCBzbyBldmVuIGlmIHRoZSBoYXJkd2FyZQ0KPiBiaXQg
ZGlkIHNvbWVob3cgZ2V0IHNldCwgYSBmcmVzaCB2YWx1ZSB3aXRoIHRoZSBiaXQgY2xlYXIgd291
bGQgYmUgcmUtbG9hZGVkDQo+IGZyb20gdGhlIExSQyAod2hpY2ggaXMgaW5pdGlhbGl6ZWQgemVy
b2VkKS4NCg0KSnVzdCB0byBjb25maXJtLCBpdCBpcyBhIG1hc2tlZCByZWdpc3Rlciwgd291bGQg
aXQgYWxzbyBiZSBjbGVhcmVkPw0KVGhhbmtzLg0KDQpTaHVpY2hlbmcNCg0KPiANCj4gVGhlIGxv
Z2ljIG9mIGNsZWFyaW5nIHRoaXMgYml0IGFwcGVhcnMgdG8gb3JpZ2luYXRlIGZyb20gdmVyeSBl
YXJseSAocHJlLUd1QywgcHJlLQ0KPiBleGVjbGlzdCkgY29kZSBpbiBpOTE1IHdoZXJlIHdlIG5l
ZWRlZCB0byBzdG9wIHRoZSByaW5nIGJlZm9yZSBwZXJmb3JtaW5nIGENCj4gaG9zdC1pbml0aWF0
ZWQgZW5naW5lIHJlc2V0OyBhZnRlciB0aGUgcmVzZXQgdGhlIFNUT1BfUklORyBiaXQgbmVlZGVk
IHRvIGJlDQo+IGNsZWFyZWQgdG8gYWxsb3cgZXhlY3V0aW9uIHRvIHJlc3VtZS4NCj4gDQo+IE5v
bmUgb2YgdGhhdCBpcyByZWxldmFudCB0byBYZSAob3IgZXZlbiBtb2Rlcm4gaTkxNSkgc2luY2Ug
U1RPUF9SSU5HIGlzbid0DQo+IG5lY2Vzc2FyeSBmb3IgZXhlY2xpc3QtYmFzZWQgZW5naW5lIHJl
c2V0cyAoYW5kIGV2ZW4gaWYgaXQgd2VyZSwgWGUgZG9lc24ndA0KPiBpbml0aWF0ZSBhbnkgZW5n
aW5lIHJlc2V0czsgdGhlIEd1QyBoYW5kbGVzIHRoYXQgbm93KS4NCj4gDQo+IEJzcGVjOiA2MDM1
NiwgNjAxODQNCj4gU2lnbmVkLW9mZi1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVn
cy5oIHwgIDEgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jICAgICAgICB8
ICAzIC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jICAgICAgICAgICAgICB8IDIw
IC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDI0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9y
ZWdzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+IGlu
ZGV4IDRkNWNkMWI2ZjUwZC4uYzRjODc5YTllNTU1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgNCj4gQEAgLTE3Niw3ICsxNzYsNiBAQA0KPiAgI2RlZmlu
ZSBSSU5HX1RJTUVTVEFNUF9VRFcoYmFzZSkJCVhFX1JFRygoYmFzZSkgKw0KPiAweDM1OCArIDQp
DQo+ICAjZGVmaW5lICAgUklOR19WQUxJRF9NQVNLCQkJMHgwMDAwMDAwMQ0KPiAgI2RlZmluZSAg
IFJJTkdfVkFMSUQJCQkJMHgwMDAwMDAwMQ0KPiAtI2RlZmluZSAgIFNUT1BfUklORwkJCQlSRUdf
QklUKDgpDQo+IA0KPiAgI2RlZmluZSBSSU5HX0NUWF9USU1FU1RBTVAoYmFzZSkJCVhFX1JFRygo
YmFzZSkgKyAweDNhOCkNCj4gICNkZWZpbmUgUklOR19DVFhfVElNRVNUQU1QX1VEVyhiYXNlKQkJ
WEVfUkVHKChiYXNlKSArDQo+IDB4M2FjKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2h3X2VuZ2luZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5j
DQo+IGluZGV4IGIzODBkM2NmNmQzYS4uOTFlNjQ0MDY3Y2M0IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2h3X2VuZ2luZS5jDQo+IEBAIC0zMjcsOSArMzI3LDYgQEAgdm9pZCB4ZV9od19lbmdpbmVf
ZW5hYmxlX3Jpbmcoc3RydWN0IHhlX2h3X2VuZ2luZQ0KPiAqaHdlKSAgew0KPiAgCXhlX2h3X2Vu
Z2luZV9tbWlvX3dyaXRlMzIoaHdlLCBSSU5HX0hXU19QR0EoMCksDQo+ICAJCQkJICB4ZV9ib19n
Z3R0X2FkZHIoaHdlLT5od3NwKSk7DQo+IC0JeGVfaHdfZW5naW5lX21taW9fd3JpdGUzMihod2Us
IFJJTkdfTUlfTU9ERSgwKSwNCj4gLQkJCQkgIFJFR19NQVNLRURfRklFTERfRElTQUJMRShTVE9Q
X1JJTkcpKTsNCj4gLQl4ZV9od19lbmdpbmVfbW1pb19yZWFkMzIoaHdlLCBSSU5HX01JX01PREUo
MCkpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBib29sIHhlX2h3X2VuZ2luZV9tYXRjaF9maXhlZF9j
c2xpY2VfbW9kZShjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlDQo+ICp4ZSwgZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0K
PiBpbmRleCBjNzI1Y2RlNDUwOGQuLjlkYjkxNDU4NDM0NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2xyYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMu
Yw0KPiBAQCAtNjgyLDI1ICs2ODIsNiBAQCBzdGF0aWMgdm9pZCBzZXRfbWVtb3J5X2Jhc2VkX2lu
dHIodTMyICpyZWdzLA0KPiBzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpDQo+ICAJfQ0KPiAgfQ0K
PiANCj4gLXN0YXRpYyBpbnQgbHJjX3JpbmdfbWlfbW9kZShzdHJ1Y3QgeGVfaHdfZW5naW5lICpo
d2UpIC17DQo+IC0Jc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShod2UtPmd0KTsNCj4g
LQ0KPiAtCWlmIChHUkFQSElDU19WRVJ4MTAwKHhlKSA+PSAxMjUwKQ0KPiAtCQlyZXR1cm4gMHg3
MDsNCj4gLQllbHNlDQo+IC0JCXJldHVybiAweDYwOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgdm9p
ZCByZXNldF9zdG9wX3JpbmcodTMyICpyZWdzLCBzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpIC17
DQo+IC0JaW50IHg7DQo+IC0NCj4gLQl4ID0gbHJjX3JpbmdfbWlfbW9kZShod2UpOw0KPiAtCXJl
Z3NbeCArIDFdICY9IH5TVE9QX1JJTkc7DQo+IC0JcmVnc1t4ICsgMV0gfD0gU1RPUF9SSU5HIDw8
IDE2Ow0KPiAtfQ0KPiAtDQo+ICBzdGF0aWMgaW5saW5lIGJvb2wgeGVfbHJjX2hhc19pbmRpcmVj
dF9yaW5nX3N0YXRlKHN0cnVjdCB4ZV9scmMgKmxyYykgIHsNCj4gIAlyZXR1cm4gbHJjLT5mbGFn
cyAmIFhFX0xSQ19GTEFHX0lORElSRUNUX1JJTkdfU1RBVEU7IEBAIC05ODAsNw0KPiArOTYxLDYg
QEAgc3RhdGljIHZvaWQgKmVtcHR5X2xyY19kYXRhKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSkN
Cj4gIAlzZXRfb2Zmc2V0cyhyZWdzLCByZWdfb2Zmc2V0cyhndF90b194ZShndCksIGh3ZS0+Y2xh
c3MpLCBod2UpOw0KPiAgCXNldF9jb250ZXh0X2NvbnRyb2wocmVncywgaHdlKTsNCj4gIAlzZXRf
bWVtb3J5X2Jhc2VkX2ludHIocmVncywgaHdlKTsNCj4gLQlyZXNldF9zdG9wX3JpbmcocmVncywg
aHdlKTsNCj4gIAlpZiAoeGVfZ3RfaGFzX2luZGlyZWN0X3Jpbmdfc3RhdGUoZ3QpKSB7DQo+ICAJ
CXJlZ3MgPSBkYXRhICsgeGVfZ3RfbHJjX3NpemUoZ3QsIGh3ZS0+Y2xhc3MpIC0NCj4gIAkJICAg
ICAgIExSQ19JTkRJUkVDVF9SSU5HX1NUQVRFX1NJWkU7DQo+IA0KPiAtLQ0KPiAyLjUzLjANCg0K

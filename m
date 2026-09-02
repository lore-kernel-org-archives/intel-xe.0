Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450A8C624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 09:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD6310E1FF;
	Wed,  2 Sep 2026 09:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1PpqlzI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE2F10E1FF;
 Wed,  2 Sep 2026 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788341413; x=1819877413;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cjHGlh0fsadzwYuLJTi3WKlkcq8Uh/RTe8bsGCeS/xA=;
 b=d1PpqlzInoo0BtFHtZZo876SXeftQFxDCYEyCGxKstWfV9MGEs9/SWsn
 plMk5Lsozp2tNlCTIpVhMmnI0yhzIsotPrg1Jeqk0yDT6xZ4enWovOJnh
 uRf4MxFumNgyTBh9+n6VjLaYcYVXNCDBj2ID+FIEsJRPiv1mrsca3fPgG
 yEK+Xkb49G8d/VvVuoph1qC2KwqhOtv8cZhZdlLaMQbhLUf6XwKzEi6CR
 9hF9Bm6pEEFq4XzgmrD4nQ9kaha+fsVzvzWHhGrB/t2hTYHbmgPdU9Djs
 1OdSuG7G1JX2baYTpiM2JGY+HBmZKt69UNDZahR+OYk4M6ANY3dpgZkV1 w==;
X-CSE-ConnectionGUID: WpQFEBokRhaHAXOWENwChQ==
X-CSE-MsgGUID: GnUR7w4BT3Sr2/bb3WImKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="76343038"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="76343038"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:30:12 -0700
X-CSE-ConnectionGUID: PEs5kqUvS8OPYoZCE2Ruwg==
X-CSE-MsgGUID: Wquuc8h1TyutNQjbm1i+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="265648928"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:30:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 02:30:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 02:30:11 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 02:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUVZ24g9fQUkEUk74gAL2MBCkBaBtCmE0nhiLzMd8eCyaYgdBY38hf29w8cRey4cI0lRAOv/jJrGXCvc/MNjFFf4j5h7eRpZCWq1K6Jdm0cxak1Vr/0PPvXLkONN/Dn5+ZqtvLOEuZfhtKJ2l1rHEbEAf9hEzZQua9ArKVpyrGIZjieI5o4FQFR6I1z1KMtv0xm8aJ2b9/Inr5PFQB7mUYUblpxEVqmlL91TD7FlaECpcI6FHU/UiyI+F89RYiZbYrfZoy3ps4LLlvj9UzfTmHdhHp6fi7G6UjuR2DYZDCoaGjFElzylXp/1iLFHCl0kpMAnrk3fTsZ701Zrv5bgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjHGlh0fsadzwYuLJTi3WKlkcq8Uh/RTe8bsGCeS/xA=;
 b=FMK2q4yc+IGnZbW/LkCEWIcjWUmax8cnFvTe612vl4311n5SlTWYfxXF7Vtphll2zCMpaOCjayrSWL7pTyNw48m8cFtL63yu5juAFVOQroUZ3/Z8hmyyywzFNm9WEnrLxYLqNnX6VrPcJsbau5K/5xiwaZ3+hKF40hIB7jgEj4iidf6MZfXbLP0uJ2y3KBjNpL/GgUu1Y1KNBM2SqpBnQaTLZRx3P3MzSaDNAJPcOoDm0mq3fE/0Np2aehcL8ojdckdNVlOXHEvtKys1ROpm5tY7gSePyrne7hFTYeTAacotrLyOAuM+KYna3Hw54p6+vgIHwmrArO2FGB69pl9KPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB7759.namprd11.prod.outlook.com (2603:10b6:8:10e::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Wed, 2 Sep 2026 09:30:06 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 09:30:06 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 08/15] drm/i915/alpm: Half LFPS cycle calculation
Thread-Topic: [PATCH v5 08/15] drm/i915/alpm: Half LFPS cycle calculation
Thread-Index: AQHdNFm1X7IpLkzDMU+O/O+9kE2/Jba7BRaAgAANfIA=
Date: Wed, 2 Sep 2026 09:30:06 +0000
Message-ID: <5460cebd29879ac3919586492511bd2056bb8cf3.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-9-animesh.manna@intel.com>
 <dfbac2e7a2a2be4bb2d7bad8aabdd0b24e88cfb4.camel@intel.com>
In-Reply-To: <dfbac2e7a2a2be4bb2d7bad8aabdd0b24e88cfb4.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB7759:EE_
x-ms-office365-filtering-correlation-id: 1042f273-3dce-4667-099f-08df08d4c64a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|38070700021|11063799006|10067099003|3023799007|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: bTlBwdqybNXyeDLTAKG/3pio/teW8S2jwH+KbvAeiaS4rUmt9zcmzldYgqjA5iKEXhP09apdxnQXdsXjFiiYzL7XGQ55NrhMKsWUbxCu0hPcfiVDS6vGehgiYSkrjlEH5lhYUCtc+S/wwyPUiB6roN2vpQlupuvj3ZaQoLxWEB7sBaXjfWruqDwhaKpL/xFRBhbDAmZxyyI1jVpiLCu/JLdi0DTJQr6oXu7t2Q+4dgYCJZHAkBWTGZyFtjS2AjgtoPMt+kg8DQikU1aPgOlOvQASvg+rbCMiHDezSCuUFGyVr4AMo+03fMk1r7/VJhK9WT5HIlcG2eKoGgoEKzc5CCsvDaKISvHNI7B6Y5ph645nQAhSwYJ+tt+diFlWIxp1bmI6oTEC04YLUhmDOXymeAW+hrgbGbOQa4qqDWMmoltd5+76miQuyG4QxiTxC+0NVOnMyEajL2ebwBaLrOyZyOKg7ARjB1mUfD3PufuolQcHHmAF5YZpzUikVSK+NhBFB0gtzkjYXiMTZBo/7IfncTDkZ+w97a3HQOknUAgIrunixmoB9GgEqD2WxSr8hhI76jXLCoROw43mK3dytnDMd5919j2w/e37r55x8D5DFfZMOTmIpJAVgV5t8/GXyWnBklvwdotohWfdJUfSAkyZR5/+vP2EdYKd1ETZyVab1QakX+CfmS1KenU/cHbLHd//ObAWr1+AFmfn27rzstLTkJKEP2wxbTLsJNjokNrGtnU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(38070700021)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejRMR01ja3FTMkRFQTQvYzcvTk1tR3dpRmVaN3RxYytLSWpmVjJFcW9jeHI0?=
 =?utf-8?B?S09sVFRYalVwUFRzRktsUE05dGI3NXNYVTJpWjFxTWpaZCtaRGNEU2NRU1Jj?=
 =?utf-8?B?YzlKaWtQbitpb0ttVlIzbDhUMFYzSlo4czRqM21BQlVuNEsvbSsyeE5iVDJq?=
 =?utf-8?B?T0poV0NVUUkwM0hoazZnaU1YK3Jpa0RGQzROL1h3WUg3elFXRHN5cWxjVGkv?=
 =?utf-8?B?N05kKzR2SW0xQ3I1SGtJckRHTktlUTEwVVh5cmdab3VLcS9MZTJ5cGJxcGNu?=
 =?utf-8?B?aG1YMlJDWU9TT0hSUm84RVRpcTVNYU02QXF3bFdPY2t1RDhYSXp0c2I4eXIr?=
 =?utf-8?B?S3U2VzFQenFmcGZ2bk5EeDZURE5tckFMVUdod0hzVjdaQXlPdHh3UkhZSElz?=
 =?utf-8?B?eGd0TkFzYTEzdDlxWGZDNldQZEp0ak4wRmtNUEJxdUNMNGdnaXlOSUx2b2g5?=
 =?utf-8?B?WGc1TU0vS29pTlFhUzk4aU12cUNuV0JQRmk3SlF5c1hQVkU0eG8xWVZxUjJT?=
 =?utf-8?B?S3JkaDd3SGdML3JVdnI0bHZSb3hvalJHQnN3Nk85ODd0SjdiMVBLTC90VE0x?=
 =?utf-8?B?NWpPTmhnUlJlYU1PWlpKNktJN3dYU2ViMEQ5MjU2WExnSlF1M2pac2lJUXMv?=
 =?utf-8?B?VWVOSzBRVDFvQ0NkbW5DTkJnMWg3WU4zamZkWkR0Y3VFT0FpcmlEMmFpcjVl?=
 =?utf-8?B?TG9WUnJaTzRWRWJmRHB1VHcwanRmMUJTR0Y0OXRkSklieEdmTHk4TElQWmZ2?=
 =?utf-8?B?YTNDZnkrVGlTZXpqNzI2K2V5RUhwUjNRbzZpS1lpYm9uclJ6ZkVrYVBLWWEx?=
 =?utf-8?B?UUdrTUE3cGwxV2JvTWM3NmpSWWE3MHEwWk1vNzdmVlphTnJXUWo3ZlJOcnps?=
 =?utf-8?B?NnBNTzJhN0VVNVdsTlI2MUFudnk4NElmdkRoRytJWm9nVHpGcGQrdEdzYmNH?=
 =?utf-8?B?dXdzTERlU0lhRi9pcGFneCt4TG5WcGxuUm8wTWhZaHViR0pSQlpHa0V3Mmxl?=
 =?utf-8?B?b1JQYmp4bzkrTjdaaEJPL2VmUTFXTnNXc1JFcUgvZklBa3Z0VzV5MXJSaUpw?=
 =?utf-8?B?SjdCUDk3MUdaYVhUeDhPMlBtZis2OS9LY0ZHbVNVUklDSXFwcVhmdXIrZ09u?=
 =?utf-8?B?RTBHQVlkYmR3dmJUVTRnRXBMVWJZb052S1poaW5IU2xBNXZ6Ym9WcnlUbitO?=
 =?utf-8?B?dVdQMGhCOFF3eXpueHkrVFVQelZwa21HZG5kbnV4OG1LbzFWQ2dYdkg5ck9U?=
 =?utf-8?B?bFRWSEVkV0hJaGFCd2VDYmovQmExRHJGdHBabk1aMzFGd3lVZ1U4cFNXdnVp?=
 =?utf-8?B?M2s2K3N0SnB3TTIxdmVSUXQ5TU5FbkZET2pOTy92c05EVTRvODZjYVlpdjli?=
 =?utf-8?B?Z0FPQnJEbVo2QWE0VlRISlRFbm00eVA2aW1qMjhSa2g2WDFqUm9Ra0c4d3Er?=
 =?utf-8?B?WmZPUjNOZmU5OXZGbmxoQUE4aldkdXpmbnY2WWlqYVpLRTBCNjl4a05FRUR4?=
 =?utf-8?B?b2VFVlR6alVoUFNMVnpuaFEzSUcvbjJxcWtnWWdQaGFEMGJ4VlJPVU1MYkNN?=
 =?utf-8?B?RnFURWdWVmcrYXlTQzFNYmp2UlhkL0p3K2g5ZytuREZrTWVTMW45S1F2VjQ2?=
 =?utf-8?B?MnFtSkhvVHZ0V2xpWUhTR2d2bUk3U2YwVUpSbS9NM0dEdUJMdXhyc0xlRytR?=
 =?utf-8?B?VVhyalF6eFk4b1JFK0VaVW9tNG9uY1JLZGZyNURxcHkxY1owd1cycEF2T1VM?=
 =?utf-8?B?NUMvMk1kcFJ1QnJ1YURpWHdDdWJtWUZVeGdyUnVSWXF2WjJKTHE4d3Vyd0dX?=
 =?utf-8?B?bmY0OGpqZVd0RnY1dEQ1WWJXTmlIVDM2ME5kenBpdzZGcjN1MzhvVWdtMzVP?=
 =?utf-8?B?WEFLKzFMa3JQNlpzZzh6TEdRNGFnM2lick1DVEU5bVA2b25tTDZmT2F5T2gy?=
 =?utf-8?B?d2NPV1BIK0t5bng1MGtSY0RhcEtXWmZjMWZlSlJyczZFUFU2ZUJZMUhxY0VC?=
 =?utf-8?B?NEdFTmQxeEVaTDFFOUdLb0l6VVJpM1BlUGlnam9BU1JnQ1FmVGZjSW1RUTBD?=
 =?utf-8?B?N25mQ0pTWjA2QjAxbWZnQzFNSjZhLytOOFpYU0N0UFBkV0tIOXZ4NjlVRzBQ?=
 =?utf-8?B?Q2lvWFVSU3RDSkpWaWVmTGNNWCs1Qk1ycjlWOFBNajRhb09GYWljRHNyTFE5?=
 =?utf-8?B?SVcwMDU0OEg5bnZQaWpBYWNWWEtCcDVBS1dmWWJSbDZKdXBiSFozK2V4MjFE?=
 =?utf-8?B?SkU1UmphRmQ0anJxODAxSjhlMjR0VHJkRkFGTzVyU3hTditoS0Y4amhtWGRz?=
 =?utf-8?B?QXdwNENzQlZBeEtmRGxNVnpsRnVCdFh4eDdwVTBTaTNuc3pHTE5VTzNISWhK?=
 =?utf-8?Q?vTZsBjsY7A3qN0HY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8896DF5907D854392874391FEA398FC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uIrZUeBoovreum1gPbU2mpr4n/CNqTEkqoG0Qninv9NXSlIAWZ49FMP+6JJVGQH3xzz9mu7dfO2xWeG3tYagw2oggXwHMfZSPeiGhQ9wj59cxw0a0H8tGxfOOm8ykCJ5xqTXfaovNMTjGmu3ek1KRDhvXka8s42jeDEod3F4i6mybQuj/EHcJ/yBhKx9p6ecSgwslrlIalq2Nd4y1IXindwLQ+L5S71K6s0G8ZO1JDUd8lH8ZHvASyRjbSaVKEsn8+z1/qSs0FKi3QuhrmiVjsVXOu+7O2o0gM8+H/l/Xgav1vwy6My5j0b7wki2wsVOfN0wiXBLgEUYF3FMAKXgnA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1042f273-3dce-4667-099f-08df08d4c64a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 09:30:06.2174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAzbVf+EOeBOuk8bn5oIT7Elavy5xebEnVTbw+wOg1S3+sKnJZ0LwClyxIFh9Ydd7yJuYxgXsPV97A2CNJ3HcI1YaWPHqg9NGC+216c0IIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
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

T24gV2VkLCAyMDI2LTA5LTAyIGF0IDExOjQxICswMzAwLCBIb2dhbmRlciwgSm91bmkgd3JvdGU6
DQo+IE9uIFR1ZSwgMjAyNi0wOC0yNSBhdCAxMToxNSArMDUzMCwgQW5pbWVzaCBNYW5uYSB3cm90
ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgaGFsZiBMRlBTIGN5Y2xlIGNhbGN1bGF0aW9uIGZvciBE
UDIuMSBBTFBNIGFzDQo+ID4gZGVwZW5kZW50DQo+ID4gcGFyYW1ldGVycyBnb3QgY2hhbmdlZC4N
Cj4gPiANCj4gPiB2MTogSW5pdGlhbCB2ZXJzaW9uLg0KPiA+IHYyOiBBdm9pZCByZXR1cm5pbmcg
ZWFybHkuIFtKYW5pXQ0KPiA+IHYzOiBVc2UgaW50ZWxfY3J0Y19oYXNfdHlwZSgpLiBbU3VyYWpd
DQo+ID4gDQo+ID4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9h
bHBtLmMgfCAxOCArKysrKysrKysrKystLS0tLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiBpbmRleCAwNzhlMDRiYjY5ZDIuLjk4
YWE0MThhNmZmNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2FscG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYWxwbS5jDQo+ID4gQEAgLTgwLDEyICs4MCwxOCBAQCBzdGF0aWMgaW50IGdldF9zaWxlbmNl
X3BlcmlvZF9zeW1ib2xzKGNvbnN0DQo+ID4gc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNf
c3RhdGUpDQo+ID4gwqBzdGF0aWMgdm9pZCBnZXRfbGZwc19jeWNsZV9taW5fbWF4X3RpbWUoY29u
c3Qgc3RydWN0DQo+ID4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4gDQo+IE5vdCB5
b3VyIHBhdGNoLCBidXQgbWF5YmUgYmV0dGVyIG5hbWluZyB3b3VsZCBiZQ0KPiBnZXRfbGZwc19w
ZXJpb2RfbWluX21heF90aW1lKCkNCj4gDQo+ID4gwqAJCQkJCWludCAqbWluLCBpbnQgKm1heCkN
Cj4gPiDCoHsNCj4gPiAtCWlmIChjcnRjX3N0YXRlLT5wb3J0X2Nsb2NrIDwgNTQwMDAwKSB7DQo+
ID4gLQkJKm1pbiA9IDY1ICogTEZQU19DWUNMRV9DT1VOVDsNCj4gPiAtCQkqbWF4ID0gNzUgKiBM
RlBTX0NZQ0xFX0NPVU5UOw0KPiA+IC0JfSBlbHNlIHsNCj4gPiAtCQkqbWluID0gMTQwOw0KPiA+
IC0JCSptYXggPSA4MDA7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9DQo+
ID4gdG9faW50ZWxfZGlzcGxheShjcnRjX3N0YXRlKTsNCj4gPiArDQo+ID4gKwkqbWluID0gMzIw
Ow0KPiA+ICsJKm1heCA9IDE2MDA7DQo+ID4gKwlpZiAoaW50ZWxfY3J0Y19oYXNfdHlwZShjcnRj
X3N0YXRlLCBJTlRFTF9PVVRQVVRfRURQKSkgew0KPiA+ICsJCWlmIChjcnRjX3N0YXRlLT5wb3J0
X2Nsb2NrIDwgNTQwMDAwICYmDQo+ID4gRElTUExBWV9WRVIoZGlzcGxheSkgPCAzNSkgew0KPiA+
ICsJCQkqbWluID0gNjUgKiBMRlBTX0NZQ0xFX0NPVU5UOw0KPiA+ICsJCQkqbWF4ID0gNzUgKiBM
RlBTX0NZQ0xFX0NPVU5UOw0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJCSptaW4gPSAxNDA7DQo+
ID4gKwkJCSptYXggPSA4MDA7DQo+ID4gKwkJfQ0KPiANCj4gVGhpcyBpcyBnZXR0aW5nIG1lc3N5
LiBNYXliZSBpdCB3b3VsZCBiZSBtb3JlIGNsZWFyIHRvIGhhdmU6DQo+IA0KPiBpZiAoRElTUExB
WV9WRVIoZGlzcGxheSkgPCAzNSkNCj4gwqDCoMKgIGdldF9sZnBzX2N5Y2xlX21pbl9tYXhfdGlt
ZV9jeDAoKQ0KPiBlbHNlDQo+IMKgwqDCoCBnZXRfbGZwc19jeWNsZV9taW5fbWF4X3RpbWVfbHQo
KQ0KDQpIQVNfTFRfUEhZKGRpc3BsYXkpIHdvdWxkIGJlIGJldHRlciB0byB1c2UgdGhhbiBkaXNw
bGF5IHZlcnNpb24uDQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IEJSLA0KPiBKb3Vu
aSBIw7ZnYW5kZXINCj4gPiDCoAl9DQo+ID4gwqB9DQo+ID4gwqANCj4gDQoNCg==

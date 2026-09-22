Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6F6C982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 10:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE0B10E6B4;
	Tue, 22 Sep 2026 10:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jy98V2oF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B3710E6B4
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790072178; x=1821608178;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+jfcnhrPbyM4f9SvzYqAI45JVb971OMBkQcWL2knnPw=;
 b=Jy98V2oF/rmBSNViqJKgxwKqHwjCkvjv+X2o87NK0rBqwCp0KkwLXuPH
 uCFnIPEyRmjleCNUJOj0Kkp4m7L+L73m8GmNPfPm1GjbzwjE7146qWCMp
 ZM8JMTNvWGosq2RfwSqTqKBRqXM7lRi5cKsZ/g6JJQ9Yk12T7hsR+qrzP
 ebl9rFFgbSWhpCSOP3Rwoj6LpjtOMgxqJUCSXRMXUj9gEqlUGY1/wod8w
 7CPe6z7Ji/p2PwaL0I1CBbguSAUTJ+NKffFTzWsAOrF7tvddmBYSU4G42
 kJOA+eNE6okBVUSJZKCoWQIK2s5OrgA43N5Ha0kCfOPjI+BGVj+1dT4Eq g==;
X-CSE-ConnectionGUID: fHY3KG7XTDiYZWfu0H4+Eg==
X-CSE-MsgGUID: VIl7Zq7cTJCyzmLHcSJc3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89796023"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="89796023"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 03:16:17 -0700
X-CSE-ConnectionGUID: x59/OEk5TkmX9Jl7xIqkEA==
X-CSE-MsgGUID: T3hyFf+jTqCD51GBc5NdEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="271629704"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 03:16:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 03:16:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 03:16:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 03:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXJ96QmFdSDPwY+KIGQ/94PKqu0+s6JnsJ6sydn86ti3Mlwg5mQiw2eYctXkOoBEtcHXzpVix4H2kkhIJJrspIwAnkdmCZmdO2vriGSlYAiZ4dI9Eg5UeIfuZw/iAiuF2WTrY+s37AnZaUPx/NFziIjdaGZBoMV8h/LaP/AUNlSxih2riYLzVPX4Q13m1tcGOLLcDIxqrxXMqqmvZdU9DUJpwLTpJf/kupmrIZZQGgd1Pl20hJqCYpVvKmXZoEtHn+kRpctULn7LdGR4ToGuBLXHic7dy42M/1zs8INrMatZCv5tVzGbDw8dljgLz5wBHCKk4onCpcv83hSfi+F5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jfcnhrPbyM4f9SvzYqAI45JVb971OMBkQcWL2knnPw=;
 b=a24cT8zrA7BO1J5OHh2wHjSXnjhdm0O6MmH/JIwpUOXxE+DQZs0SyfiuIxdNR5RoHWSA0+MMh8ru9okxktf9zTIN5LyC4gpGVLTronWh//TubO57KbCXCO+E/+MVx9vmGi9FqQKMv+6+I37/4ZpRvldeLnCky5w7GEQBcYkPY1X2MO/vqpIN0FMiBcJiHGFyGlL1kDC/K23+MZS31pHA7bPnp4d7U1af8hB5NueeQXAItO8lNqHuNb2HtZstyNq0jLjyZ6WBhnK52F2wACBipd8rl6We7mli58LXgdFPJPV86ga+/b5QnDz7OQKfcKiYJixmjQdHWLRtU6S5qUhWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 10:16:08 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 10:16:08 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 06/13] drm/xe/reg_whitelist: Report whitelist overflow
 using structured xe_log API
Thread-Topic: [PATCH v3 06/13] drm/xe/reg_whitelist: Report whitelist overflow
 using structured xe_log API
Thread-Index: AQHdP39Cc3cKCBzVNEqKiHYLetyOXLbE/DKAgBV7KkA=
Date: Tue, 22 Sep 2026 10:16:08 +0000
Message-ID: <BL1PR11MB54136E44BD16466ED131C97FE2832@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-7-dnyaneshwar.bhadane@intel.com>
 <cf747ac7-829f-4dd1-a613-378325cf3cf9@intel.com>
In-Reply-To: <cf747ac7-829f-4dd1-a613-378325cf3cf9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|SA3PR11MB7464:EE_
x-ms-office365-filtering-correlation-id: 0ef88302-c0c0-426b-ce8f-08df189284cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info: 494QWpDev3K2IUDIYTzXg1id6/qPnQ9bnrdKb/x4Yi2MOFz/9fhTqIZ9djYxKLnJRefozyyMG9jS4ZphijsqGamkwvHirFMKIu1rM+uJ07imwKbTuD+vC+AktCm+j1a/ay+0+PJkqwJhA39pLkQHMdQ6Q4nt3UaGYbZr8edGZCqhTYoy85IB00tW3Zd3OhWmUd6sIG1HxEkdAXwXZeRk4Em356/arXZNDYEPTw6qQekuIA3MSu66FLMaNNZ64iPlXRrfH4mF5bVDtNAmwLF9h8FlWj0mTmKotrmpM1LQwTsKFwBG4A+pZgwmWgpI9n0FKNQeCP1kgesrfNSBmb2hW2T3dIYm2hWiA+sawMbe5ksOYYFQze/DnClp5IRpytsiamkomfeDDb2iYnO1dqvqn4gjTrIu5tCLvd+YHgFts95aFx+XfyKg+6K3/5vUHSFAUJxj+fbIhgCDLTw9mBlv2HuWqZdxOIdx9aVKbwkNWIjYxFwzMJXDXidoby9T29wP1/th/VVfPdwB+RBJDikH9/VXm0E1CYZO43Gsrr3uLOfp7YQEdvX94O9Tgk/0/+lncw+QTORfB2MJtUR3GsT57TyNff0aeAxYmI7pu/KawGQX19QqOP9XjK2FxkXYcVAoHPP75M3l0NuQv6obw3DglFEuGD0klsHqc3Y8WzEjbGRqBhHYZmmnviQ5KHoVu20NwaKdladxziTZKi3o5+4niw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG9BbWtPdG9YVFhSdkVrbmNaMDhyM05BYUhEcmhlNXJKZUUzbVdMUTlZK2Vv?=
 =?utf-8?B?RkpDSVBOTGFvcisvSmRVSU5qZTBSK0M0S2V6ZkdHb0dPR2pKbXdLQ28rOEYv?=
 =?utf-8?B?aFVaZU1JdG1oVTc5OG1pb0NoSituRGpWTVhzeTFJR1ZQWFlJODNXTFpRa3NZ?=
 =?utf-8?B?Y29WSTNqbWg5TC9EV2JXSW9xaVhHamo0WjBLbEc0bmVkQjE0RFpkWHgrQVFB?=
 =?utf-8?B?d0pUTUxESXdGSm90S0UwMmtCNmhabXdWa09mZ25JRk5Yc0orVWVVUDh1S1VF?=
 =?utf-8?B?WmovdzFidXBsejlXcnhnOXFjeVRrWlE4elJVY0FWUE81bXg5UTBOSkptZ1Zr?=
 =?utf-8?B?a1NHcW1GamRLOHV3RjRaMFMyNUZBWGJvUXkrNTY4dG1TenBrTUFvVHlzK1hz?=
 =?utf-8?B?Y2QyTVorbFZJZlNaeFpFRnVFeFBZeFQ1MThPcGZKL0JQbkh3czNxZi9ZNVg5?=
 =?utf-8?B?U0tPblFmMHdqUmtXOGlOelBReHY2eVZQUmNMUGRQSjBkZWZScGtUazkzZTVh?=
 =?utf-8?B?QXdiMEFzRmQ4U3QwNGRyVld4cDZ2ejF6NDNaQ21uNlRydkVmaGpSbXZrK0VP?=
 =?utf-8?B?eVNxZGszakplSjNLalY2VmprODU5Ujlzazlnd3dQOUtmZVBaeDNPTXNrWnNT?=
 =?utf-8?B?YUdudENJYTliZ0ZiZ2dHVU1kQjFSSE9INmpjeVNoR25VVzZ2VG8rNzNsZXVS?=
 =?utf-8?B?aXIwbEpoUXRaNUNsT044UjRhOEV2dWJwM3c0SzVDTDlGNlNnTFNyS29NVStj?=
 =?utf-8?B?WlF2WUQyaWpKWmk1RGU5WFl5QU1iVWUyTG9lWk9pbDlwMTd2WC8yZEJQUnBT?=
 =?utf-8?B?V3VPWEhVTHlOZnVJOFZqQ3NFR0Z5emhRR1h3d3FRZnZNTGE3SkR0TlFGTTNt?=
 =?utf-8?B?VFVZMUdoTWlSUlU2RnpKd21LaTA0NHZtK3pRdlpqQjdMOWNqTlFSUG9kbEZk?=
 =?utf-8?B?aDIzdmdqNkN3YmQyc1JlaWpuSkJ0OGdod091d1hjRWVLbElBVHhwaWp0aDNV?=
 =?utf-8?B?V21XU2xvK054M2FaMjhPUEVUNmMxRU82d0hzWk92TGVleE9QUWpzV2pNQzla?=
 =?utf-8?B?a3Zza1pBbExKMUZ3cVgzdkRiT2NiWDk1OEFsMytRZURCQzFXekNSdm91Vldz?=
 =?utf-8?B?TENzRllPQW9nZGlMWFQzTHVZT3NaSURwNzI2ek55TlZuV3R6M0Z3UmtZajgx?=
 =?utf-8?B?K3FNOFpMajNMN3F0bmxML3pZeEVWaFExckU3bmNvbTB5Y0hzSVFPak1VUzQ3?=
 =?utf-8?B?UFFWbGNTblRxVi9RSk03dDdGL0FwVEgzNmY2bnhuQ0ZZUTFTTWVqUnVhYUk5?=
 =?utf-8?B?elVnMlBoeTlnbXRKQkNaNDdNMFRUTVhSUnhtME9PWmRVTTNCbXI4eDNOQUhE?=
 =?utf-8?B?UmdyT01xemdvRlRVL3BGMUVkampaNEpOMDRWalNuVVNaKzVUYUtVN2dDMFNH?=
 =?utf-8?B?Nk5BbVNncXpQQnB1eVpic0N0TC9vYVJYdWd3dGRJWjdseDVNeERpUHlzQW1i?=
 =?utf-8?B?UVI2QWVjMllmZGF0OHhNandsYk1xT1g0RTRuV3QyRU1xbDJ1eFROQnlnWEJ4?=
 =?utf-8?B?Uzdxb0s4VlVrL1Q0S29xNDFuOUpGUnN3YktEbk1FMldsVDlzWjhvV2Y4UlEx?=
 =?utf-8?B?dW1vcjdHMWlWbFpLNFhlM1pWdmJpUTcvaGpidWVsZHRNTjl3WTFneG5kRjhm?=
 =?utf-8?B?TVlUeXdwNnZxOXZnT2taSTBrTFdyaU43NlQycE1OR2I1WmVIZ2lSNEp4c3pX?=
 =?utf-8?B?UXA5OGZBUmx6OXZYWU15Yis3TlVZei83aEMxeXdjMzU1REt3U3dQUGdCSUFZ?=
 =?utf-8?B?RVZDYWdvV1U2OHRlT2ZOZSt5K1BCWnBjQXlMK1lpTXFqaUhLUmM3Sk5ydVo2?=
 =?utf-8?B?c0p2NnRqVjlBNVEyZkRkb1RJQmI2aGI0YWREazh0K05qL1JEVGpwMHFnU2li?=
 =?utf-8?B?aTI5UGg5bm5CVk1yYlZkUnNsNWwybU82TVNNeFNtT2xLV08rek1lOStYOXB5?=
 =?utf-8?B?UjJJTkRZN1hwTlhvVEJkaWZ0TDd4d2Jjc3g2MVJxRjIzekUyVXk4d1VkOUlO?=
 =?utf-8?B?ZzV6SGR6WmV5OVluNTgveGZPVVI0SjlxRjZvK2syd0R6TWZzWitteTJnenNO?=
 =?utf-8?B?ZysyNE9iYUo4NW1XY2ZCeE0xenFFbDVLSEduRE1FeEg4MXV1b2R6SjZHeUJU?=
 =?utf-8?B?dVpOL3g5YzJpWmpucnQyelBoYkViVEZMcVBwNVlHRFBUeW1NQUpiNEFTcTFF?=
 =?utf-8?B?UnpzdVpoM3lOdkNDTUlQVVlZSFBqYko3bUpwUFczd0N3T1V0eUcyaG9NYzh3?=
 =?utf-8?B?QVBHQnh5OGpnUU9EL2I4eWNjWDFtNjdFMnR3WXlKaUxhVFVFNUcraHBhbXZN?=
 =?utf-8?Q?Zg6CeH/4fzzLwWds=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: d7ttg7qOD3mwdLadPV1iYy+XY2ap9PKc4HjbBINzISq1hud9HJZnjBdVSFsoi/l9k2WB8KZ120ty4WEXQAry8NbeZTnDymwfZNHDdtzD8KAw31xj0dwWaN7Px5NMyRJPU1TUxLhcsoAYityngHJRwagnVT5FyniVLoJWqOF05xEXLRUZLa7hr/v9xJFJT07L1fqgQmzHOxu54YCh8FDsAhubzdq7g8Gnm/PByO9DUswQ53SI5IeMEKcDCmM4gaY0Ip+JigAY8oqp/767gB8myHURZKNj7eHcpdyKb3wqPjsC798SXte9S+HetSpWRxil/BG5NhGBxdWjn6fg28sV2g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef88302-c0c0-426b-ce8f-08df189284cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 10:16:08.1617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ap3BbUA44nNe1iyDCGKj34jTRziAi6QTI4Qj88CzaisqfkJUFNYSyq6JZtTlzJ4FnsTqgbF3//1zSDCg2BKx2iNn7Li7vIqcJgvG8TxXfyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
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
YWwgPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1i
ZXIgOCwgMjAyNiAxMTo0MiBQTQ0KPiBUbzogQmhhZGFuZSwgRG55YW5lc2h3YXIgPGRueWFuZXNo
d2FyLmJoYWRhbmVAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MyAwNi8xM10gZHJtL3hlL3JlZ193aGl0ZWxpc3Q6IFJlcG9ydCB3aGl0ZWxpc3Qg
b3ZlcmZsb3cNCj4gdXNpbmcgc3RydWN0dXJlZCB4ZV9sb2cgQVBJDQo+IA0KPiANCj4gDQo+IE9u
IDkvOC8yMDI2IDEyOjQ1IFBNLCBEbnlhbmVzaHdhciBCaGFkYW5lIHdyb3RlOg0KPiA+IFJlcGxh
Y2UgeGVfZ3RfZXJyKCkgd2l0aCB4ZV9sb2dfZXJyKCkgdXNpbmcgdGhlIFJFR1MgY29tcG9uZW50
IHRhZw0KPiA+IHdoZW4gdGhlIG1heGltdW0gcmVnaXN0ZXIgd2hpdGVsaXN0IHNsb3RzIGFyZSBl
eGhhdXN0ZWQuDQo+ID4NCj4gPiB2MjoNCj4gPiAtIFVzZSAtRU9WRVJGTE9XIG9uIG1heCBsaW1p
dCByZWFjaGVkIChNYWxsZXNoKQ0KPiANCj4gbml0OiBrZWVwIGNoYW5nZSBsb2cgdW5kZXIgLS0t
DQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRG55YW5lc2h3YXIgQmhhZGFuZSA8ZG55YW5l
c2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9yZWdfd2hpdGVsaXN0LmMgfCA3ICsrKystLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcmVnX3doaXRlbGlzdC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcmVnX3doaXRlbGlzdC5jDQo+ID4gaW5kZXggY2FiMWI1NzhjYTBlLi5iMTUwMDRmYzU3
NjEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3JlZ193aGl0ZWxpc3Qu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yZWdfd2hpdGVsaXN0LmMNCj4gPiBA
QCAtMTQsNiArMTQsNyBAQA0KPiA+ICAjaW5jbHVkZSAieGVfZ3QuaCINCj4gPiAgI2luY2x1ZGUg
InhlX2d0X3R5cGVzLmgiDQo+ID4gICNpbmNsdWRlICJ4ZV9ndF9wcmludGsuaCINCj4gPiArI2lu
Y2x1ZGUgInhlX2xvZy5oIg0KPiA+ICAjaW5jbHVkZSAieGVfcGxhdGZvcm1fdHlwZXMuaCINCj4g
PiAgI2luY2x1ZGUgInhlX3JlZ19zci5oIg0KPiA+ICAjaW5jbHVkZSAieGVfcnRwLmgiDQo+ID4g
QEAgLTE4Niw5ICsxODcsOSBAQCBzdGF0aWMgaW50IHdoaXRlbGlzdF9hcHBseV90b19od2Uoc3Ry
dWN0IHhlX2h3X2VuZ2luZQ0KPiAqaHdlLCBzdHJ1Y3QgeGVfcmVnX3NyICppbg0KPiA+ICAJCX07
DQo+ID4NCj4gPiAgCQlpZiAoc2xvdCA9PSBSSU5HX01BWF9OT05QUklWX1NMT1RTKSB7DQo+ID4g
LQkJCXhlX2d0X2Vycihod2UtPmd0LA0KPiA+IC0JCQkJICAiaHdlICVzOiBtYXhpbXVtIHJlZ2lz
dGVyIHdoaXRlbGlzdCBzbG90cyAoJWQpDQo+IHJlYWNoZWQsIHJlZnVzaW5nIHRvIGFkZCBtb3Jl
XG4iLA0KPiA+IC0JCQkJICBod2UtPm5hbWUsIFJJTkdfTUFYX05PTlBSSVZfU0xPVFMpOw0KPiA+
ICsJCQl4ZV9sb2dfZXJyKGh3ZS0+Z3QsIFJFR1MsIC1FT1ZFUkZMT1csDQo+ID4gKwkJCQkgICAi
aHdlICVzOiBtYXhpbXVtIHJlZ2lzdGVyIHdoaXRlbGlzdCBzbG90cw0KPiAoJWQpIHJlYWNoZWQs
IHJlZnVzaW5nIHRvIGFkZCBtb3JlXG4iLA0KPiA+ICsJCQkJICAgaHdlLT5uYW1lLCBSSU5HX01B
WF9OT05QUklWX1NMT1RTKTsNCj4gDQo+IHNob3VsZCB0aGlzIGJlIGNvbnZlcnRlZCB0byB4ZV9s
b2c/DQo+IA0KPiBpdCBsb29rcyBsaWtlIG91ciBjb2Rpbmcvc3RhdGljIGNvbmZpZ3VyYXRpb24g
cHJvYmxlbSwgbWF5YmUgeGVfZ3RfYXNzZXJ0KCkgd2lsbCBiZQ0KdGhpcyBtYWtlcyBzZW5zZSB0
byBtZSwgZHJvcHBpbmcgdGhpcyBwYXRjaCBmcm9tIHRoZSBzZXJpZXMuIFRoYW5rcywgeW91Lg0K
RG55YW5lc2h3YXINCj4gc3VmZmljaWVudD8NCj4gb3IganVzdCBsZWF2ZSBpdCBhcyB4ZV9ndF9l
cnINCj4gDQo+ID4gIAkJCWJyZWFrOw0KPiA+ICAJCX0NCj4gPg0KDQo=

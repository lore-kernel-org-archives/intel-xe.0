Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E13AC44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 09:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3DA10E31E;
	Thu, 16 Jul 2026 09:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBJ14bVh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6993610E31E;
 Thu, 16 Jul 2026 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784195397; x=1815731397;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/IDR0972Oxg6GaOSIBQvuYV+1fkhibW85cvc21BvUMk=;
 b=XBJ14bVhY4YtoM0tcGP3hoUyK5f3Z7rleU2FaN3HnlPFqkxw7CsUDtKc
 BuZGgvAtIOTw5zYp/iBij1ubV4mIvfdRNf+kystnLyxqnIYU3qBa3oGAK
 yXkECuHAZl6EfOF4xBd6n0U8e5aC9vClDYftzv58fltmhGBhR/2+Cr+ry
 VGg30ul/er+QaTrV9YEEz4jeBP3isqr7l8uOZPgYO4q38WK8/ALWRlJvV
 5MhAXbsMzfLlP0THxCEAZtKqZoDbOCKzJFZeLA6oX/jLm5xz0rTpsyLyw
 0Fx+ywXj/S2MJzFjidc9AwQV+xREQEiLXjOv4ImJgSk7GTZgwQtHLy/D3 Q==;
X-CSE-ConnectionGUID: a/JLK017QJyhOKCGiu+jRg==
X-CSE-MsgGUID: gwp5vmXOTqG/MhCKkiEsIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95493513"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="95493513"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 02:49:57 -0700
X-CSE-ConnectionGUID: 0Mg4iu4yRmma3udEffk1iw==
X-CSE-MsgGUID: dpD0bRhoSwSe2Kfqv4NJ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="257098501"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 02:49:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 02:49:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 02:49:56 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 02:49:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLVfjKz75/Z0oWuONoFsrABp4OaOGvIlqrdfPtLnCAUu0asnd2TR77dPqwWinromZP31L80w/hkTsw6F3YqXZHJnZLaEt4OEjXRWB3MHknvlnGXLEqWX/K1Sy5IFPEOkUrzEnJ1F6yoXDaIczBAlkHhjltPVY/d3J5GJ5qXrQvGGa1jj8YKguMvNJomwDpM9MfF2y4QITR4wX1YbM2diXwwetv/yvIaXVeD+PzrKOneKBB3wIwOooocGQLaohy1bwdHBKFa6lLTGf6vtI12MixTZjNcJGns3rjkGrUlTREoWp1we1FoAWCxaMNACcG7aWBtEEgaRgSXjNtMrk4qeyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IDR0972Oxg6GaOSIBQvuYV+1fkhibW85cvc21BvUMk=;
 b=E/iXdGjhuwC7TuAr7h+U4kl3YbatHOklcdIv0a+A8gvWjCXtI/g13rxZxmKOBbSypxYdfuYotWkzjj2VVdPARJIgIrBwxd2lpy5EZg0DdwM3mnset9dR0Uc6xNOZ8RZ00dE3gc2HbfahRJpF8rXen4dE9U3zHS5LyhlAbH5+ZWHRJR6I0ckPVBi8IwoNWYF8DlXOjkdSFpXFioXZl0smknGFCink5dWyXHNpY7g0PTwJxmhFcZBs11dra/IehghcaLzGS6mQWSwa9CgFXyV5zGjhbJGojYBPnoYXN6BPAWwnvsn02aHYGR4CDpJ5Rth9SnQCfhcT/PW4q4AWEd3H0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by DSWPR11MB9715.namprd11.prod.outlook.com (2603:10b6:8:355::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Thu, 16 Jul
 2026 09:49:53 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 09:49:53 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: Re: [v3 2/2] drm/i915/xe3p/bw: Update bw calculation to account for
 16 channels
Thread-Topic: [v3 2/2] drm/i915/xe3p/bw: Update bw calculation to account for
 16 channels
Thread-Index: AQHdFGQuHscA7sXOO02Rey/+ejiUPrZv6B0A
Date: Thu, 16 Jul 2026 09:49:53 +0000
Message-ID: <e49302d4c6b3cb00dfb0be8762fb3a776a63f278.camel@intel.com>
References: <20260715143243.4141208-1-uma.shankar@intel.com>
 <20260715143243.4141208-3-uma.shankar@intel.com>
In-Reply-To: <20260715143243.4141208-3-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|DSWPR11MB9715:EE_
x-ms-office365-filtering-correlation-id: bf3405ee-2ab5-44ef-f604-08dee31f964a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10070799003|38070700021|10067099003|11063799006|4143699003|22082099003|56012099006|18002099003;
x-microsoft-antispam-message-info: iAdKZS9ioqHr2cOiYe2915pYsU3G0aFg8Gsfqf9mVwCN2pSgi3hYz6ozoR1yuzLtfBPjGo92uXaQdwGzBxJLYRJ2eGC/+ldU9ZEjZz/Ae9B7uBCoFHIjVDQSfBzWQUWKgogm3JQMRNpIkX8bvv6DaT9ECM1Su/13b8PfeNUSfIXoW6i3nbRSgIzHmUpfoxv0eUuqf5+QavFLIux3PSqFhoHAc28Ei8JQNWFI+TPs5z03ze6no7dgpeEQ0XYEJtsYhSQYWJebqzzlrS7iE2RFdmaicXzso19e5XS4q2Y7fNiyY6gz0il5VH4pZrZIgzItdXhHqnBa0Uuji83I6aIG6o/BK//Vao0M2jvfVXL3CjCZyMAh2gmayVXrra6k94KCTn5kvhjpDaYgd54luKcJswO2nC6jRRYmzYOxeori1HOnKvCGeAq2fY8V1yK4p7Xh4V/cZt7ij59EtsIA7l94j1ZN1HIK4WN+W+agO8d8kwc1YskgjSTWo7sw6RvXv7aU7M47pJKvIO4lCxRqY7ViChiUrb6w5jmLf9SCteOjswm8lF2ucKNoXkRYnfu2Mywv2tCX8lhmmXaOq22h3A1d35Fm0oBj81IN++8DGfys7erh93IIXBTY2BbxvC6V2B1szpGr3aFeXAJlwXkBhPDMujZgWAo/rsmMgmdpfteAmge3fNUs8mpAv/wynBPedRxvPTTVEVskzb1+3bybTVS+9mhPGYXbG1wZCOJdhBWgino=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(38070700021)(10067099003)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1RrMXNvemVvRXRJWkcrcjQrZktJb2hMNjAvSURpMGI0WXdESHpZMzRza3R3?=
 =?utf-8?B?WWxLUEo0cWNJemxTNUVjSHpzNUdnbEdxb21FQnZBWmt0dFBUdDNVR21TMWN6?=
 =?utf-8?B?VmlmRWVMQVNJbEZKSzIyMjBXT3hoaFVpYUJSbnBmMkl1NWNONHZEem93MXc2?=
 =?utf-8?B?TnZTMmJZaHdiL2hSVDlrSEpTcUlMTzF0OEtmdGljdks3R3htQzhyMDBZbUI2?=
 =?utf-8?B?bGR5aDJ1RGRRdC9obHNQQ0gxTS9ldDdLelE5TmxCcXhhaWxIcWs4aVdqRURS?=
 =?utf-8?B?bm1MeGpKRHlpbFU0Q2N3Ry8zR3RNMU8wMEJmR29ScE11TTA2aE1OYUN0elh6?=
 =?utf-8?B?SzgvenJtZEg4bmVPYXNBeFhDKzJ1Qm42MUFCRktjR3B2V3JsbytpZE5GK2Yw?=
 =?utf-8?B?VDBmT1FzeldaSWUzNmRaZzJDblpXZUJjWUpRSzZXY08veUNjSXBLQXJvMnZ0?=
 =?utf-8?B?VVNpNnNjVTF0TGIrRWxXMmVibzRhV2trb0l1alRrWDRXUzJER2JUZHJCYUlL?=
 =?utf-8?B?Y2RpSTZNd24rb1RyaGZ3Z0lZb1FBWlFHd3dObUVxWlMzd3BXWlk3TzJDTHUy?=
 =?utf-8?B?QTJRaEtKenVJNWZ3NzMwam9qTmowbm41M3A1dU5ZZnNFM3k1MERQdXJhekhI?=
 =?utf-8?B?QWlLT2FPdzM1Q2tjME8wSmJ6RWprUnFSdHhqYUhIUjdxM3plZzJjQUhPcm9X?=
 =?utf-8?B?UWQyZjJWR0oyZERHSmkwOWc5ck5CWlJ0WmpQQzIxZ2FpVWpMaWhHK0pXVFFW?=
 =?utf-8?B?SVdMbERMNG10bTRsbzEvWGpMNXFvUm9sTnZUcXJhWW5JdEI2eDd0UXpaRDVx?=
 =?utf-8?B?MWlTcVYzanNBWGFkTnJNTnZKdzZpNml6Zk5VbnRhb09qWStmU1BtWFhqbEZj?=
 =?utf-8?B?Ym42ejBzTWsyTnJRYkNYN3hERVhRNFM3dzB4VkNCbWRJb2hMVHlrdVM4dEFo?=
 =?utf-8?B?SDhHTTNNYmduaUkweGdROTNYeDFtbHlyK0FLbXl3UGZuOHkya0tadVh1TjZq?=
 =?utf-8?B?eTYrM3BiUXVaajF0Q09WRk42b0g3Y1Q3RThyTUlrVmNhMHFVRG9haFJmUVFX?=
 =?utf-8?B?bDdxaXdrWjAxc0hCdjBvMWNyWnI0aE9WN1p4K3B1OXZ4cmdkbm50OUFtVk40?=
 =?utf-8?B?YnY1OHdYTU1nME4va1E0Vk1WTWNUOG41M1g2TlJjMEcxMVRXemNvcmR2L3Bi?=
 =?utf-8?B?ZkJwVS9pTkhoS1RuVXBZcG1nbkIzZXlUM0pSUURlbXdOWEQ4V0EzcTMwenA5?=
 =?utf-8?B?bDVXSjkwN2FtdXc1K3UxcHJ4QW81QUMvTUpWYWp4NFJVenl0K3V3YVJvU2Nl?=
 =?utf-8?B?aExGSjVyMkFXL1crQUpaYUZ2M2plUEZVSit5bzRYVG1yckd2TWQxUXIxbkR1?=
 =?utf-8?B?L0pEVktuSTNKY1ZWeG9YQWR2MlBWaWo4NjFucXlyY1RRb01uS2lMWlFzTWVr?=
 =?utf-8?B?cHQ2RFlhazJNVVJBK1dyU09IMW9mSEUyQm9SMkFHLzI2ZnBUTmswaDhacWo3?=
 =?utf-8?B?OFRrTFE5REtVQXlNNG43bEYvd2ZLL0Q3Y1hSQW9lZyt0bmlDc3FnenJCaDJi?=
 =?utf-8?B?N1FwUi9JRkVFZ0QwSTM4ZURaT1BmM2hYcHJIQ3kzc0VSYUxmb1lDdTc5Y1lv?=
 =?utf-8?B?VVp0N1ZqdW8xQzVTbGtYd2tqWWxJcmZDYkhzMXZlYlFrWWRKRGdCNStRZndw?=
 =?utf-8?B?ZnJZMUU5V3hzVEdUUjYrMVJJdVRRVW8vMHZXRmZrMVkwSHhUelV3cXlIaG1y?=
 =?utf-8?B?VlJoOHhNV2h4MHFuL3hnOTNhUFRKaXFTN3pxR1RxL05RMDhmdUQzeFczeTg5?=
 =?utf-8?B?aTJudnYwNUttemVUQ1E4c2RoanNlMmcrUVp4RFA0M1IrVDlHVXBuYUJOMXRK?=
 =?utf-8?B?WnBxS2JNS3cwTzMwR2ozSWZhZXh0M0gyRTFkY1VNL0RLQW00S2NYQ1dmL20v?=
 =?utf-8?B?b2FCYUZGcVlZSzBUZnRqdVhmY3R4N2xJRU9vNXpvdy9Ia21zSW54TjNwVy9Y?=
 =?utf-8?B?VzE3bkpHNy9OYk1sTC9ndUxxYTVFbUxBU1pLeVU2eVJGUWRwMWgxNFhiK0hS?=
 =?utf-8?B?WlN0RHBtQU5jSVRVUnhVSDNORTAyaTdzNjVUYUM4RGxDMzUwQkg3MFJTMGVU?=
 =?utf-8?B?UkxmSjF0M0xSVG9iN3hiaGtOSGJrY2xnR1NWWmNobWhEQXNlUXo1d3dDZlZY?=
 =?utf-8?B?RlVTNzFxRHc2aFFBamMwcmdPMGMwV1k0R0xyR0dMM3pnS0xrNEo3Ly8vMlVR?=
 =?utf-8?B?bk9PYTFWbXh1K2dsemZMRUNvTHhnSHhHaFFyTHovWThvNTZlYm5mWWNJZkxk?=
 =?utf-8?B?U21kTlVoRHVyOS9iTkdNSUo5b2pwRlF3ZU83YlcybkpCY0tnNUZHNEoybDBN?=
 =?utf-8?Q?wbY7FTONi74GBT6EI918EirD+d0pFVaqmrK7T1TDAAetx?=
x-ms-exchange-antispam-messagedata-1: us1pDVmXyAgM6KoOPfshDJ2q4IFGsvRT1EQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CB1E00840CFA74E8BB90AB71A49EEBC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nGGF/EDG7Fj0OhweYZOfXjS6rHF90HAYceBF+am10ZuQMb0kJTPvC/4wayzcys5fZuPkcQ5OyF9izjvVOlg0kwXiPBnWSe68KeOcdYWAibD1VVob8UFxOyq4/fjchV3P3OVeT6jAQ3zl50wmuPF/TpngJ4XNCX6kOVxNivg5fmzz6js2PzkFezoOK6M398yK/Dlgdg/X7nJWKQLJ4HTkmhvMoq8WM2pY6eK2bI1/othy5XGMTT2x7E3ILEJuTa67bSdzWNehaZahazkmk12dLUFRrxe/f81bzSaaT0cX0X7SKS3UfvB6E5r+KPA0oMjFV4eYeT3ln1xP21J5fd8RJA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3405ee-2ab5-44ef-f604-08dee31f964a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 09:49:53.8105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +wjX2EWGHLuQsrYmkFLSCajM2g0gENdGDBWAmVo8zfNoCFLqonfxznPR5LY/SIDKJfH1rPBTmoNNhsvxjX+YigRB0mmXV3K17UScmrnalx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9715
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

T24gV2VkLCAyMDI2LTA3LTE1IGF0IDIwOjAyICswNTMwLCBVbWEgU2hhbmthciB3cm90ZToNCj4g
V2FfMTYwMzA4NjIxNTc6DQo+IFVwZGF0ZSBCYW5kd2lkdGggQ2FsY3VsYXRpb24gdG8gYWNjb3Vu
dCBmb3IgMTZjaGFubmVsIG1lbW9yeQ0KPiBjb25maWcuDQo+IA0KPiB2MjogTG9naWNhbCBzZXBh
cmF0aW9uIG9mIGNoYW5nZXMgKFN1cmFqLCBWaW5vZCkNCj4gDQo+IFdBOiAxNjAzMDg2MjE1Nywg
MTYwMzA4NzUyMjMNCj4gQnNwZWM6IDY5MTMxLCA2ODg1OQ0KPiBBc3Npc3RlZC1ieTogQ2xhdWRl
OmNsYXVkZS1vcHVzLTQtOA0KPiBTaWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5r
YXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2J3LmMgfCAyMCArKysrKysrKysrKysrKysrKy0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCg0KcGxzIGhhdmUgYSBsb29rIGF0
IHRoZSBwYXRjaCBzdWJqZWN0L2Rlc2NyaXB0aW9uIGZvcm1hdCBjaGFuZ2VzDQpzdWdnZXN0ZWQg
YnkgU3VyYWogT3RoZXJ3aXNlIExHVE0NCg0KUmV2aWV3ZWQtYnk6IFZpbm9kIEdvdmluZGFwaWxs
YWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2J3LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2J3LmMNCj4gaW5kZXggNDE1MzlmZGZlYWM1Li5hYWEwMzUwZGNh
NzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYncu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2J3LmMNCj4gQEAg
LTE0LDYgKzE0LDcgQEANCj4gwqAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV9yZWdzLmgiDQo+IMKg
I2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMuaCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfZGlz
cGxheV91dGlscy5oIg0KPiArI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfd2EuaCINCj4gwqAjaW5j
bHVkZSAiaW50ZWxfZHJhbS5oIg0KPiDCoCNpbmNsdWRlICJpbnRlbF9tY2hiYXIuaCINCj4gwqAj
aW5jbHVkZSAiaW50ZWxfcGFyZW50LmgiDQo+IEBAIC0yNzIsNyArMjczLDE0IEBAIHN0YXRpYyBp
bnQgaWNsX2dldF9xZ3ZfcG9pbnRzKHN0cnVjdA0KPiBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5LA0K
PiDCoAkJY2FzZSBJTlRFTF9EUkFNX0xQRERSNDoNCj4gwqAJCWNhc2UgSU5URUxfRFJBTV9MUERE
UjU6DQo+IMKgCQkJcWktPnRfYmwgPSAxNjsNCj4gLQkJCXFpLT5tYXhfbnVtY2hhbm5lbHMgPSA4
Ow0KPiArCQkJLyoNCj4gKwkJCSAqIFdhXzE2MDMwODYyMTU3DQo+ICsJCQkgKiBYZTNwIHN1cHBv
cnRzIGEgZnVsbHktcG9wdWxhdGVkIDE2LQ0KPiBjaGFubmVsIExQRERSDQo+ICsJCQkgKiBjb25m
aWcgKDQgbWVtb3J5IGNvbnRyb2xsZXJzIHggNA0KPiBjaGFubmVscyk7IGVhcmxpZXINCj4gKwkJ
CSAqIEQxNCsgcGxhdGZvcm1zIHRvcCBvdXQgYXQgOC4NCj4gKwkJCSAqLw0KPiArCQkJcWktPm1h
eF9udW1jaGFubmVscyA9DQo+ICsJCQkJaW50ZWxfZGlzcGxheV93YShkaXNwbGF5LA0KPiBJTlRF
TF9ESVNQTEFZX1dBXzE2MDMwODYyMTU3KSA/IDE2IDogODsNCj4gwqAJCQlxaS0+Y2hhbm5lbF93
aWR0aCA9IDE2Ow0KPiDCoAkJCXFpLT5kZWludGVybGVhdmUgPSA0Ow0KPiDCoAkJCWJyZWFrOw0K
PiBAQCAtNjI0LDEwICs2MzIsMTYgQEAgc3RhdGljIGludCB0Z2xfZ2V0X2J3X2luZm8oc3RydWN0
IGludGVsX2Rpc3BsYXkNCj4gKmRpc3BsYXksDQo+IMKgDQo+IMKgCWlwcWRlcHRoID0gbWluKGlw
cWRlcHRocGNoLCBkaXNwbGF5X2J3X3BhcmFtcy0+ZGlzcGxheXJ0aWRzDQo+IC8gbnVtX2NoYW5u
ZWxzKTsNCj4gwqAJLyoNCj4gKwkgKiBXYV8xNjAzMDg2MjE1Nw0KPiDCoAkgKiBjbHBlcmNoZ3Jv
dXAgPSA0a3BhZ2VzcGVybWVtcGFnZSAqIGNscGVyY2hwZXJibG9jaywNCj4gLQkgKiBjbHBlcmNo
cGVyYmxvY2sgPSA4IC8gbnVtX2NoYW5uZWxzICogaW50ZXJsZWF2ZQ0KPiArCSAqIGNscGVyY2hw
ZXJibG9jayA9IG1heCg4IC8gbnVtX2NoYW5uZWxzLCAxKSAqIGludGVybGVhdmUNCj4gKwkgKg0K
PiArCSAqIFRoZSA4IC8gbnVtX2NoYW5uZWxzIHRydW5jYXRpbmcgZGl2aWRlIGNvbGxhcHNlcyB0
byAwIGZvcg0KPiArCSAqID44LWNoYW5uZWwgY29uZmlncyAoMTYtY2hhbm5lbDogOCAvIDE2ID0g
MCk7IHRoZSBtYXgoLi4uLA0KPiAxKSBmbG9vcg0KPiArCSAqIGtlZXBzIGNscGVyY2hwZXJibG9j
ayA+PSAxIHRoZXJlIHdoaWxlIHByZXNlcnZpbmcgdGhlDQo+IGxpdGVyYWwNCj4gKwkgKiB0cnVu
Y2F0aW5nIGRpdmlkZSBmb3IgPD04LWNoYW5uZWwgY29uZmlncy4NCj4gwqAJICovDQo+IC0JY2xw
ZXJjaGdyb3VwID0gNCAqICg4IC8gbnVtX2NoYW5uZWxzKSAqIHFpLmRlaW50ZXJsZWF2ZTsNCj4g
KwljbHBlcmNoZ3JvdXAgPSA0ICogbWF4KDggLyBudW1fY2hhbm5lbHMsIDEpICoNCj4gcWkuZGVp
bnRlcmxlYXZlOw0KPiDCoA0KPiDCoAlkaXNwbGF5LT5idy5udW1fcWd2X3BvaW50cyA9IHFpLm51
bV9xZ3ZfcG9pbnRzOw0KPiDCoAlkaXNwbGF5LT5idy5udW1fcHNmX2d2X3BvaW50cyA9IHFpLm51
bV9wc2ZfcG9pbnRzOw0KDQo=

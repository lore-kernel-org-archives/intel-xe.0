Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDBEEB362C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 20:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C46A10E5BD;
	Mon,  2 Mar 2026 20:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hV9vpgrj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B5210E5BD
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 20:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772484619; x=1804020619;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nWCANlDM70B5Elr/h4FRo7bMagHJxcTU5ld1GotZM2g=;
 b=hV9vpgrjOtebRM38fmcHSvnPPXdazZYmibaqArN7h5HtmQRoiw4FcTq4
 OKvnrC8QE83/sCvk4uYg0QcTys7cia0UfdfFkDGnEpD514af6P8Ntt6TR
 E10Xwc1bpYrkFIdaFB8MAJucAzoQjrD3WH7DEMZU5v7GdKt6nbdG1OmQf
 euDdrbcJhVt5+XxQv4XGlYOAhFJuv+Bl1LPeSAnKlk/i8dT134+W8ELMU
 2POM354QiHhOoKbwoc8xBUL3HH9xocMSjT9ec2tVRMaZ6LIjTSs0C4dFl
 dyqQURNbx+yvG/86BbyZDaHnzXHEi/A4n6S9QHiw4DSxIAJ17n8jpgQEy Q==;
X-CSE-ConnectionGUID: Tv+boxcsTq2rrumKFfwnDQ==
X-CSE-MsgGUID: IGJRDJbKSH2ODSLvMqByZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84974200"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84974200"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:50:19 -0800
X-CSE-ConnectionGUID: EidSNkYAT+6cDnq7ChuyEg==
X-CSE-MsgGUID: +EGTONJJRCGcjcAzNuAzpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="248276176"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:50:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 12:50:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 12:50:19 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 12:50:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFsH1nvCh1/fVj7rQfhPLpKcdwudChmbGuWOkL7K+rckjk6qimsJv0IUb43DX9i7WWfnrXoQsNnHX/lrt0PG3yXxxtQIRVkTQA7iKV4WJ0++s+pctgDMPNQQOrJYxlnvrmNNeng/v0jcz9Y+y3gGHpy+8APL6EuJLkBYUVZWdHikyGYXQHL53BBqZBau/t+LDTzlFlfEpFu+xTQ7AmINPg++rMMo8qXO9eXMj9yYZoe3QP6e+zOMEPODNShSqTao1CmNBzX/JPYBBZlXXjVR+3+4+gjj58xnWOevFZAMXmD0wFAxlLiAB5LjeGFBSP22gkZq2xbAxHH++uR/a7UGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWCANlDM70B5Elr/h4FRo7bMagHJxcTU5ld1GotZM2g=;
 b=HpjX2SY6zlCWA5m4Qmbjle08U6YfNUPF2cPwA9L7Frw8tP5KesZ/Njc+xcnQd7sJfHn+Y5lG0ePuj+XxgxMGxbifV7tOrGbPz0fSCpBjs3dehx68/aht2SZutY6JIlis/0/j7wtr0w6mow0lH8QQwjvp03j5PE+uJ9LBVZhoG7VFToH3utn9khIIeF5JZAvyzfKNucfLluLkH3UwsRrkZnMvURMUsqOQXOC/8OWZ8ViH+ItZHJ8nZBtY/+884/0udRKl5on5mVlQJr8ZPWiGoKOzOitqSc84aluepwSUQhKRvgEoMMfZdW1fvGAVKGN4QIA33NltH3rMse2vT0+lVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH3PPFF1A08ABF9.namprd11.prod.outlook.com (2603:10b6:518:1::d5f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 20:50:11 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:50:11 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav,
 Arvind" <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 03/25] drm/xe: Decouple exec queue idle check from LRC
Thread-Topic: [PATCH v3 03/25] drm/xe: Decouple exec queue idle check from LRC
Thread-Index: AQHcqFKAUNfvNZ13i0KIe9mS5ua2BbWbu6uA
Date: Mon, 2 Mar 2026 20:50:11 +0000
Message-ID: <a88781b47e972b47ee6e46a3347f6293d36d9e39.camel@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-4-matthew.brost@intel.com>
In-Reply-To: <20260228013501.106680-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH3PPFF1A08ABF9:EE_
x-ms-office365-filtering-correlation-id: e8ec54bb-4e71-4e9a-28e8-08de789d4bf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: HQQ59MOakge4IY9q41x+wX9RXi/zWzJIUMYdXsal791y1vCKmRRh5aIjsNLrvA7NssK/mRi4Jne+L4Bl+6N8CJ+BD4rjskolCVW2ddBo2ST3MrhYXmopS0OzuTyKCp0zABhM3kKd//wL/aQyzEh7eZ6cDCQP0XpoVw1cJo2Hyc9EB8u1w9A7JT0LFZl8Cx5bhgOF6iDszTCb7Vv8WSMvbmrkRqru+/+kVqWo1jniEeSi1pku7fxhmmiATGKWM82JsLKNXPRu6xCGT4D+02Kha8fei29h66yvqMoW8ZjBmUZ8T63iKxHwkl6gj6FCuUZXmSIu5dQ43x7/XX2uqGXMfK+aa/HdVJKUdNK+a4MmSiIZbYQ0WcE6PBARpvylNXQed07W/GfN5sRc4VbrWixBj9YD31Z6YH0zeB4YQQ4vTVMiVJt/cMXU5XJ394pGTW8QI1kq+FPzFbsCalw0u6hzVe0PDmy3nBMYfaJywhhkUdYnnQgXuANtDtkzDeyt83w6aZq6KnU258oPJB0HYkwZkRtmjvckqLVljrHvr2Kc1UxDHohtnnfoWLZsdlownuB/3bs0ssS9HNgpAtHfKS1nxeDLgubmE1xYQi/fnVwmg4klOXvCizOpCW3Otjkpnkld3POANFreUfLnJfgQhzZvUqTDHCrjcN21X2qavdyd6cuBCxKDE9t9+gyaeXyQR55fKWoLcuGdt0lhV/LtOkzar2V/Fd5b/FhGeINDRqyO14pliOj7HxXaCoN9L7ewa4nl95BiaLSa5SU9ysrM4zYynAU8pKbCHn6eFPqolVGC/70=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzExTHNwK28yQmwzMFVtdGhMVkYwQkYwRkZaYjZoWS8wL1hXd01GbEZicGVl?=
 =?utf-8?B?Tlo1LzJ3cTUzYm15RFZWRVNpSXE4SVBkbEZoWGJzVUxpbGRHUFFhdHVYOW1F?=
 =?utf-8?B?cXAzUkhlYm5BTmZ6K3VvdHNUZnNySkdzUVhXNk1kVkxaQ25vUFZ2MU9xamtT?=
 =?utf-8?B?bFJiM2pwdEZmemhaWVFHT04xNGIrVlJGUlZ0TGRMU3V2WmZKOEVRZDJDQTgx?=
 =?utf-8?B?SWdyd1pMZ3JyZWJEY2lIRUhhK2VPbXd3TFkyRGxVV3JoR09JYUNKaW44eERz?=
 =?utf-8?B?elliU2hNRjNLNXZpanhkUVZ6NkVMQXFuMDBiUS8vMlowSUJqUzNQMkRpajdl?=
 =?utf-8?B?QW5FU0UrL1hmSXczQnJ3M2k1WVpJQm1xNFNsNW9Va3RBVnJzSFFHa0ZNQXpF?=
 =?utf-8?B?TkduOVdkOTlkWHRlMTlhR3p1bHZYYjhPSlZsbWk4T0dGNlZmN05vb0JlSUpp?=
 =?utf-8?B?UzE3amx6Z05oMWxON0pRdGZpVkdpUVR0aCtlbnhoYkFOSFFUTW1hOHFVaEdt?=
 =?utf-8?B?V1RtTUtOenBCbXcxWlJlUFZ1RGs5SmNVZzNnUHpWMzBrT1EyMkhOT2lXSy83?=
 =?utf-8?B?L0t6STFRTEhhMUVCTU4xdEYrc3UvNmFZSDBmdkxoUzk3N1dXbHp2UTlEM2E5?=
 =?utf-8?B?NFI0eHAwemRqRDRvdmhEemRNOWk1QldPQVFGMFlOTW0xODh5R1pZRFhJY3p0?=
 =?utf-8?B?clBzK1VacG1OY2tYZE9rS01zNnBDdmlGNGM4ejN6R0taSllFM2hCcHVMT3lP?=
 =?utf-8?B?d2w4cjZRZjU2b1Zzb2pmVzJKYytJRmdTVmxlSWp1UW1GMmRuMjAySDJiandI?=
 =?utf-8?B?VTJIYmpYSkNyRDFxK1NFZjEyaFpTejRmY2lBLzExYzJpeU5qbWEzOHo4S3Bu?=
 =?utf-8?B?Qm5yVmYwRkVQR2NZeDVCUlFuR0F0M0JJNlN1WTB0QkNTQmNjYllVM3VlREtW?=
 =?utf-8?B?L2lZeEdlUW5BMDV0bWtBNUdKa1lvVE1wWTg4ZHhXbHJkRkFnaCtlQmI4akF4?=
 =?utf-8?B?UlByUzh3TnFhaDRUcGh2TVowSEhuUkV0OTF6Z3JySWY5WW5NbitQTWlGTkZF?=
 =?utf-8?B?SXZ1eHQzTW9aRUlFeUx2NmIzVXF0aFp3YnlSRklkekNjZGFNb1FLa3E5ditU?=
 =?utf-8?B?bjFYZ280MGhBaTFxSlZaVVpTTytscGU4L0VLUDl5OGk1eGRuN3d5OUN3eG9E?=
 =?utf-8?B?Szk3aUQxNW02UGNueFgxTGtXMVZqOUxYbnh3d2pBTlNSeG9nbzBxZjBsaGYr?=
 =?utf-8?B?WGZyYW90cWkvWVkzNzJUUWRUREdOdVpmYVljTkM1NWxhWUxsWGxzSlZ4eGwy?=
 =?utf-8?B?aThQR2RkcUxtaURLLzlxUmc0R1ZURktXQXVSc2I3OW0zQzNiN0dWY2Vzc2Fr?=
 =?utf-8?B?SzY2UHplN0dDT2ZCTFQ1dnJNd29mZzcyYzVNUnVJUWVMUkN1d2FDTkhqUXBW?=
 =?utf-8?B?dFhJSUNzclkxWEZYbTk3MFhZZ25BMXQvdUUxYitMcjNCMHJGS3h0cTdSNUoy?=
 =?utf-8?B?MUZqRkZXVkNNMHdoR3cwUmVqL0R0R3Q4WHA5TzgxNUFWNi8wMEZvd0JXc2pV?=
 =?utf-8?B?SlpPT3RQNHoxL3pHREF0am11VkZ2UzVNc3lqYStsSVRWUFozNWxuc3ZpQUtp?=
 =?utf-8?B?eTdrOVFrQmlNbzQ2Y1cwalRPeDA5STdBekEvS205TWt4UjBrWUhHZkw1bjJj?=
 =?utf-8?B?eUgwT0pZSUwxNlV0blA0algrZ2VaRTFGYW1ELzRZazRQczBjZjczbmdtdldn?=
 =?utf-8?B?c3hDYUJoaWNvYmJCVy9GUlpRREl5WEdpdHJSaHo1WGcreCsrT0NBOXhuK0Jm?=
 =?utf-8?B?ZzNtVVZRWW1zR3RrWlVZc2FCMmFWVys5eEFKcFN1eFFhNlVIZklCeFhrTGl4?=
 =?utf-8?B?ZUM3UklZOUNaMjRITTA0eFZXOUw3aUEzc0wyTE9HVjJPa2N4cEZQa0ZQQ0tD?=
 =?utf-8?B?NU9QWWE0QVdvMG5IdllhRkVFb3RsNmdxY2lNY0VKNzVwc3NsWkt5dXc3ai9q?=
 =?utf-8?B?c2gvM21ENjBEVnRqanpZb0RGOXFTc1IvUjVPejFuQ3ZySmhYNFpJTXV5VXJF?=
 =?utf-8?B?RkhaSlY4V3VWZ3htV2xWOFYyZTRLVEtKKytJVE5aQUd5cE9FY0w2dVRxZUJv?=
 =?utf-8?B?R3htWi82VHZoVjgwM3IyWWNQc1J4Vi9NY3ZVa3RrQXV4amZUbWVCcUs2VUw5?=
 =?utf-8?B?ZDhzaUtqTDRJV2VwcTZ6UHRXTnlRVUVDYTBDNC9qekR2QnVWWW5kS3JFcnlr?=
 =?utf-8?B?Sk5sU3d0WHVMdTJpbHZUWjFvZjQ4QnYrVWh2Z0duTFdSUTZ5NmM4cEYxQTVS?=
 =?utf-8?B?WERHUXFRTmY1OUVXbXlHcXpBclVWNytwWmtJVUJicFkyRWZsMVpsV3dhRk1E?=
 =?utf-8?Q?rPHwXMVxpZ74uo6Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CA3039D44DB7147BAA26A41C5DB66EB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ec54bb-4e71-4e9a-28e8-08de789d4bf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 20:50:11.2615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GwWB9vF2ZCjLyEIxqB0JN2B74PxCDjyMLLE7FCm6FQrxpwNtJ/a6IajVrn0+yk1w8Aod0MKGi5ku9BwEfi89pRqUj3GDH4viZkJ2q6rf0Sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF1A08ABF9
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

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDE3OjM0IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBXZSBhbHJlYWR5IG1haW50YWluIGEgam9iIGNvdW50IGZvciBlYWNoIGV4ZWMgcXVldWUsIHNv
IHNpbXBsaWZ5IHRoZQ0KPiBpZGxlDQo+IGNoZWNrIHRvIHJlbHkgb24gdGhlIGpvYiBjb3VudCBy
YXRoZXIgdGhhbiB0aGUgTFJDIHN0YXRlLiBUaGlzDQo+IGRlY291cGxlcw0KPiBleGVjIHF1ZXVl
cyBmcm9tIExSQy1iYXNlZCBiYWNrZW5kcyBhbmQgYXZvaWRzIHVubmVjZXNzYXJpbHkgY291cGxp
bmcNCj4gaWRsZQ0KPiBkZXRlY3Rpb24gdG8gYmFja2VuZC1zcGVjaWZpYyBpbXBsZW1lbnRhdGlv
biBkZXRhaWxzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1
ZXVlLmMgfCAxNSArLS0tLS0tLS0tLS0tLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDE0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9leGVjX3F1ZXVlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1
ZS5jDQo+IGluZGV4IDJkMGU3M2E2YTZlZS4uYjNmNzAwYTlkNDI1IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9leGVjX3F1ZXVlLmMNCj4gQEAgLTEzODIsMjAgKzEzODIsNyBAQCBib29sIHhlX2V4
ZWNfcXVldWVfaXNfbHIoc3RydWN0IHhlX2V4ZWNfcXVldWUNCj4gKnEpDQo+IMKgICovDQo+IMKg
Ym9vbCB4ZV9leGVjX3F1ZXVlX2lzX2lkbGUoc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+IMKg
ew0KPiAtwqDCoMKgwqDCoMKgwqBpZiAoeGVfZXhlY19xdWV1ZV9pc19wYXJhbGxlbChxKSkgew0K
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IGk7DQo+IC0NCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBxLT53aWR0aDsgKytpKSB7DQo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX2xy
Y19zZXFubyhxLT5scmNbaV0pICE9DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHEtPmxyY1tpXS0+ZmVuY2VfY3R4Lm5leHRfc2Vxbm8gLSAx
KQ0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9DQo+IC0NCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiB0cnVlOw0K
PiAtwqDCoMKgwqDCoMKgwqB9DQo+IC0NCj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIHhlX2xyY19z
ZXFubyhxLT5scmNbMF0pID09DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBxLT5s
cmNbMF0tPmZlbmNlX2N0eC5uZXh0X3NlcW5vIC0gMTsNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJu
ICFhdG9taWNfcmVhZCgmcS0+am9iX2NudCk7DQoNClN0aWxsIGxvb2tpbmcgdGhyb3VnaCB0aGUg
c2VyaWVzLCBzbyBtaWdodCBiZSBoYW5kbGVkIGVsc2V3aGVyZSwgYnV0DQpqdXN0IGxvb2tpbmcg
YXQgdGhpcyBwYXRjaCBhbG9uZSwgSSdtIGEgbGl0dGxlIHdvcnJpZWQgdGhpcyB3aWxsIGNhdXNl
DQp1bmV4cGVjdGVkIGlzc3VlcyBpbiB0aGUgZXhlYyBxdWV1ZSBjbGVhbnVwLiBUaGlzIGZ1bmN0
aW9uIGN1cnJlbnRseQ0KZW5zdXJlcyB0aGF0IHRoZSBqb2IgaXMgaWRsZSBmcm9tIHRoZSBoYXJk
d2FyZSBsZXZlbC4gVGhlIGNoYW5nZSB5b3UNCm1ha2UgaGVyZSBtb3ZlcyB0aGF0IHRvIGEgc29m
dHdhcmUgbGV2ZWwgY2hlY2suIEFuZCB0aGlzIGlzIGdldHRpbmcNCmRlY3JlbWVudGVkIGFuZCBj
aGVja2VkIGJlZm9yZSB3ZSB0ZWFyIGRvd24gdGhlIGV4ZWMgcXVldWUuIFNvDQpwcmVzdW1hYmx5
LCBHdUMgYW5kIHRoZSBjb21tYW5kIHN0cmVhbWVyIGNvdWxkIHN0aWxsIGJlIGRvaW5nIHNvbWV0
aGluZw0KaGVyZSBhbmQgd2UncmUgZmFsc2VseSB0ZWxsaW5nIG90aGVyIHBhcnRzIG9mIHRoZSBk
cml2ZXIgdGhhdCByZWx5IG9uDQp0aGUgZW5naW5lIHRvIHJlYWxseSBiZSBpZGxlIHRvIHRydXN0
IHVzIGhlcmUuDQoNCkZvciByZWZlcmVuY2UsIEknbSBsb29raW5nIGF0IHhlX3NjaGVkX2pvYl9k
ZXN0cm95KCkgd2hlcmUgd2UgZG8gdGhlDQpkZWNyZW1lbnQgYW5kIHRoZW4gdGhlIGV4ZWMgcXVl
dWUgcHV0Lg0KDQpTbyBteSBxdWVzdGlvbiBpcywgaG93IGFyZSB3ZSBndWFyYW50ZWVpbmcgdGhh
dCBoYXJkd2FyZSBpcyBpbmRlZWQgaWRsZQ0KYWZ0ZXIgdGhpcyBjaGFuZ2U/IEFyZSB3ZSBtb3Zp
bmcgdGhlIHNlcXVlbmNlIG51bWJlciBjaGVjayBzb21ld2hlcmUNCmVsc2U/DQoNClRoYW5rcywN
ClN0dWFydA0KDQo+IMKgfQ0KPiDCoA0KPiDCoC8qKg0KDQo=

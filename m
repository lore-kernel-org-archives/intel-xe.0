Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3B9E7DF11
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 17:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4508910E535;
	Mon,  2 Feb 2026 17:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfjefNgQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6523710E535
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 17:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770054233; x=1801590233;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oYxFtS+hope8X6XBYV1iF4JhhKc9k9e9LvoHIZOhHFQ=;
 b=CfjefNgQA55bxCuuN20aajxiratdeJrL+WkioH76ChHBMBsxJEvGow93
 RgzqPRUG1kIuvzIucxNuzwENzr8jGMqdNAxIYocOWY5DVjxZdKavvgL2p
 jz91IW7Gh1WsDC53o6FUpIeXx0RM3OUgqxnQWPtBv3VJKJ2J1uFxbYGtL
 uNVImZQtz9R7HzwBkWjFNbnj296KXHRQciOQ2MC5ImpNvgBr5PJvFXkJH
 M11uh8ztECU+Xlvx5fW7ylwHVl9HDGytNt5UwSeq9nZhAVq1OuEkv7QDq
 bTgEbIWv6a7dz+oa8a4JPKAVOc498baJRNBb8rDET5VdUXin+BW7c6PSu g==;
X-CSE-ConnectionGUID: A5kxvKgsSiSKtCST3zzDCQ==
X-CSE-MsgGUID: DUo4nyceSFSwRQXTte0z4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81847657"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="81847657"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 09:43:53 -0800
X-CSE-ConnectionGUID: uvfONfybR3SaNBOHffW16Q==
X-CSE-MsgGUID: SIEbVIyQRLGW7hQSosdLwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209072136"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 09:43:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 09:43:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 09:43:52 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 09:43:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E87sL7uQEk+b1KsvIBJXAIQCvgpR+8ftMLt9bEY9zWQGA236prc6n1qymoQ1FoR/Omxapztg3EnokenSw5S9D0GEtd+VSCVlE9YOlsYrcl1FgqjTWyFcYgqt5+DkUcnPcVonNZgGero7lnlDsuDIsWLinuHtqRsyclvjr7vNFx9DsKD3mVVA5agWwaj8ZNQ41i8AG7C48qF/upGrkjU1akJMoMlwbrMEaLCh3xDoWeikymthQ9ngWpeg66Xx9K+7BpUvO5E0MIlxh+waIgwqpMfkn63N+Ad0MjWU0BYc9OP4CAfoctorzHwunX07yu7Jox0Sp4QlNjDAJvnV8hoUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYxFtS+hope8X6XBYV1iF4JhhKc9k9e9LvoHIZOhHFQ=;
 b=R2vtdURbGi5GnEONQ1KcOpxNkxvfhn8Y4Fu+Fc9gHulU8EsAC0zQavSzd02SkQXPB7MnHlM9ZnUzYnbUnj4u+8l7Nu5Ljmof6EBUqLa11s6jsjIRY93Jiq+u/fDPl8E1chEIFdZ4g/1I6RiCcNLPJ8eTeR5zsM1Z6tX880vS3RYGpZBxZhc7w3Ihqc8pQAe1fGfnHRmofgq25dPZUVmQ07uHz1u4MCUuQ8lW1TNzsEunUwqvgISwdDbutUVQlGIYYozeif58nXMO2ax+6RFnEtkA2EBa1Jo1C8E72qIvxLj/fZjozJzGIdQl7ObM5aYel73YNarKaVVscfImCYMlGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM4PR11MB6287.namprd11.prod.outlook.com (2603:10b6:8:a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Mon, 2 Feb
 2026 17:43:44 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 17:43:44 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v2] drm/xe/vf: Avoid reading media version when media GT
 is disabled
Thread-Topic: [PATCH v2] drm/xe/vf: Avoid reading media version when media GT
 is disabled
Thread-Index: AQHclDoyUdUzDHzJR0uDoV+4NYt9HrVvre1A
Date: Mon, 2 Feb 2026 17:43:44 +0000
Message-ID: <DM4PR11MB5456B59B8DF55B33D24956BDEA9AA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260202115041.2863357-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260202115041.2863357-1-piotr.piorkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM4PR11MB6287:EE_
x-ms-office365-filtering-correlation-id: 9d949660-812a-4553-9b79-08de62829c7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?d3Zsa1hHVytLeHkzMHQ0c1VKM1hCVkY5VDRjeFg1UmhqbWpEYWpnWmZNblFs?=
 =?utf-8?B?NFFJZVNvcE9WY1NHY3h0SW1xMnhUUzREMG5LN28rS3VnandjWEUvcldPNVBk?=
 =?utf-8?B?UUJKY3RyNWs2SGxrWWNJVFEzT052b2E1NG5HVm13Z2FVczBiOXdCd3NqOUhv?=
 =?utf-8?B?aTdjV0tZdW1hSVNUZzZaUUFDVkpLZzBhOHZ1aXpadFBFalRMcFp2emJieUVK?=
 =?utf-8?B?SUgzeFVJemxqcmNIV0lZNFBCSThhTjg1eFdlTzlhUXhGa0Q4WVJwMXFadlNQ?=
 =?utf-8?B?cWpFMnI0Mnk0b2ZFTGl4d21yaTZjMy9BZllaa2psZzc2ZExQdUFuY1pkam50?=
 =?utf-8?B?N2JWdTZmbjk5aUMxTmd4MnZiZzNvUkZZcWZlOEdoa1J4UnJ1VXhzZjNubHRD?=
 =?utf-8?B?dEtEMXJvclNGbzB6QlhrSjlITVBNWEVra2RNTUg1NC9uQXliTW5MZVRKdVE5?=
 =?utf-8?B?Ym5FYjdiaDYweDF3d3Ird0hKeGpBN1FmWmNTcWp0Q0MvaithLzY1WU1sWFVx?=
 =?utf-8?B?cm9PZmNLUEluaWcwem5ER1pVZ3dYRFQ1Ynhqd2NQVmZpaHp0M2FnYWxZdjNM?=
 =?utf-8?B?K0J2Ym8zTEs1OW9OSkxZbnFGOHhHUGpUdlFWSG5qbjlYcU9oM3EzMXNkUVBJ?=
 =?utf-8?B?Uk9WR1psd25kVDVOalV3Tlg4SmUxNFJKRkZmUVBnRjE5SE84Q2ZSbDAvOExS?=
 =?utf-8?B?RGp3S1YxRS9LWDErOHAvRSthWjVMK3Bzakg2TmNPYmNsa0VkOEJCa1NrVzBu?=
 =?utf-8?B?R2pkUy9PRGpxWFNmSWw4MS92dysyS3RhakYwTjc5T1o1aXd4WDgyMUJ1Yk4v?=
 =?utf-8?B?UExKRitxdnhHM2VDSVc1RmFPdWFqRWJiMU5LMjlubGh2c0hCZ0xLdVRNKzVi?=
 =?utf-8?B?U1VtVytGV2tKb0tZOUVCUEEya2ZvVTQ2R2tRRVZNa1UzU1NhT3ZZa3dSNGlZ?=
 =?utf-8?B?bTBPNDhaSlhRZjJZZS9vR2c5dUkzLzVUU2pkWWJmeU03bFBCVmZ3bWNkNm5u?=
 =?utf-8?B?OEhVQlRqZXVlUjFDRTcwemJKdHM5R29MUUNBaGZiVkRPaWh4dExONmxmemwr?=
 =?utf-8?B?Y0NQa3EvZzJPQlM1c1dJT29FVGxCd1BESDI3UHpOaElSMXR0QXg3cTM4cVhk?=
 =?utf-8?B?OVNZdU1qVU4xWXpwMXdnR3pVc2orQ2tEMkVWZUROcDdtR3ZkRGo0aU44ZmJu?=
 =?utf-8?B?V1ZyeGhVUkxhVFlJQTRwUmRnZWI2VDF3Rys5N0JDNU1BVmppeStqTnNXZkxl?=
 =?utf-8?B?M0ltTjRDWHNIWmE0UGNJZ3U1dU1LTTIxOGxVcEppOU56dEthY3ZiR3hWRHNJ?=
 =?utf-8?B?dU9xRjJYSiswOVRXS2VpTVpiTkJGTU5iYzZ3aCtwVUIwMFJBOEYyQiszaW1B?=
 =?utf-8?B?czZYZVZvdU41QkRvOXI2akVmTG1uT0c4a2U0czhObUl1azkySUJEV2xzeGcy?=
 =?utf-8?B?VU14VE5aVWNJS3gzc21Dc2dUbXhYa0FPbDNCTXd0dVQyc0FSQ2RURVdrMG5U?=
 =?utf-8?B?cnBRRDk3Z0p0MjVjMVBrbnA0N0ZuVTRjTU5lYWJ1ekpUaWJiZ1dDOGQyMitW?=
 =?utf-8?B?Z2lMS2JEa0ttZ3hvM1k3RytId0w5UWxBaGNLVGszTk9zLzNHN1gyam9zUFVj?=
 =?utf-8?B?ckJPSHN1eUdUc215NnU0YzJZZExjZGJRdUdGeGQxVjN5aS82UWtiTjdud0dP?=
 =?utf-8?B?aWhBTzRmT09CTkN6bklsd1lDdE9zUEZISytwK3B3TVU4YjlKM2ZZVGJKOXdm?=
 =?utf-8?B?cHYzOW9icWlOdGl6QnRMVGZTb1F3OWJWREVJSjZiZWgrSTRJZ05EVmlFL1Fk?=
 =?utf-8?B?ME4yME1XQkRJYlZhck5zWExPMURlNU4yMDFzNDhaTlNpQzRiYmdGdjIvQXl6?=
 =?utf-8?B?OFB1VTBROFN3SUp1OXBwNm5PRHA3bHRiWnUvRCttWDBITHdlZlg0dFJycHJC?=
 =?utf-8?B?VWdyMU5xOGh6Z2czenhwZy9NYlo4YnkySVhrTEQrWTBRWnh6eVlsNm1uTWlm?=
 =?utf-8?B?eWUzSGlLSHd0ZUY4VVoycm1xQlE1NXh6RU9seUV3MFlsTWtENE9oMUxoUTZi?=
 =?utf-8?B?TC85U3VEbGRZbzdSM3NrMkw4WFE0OTN0dG5qTkxhR2gwbmEzRUtXcmNjTVhj?=
 =?utf-8?B?SFdTOEthK1FZY3JiMkFDRU9GcEhhZ055dTZBeVoxSURCVStJR3JMZEloVXBr?=
 =?utf-8?Q?Ak+Uv32HRvCURc703Jq1T7k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXo2RHJGZzNjaysrNCtVUlJvcGdaenhKWXd1NGRKUGt4Z3krOWtiTmVvSXdS?=
 =?utf-8?B?UXF4RFkwOXcxRTBiQVlXVU1CZTBZN3dNQ0JodnY3cjV1K2FhUXlxamZ2ampv?=
 =?utf-8?B?Sk1lNlptSERJcnlVcEI5elJQN0kyYjhTYjRzZWhlNURJR2h0UTBGZkxOck4x?=
 =?utf-8?B?U29MTzc3Qk1Ya1J3ZFlHMUF0ZWo5N1BBTWxXanRsdUNwS0c3cDVUeGRjMkhh?=
 =?utf-8?B?VHpWV21vaFBPVk11bmFUNGlneHpQWmVIOXRqWWxraXNkdmdQbEt0RG12dHRE?=
 =?utf-8?B?aEJMM3lPUG9EdWp4ZEFLbFduNDA4aWlrNTZ6bnZyUDNGSnp5dElqSTVHWm10?=
 =?utf-8?B?QS84Q2FneU9GQVF2bXV2aXUya1RETlV6RS9JVFhDa3o3Y3I2aE9OWForeXFK?=
 =?utf-8?B?RnphaVBxeG5aSDlIUEhkcVUrMFlBV1dXZlArNnA5VkFTSlZZYXBSNWlTUkw5?=
 =?utf-8?B?aWxFa2R0VHZwVFdHS3I3d0lrbEVFeEFlcExkUWI3cjdZRHV4T1RIdSsreTlr?=
 =?utf-8?B?THIrVVBlWDJaUXFHZU9hTTl0clZ4RXlMKzVpWnVkU2k3cGViNHV3dVViMEwx?=
 =?utf-8?B?QnR4UjVOMVBjb3FtbHB6MkthdzQyRm8waTNsNXJZUTYzNzB1QXg0MCtmb2ha?=
 =?utf-8?B?dXJSeWdoYUZDNGxOMzVwdHl5bVlqS2dScWhuK0pmYnZ4WnM5UEp2bmlYbmJs?=
 =?utf-8?B?UDc0WVpxSGw0UWp6ZXBUK2pKMTN1Mk8zUTlQRHFqODBraVgyYjNiUjd2Sm4z?=
 =?utf-8?B?aEtCU09LbWIwL3V5bnpabVpMR2RqdUY4SGgyWURGQ0hPNkFwSFJuOXNwN1Bp?=
 =?utf-8?B?VG9MdFR2M0pKeksySHdoUWswOTBYcDhEaXpXb1hacmk2ZHdQVXAzbU1lM1hr?=
 =?utf-8?B?NjdIRmlMdEhYcCtwTW56cjQ0MDdtNHBYTm1SYXVyYmJlWndTdWVlektXdlZz?=
 =?utf-8?B?eTc0bG9WZHE1VGNPbVlZWDJWeUFlQ0xsMW4rciszZW9FYk9NZjVLcXg0Um9v?=
 =?utf-8?B?aEMwNU5HTzdyc21iSEFPdElTYjU0ejRIcGtmQ0ZXMGdFV2V3VGppRG1mcVBT?=
 =?utf-8?B?SzA1NHdSRSsxdFB5UU8yRDNFQ2xKRE5NWEVkWjFxUWFrellERmNsQkdDcms1?=
 =?utf-8?B?aTJPNTV4MWNjcU5LRzFFYUxsVkczQlJNTlBtMGo1VEpDZW84TlJiUExEMkFG?=
 =?utf-8?B?Z3hoZy9qRlZBazlBWFBadlh5THcvTEJybU42R3FOT3JxMWszRlFFeitFb2N6?=
 =?utf-8?B?YlBYc2F0dUM5MHpxTFVQZ3RjWDRybnpXRWU1K24zamV0UERiV3FCVzlCTFFt?=
 =?utf-8?B?emttdUh1b1FkMFVFejkvN1BxODA3WEJ4Y0dkbHlhaGxNWnhEelNBY1NiTHM2?=
 =?utf-8?B?MldNOEhEanYzK2w1MHhLY3c1NnpCdzFsUUMyUlVBd3hGUUsrVmFza0ZmZ0k3?=
 =?utf-8?B?a1pUOEhxNWkwRm9XNWUydlhFZ3VFM2JoVzAvUEJDRmNxbXNFb2drS095TlA3?=
 =?utf-8?B?MXVnajdLT3grazYxK0JUa2o3Z2RIOTBQZVo2RzRIWTRjVWlJdVJyVmNDQUxz?=
 =?utf-8?B?alFpaHN4dUk0emU5Y0lGaFlqMEhYTFJaN3h1KzRzUUFQelUzQjJUVmFmS3NV?=
 =?utf-8?B?VkNrN2JrNlM2VG1RM0JVRWRtWTJmVEt1ZFBnWkFwNndXV0pUSC8zWE5ISm1p?=
 =?utf-8?B?WmozU3ZBbzhMMW8vMFFIL0xBbzRSQ2p0M25EVlVoS2kyMjRRck1IVXAxcVd6?=
 =?utf-8?B?c2daUWxFNy9ETmgxVFR3K21CQU1HNFBqUGpuVmNBWU1sc0RSWFhYbitiS2ZI?=
 =?utf-8?B?ZzV5NG5Rbk5yU2ZEK2FXOUNGRit1cG1TclRKM3lLcWVhQlNJUkJzZ2MyTUdy?=
 =?utf-8?B?WklmV01NZmpYR1JCYW9QbFpiZERkZW1jQmFDR3RXeENWcHNuL2VuaFZPVTdP?=
 =?utf-8?B?VWMvUktnRHhlYjEwVFhyS1JjaDhLS0tqVzJ0SEJhd09Cd25qazRqRjgvdG1q?=
 =?utf-8?B?N0l6a1VTaXoxQzJUeGdzenIyRXpKVmN2KzU0d3N6Q0JpTkhvUlRIc2c5UDhE?=
 =?utf-8?B?S0NsamlBV05xRHNGUFc5eEZqUjJZTEtmM0dPSU5tL1VxOUdoN2Jpd0VYRXMz?=
 =?utf-8?B?dm1SbHE5SU5qMkZkR2pJTlhZY0VCNm93a3FnaWFUcFEwT0pYdlJzUExUZEZp?=
 =?utf-8?B?TkRXMWNZOGRncFFJZXBZanpKVkF4N0N3UkFQUEVFaXdieVNIMjhTQUd0OXpa?=
 =?utf-8?B?d1Y0ZXZTWUJSRHB6ejFkN1JsS29wNHYyYkVWdzU5V2txcDhqTHJGS1E4RmJ2?=
 =?utf-8?B?SUtmVHRGbFFtK0NXeDRpSWVEWkZ4WE80RklYTmgzOFduQXp5Zk5tUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d949660-812a-4553-9b79-08de62829c7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 17:43:44.1466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JWReLaQfy53VaRj94+oHUZCyrotGoGmajVjrd4yMSeeGqKIC3NzwsUokuQJN9h7jSlcGjFqpK1LDAbJXZ3AoEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6287
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

T24gTW9uLCBGZWIgMiwgMjAyNiAzOjUxIEFNIFBpb3RyIFBpw7Nya293c2tpIHdyb3RlOg0KPiBG
cm9tOiBQaW90ciBQacOzcmtvd3NraSA8cGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb20+DQo+IA0K
PiBXaGVuIHRoZSBtZWRpYSBHVCBpcyBub3QgYWxsb3dlZCwgYSBWRiBtdXN0IG5vdCBhdHRlbXB0
IHRvIHJlYWQgdGhlIG1lZGlhDQo+IHZlcnNpb24gZnJvbSB0aGUgR3VDLiBUaGUgR3VDIG1heSBu
b3QgYmUgbG9hZGVkLCBhbmQgYW55IGF0dGVtcHQgdG8NCj4gY29tbXVuaWNhdGUgd2l0aCBpdCB3
b3VsZCByZXN1bHQgaW4gYSB0aW1lb3V0IGFuZCBhIFZGIHByb2JlIGZhaWx1cmU6DQo+IA0KPiAo
Li4uKQ0KPiBbIDE5MTIuNDA2MDQ2XSB4ZSAwMDAwOjAxOjAwLjE6IFtkcm1dICpFUlJPUiogVGls
ZTA6IEdUMTogR3VDIG1taW8NCj4gcmVxdWVzdCAweDU1MDc6IG5vIHJlcGx5IDB4NTUwNyBbIDE5
MTIuNDA3Mjc3XSB4ZSAwMDAwOjAxOjAwLjE6IFtkcm1dDQo+ICpFUlJPUiogVGlsZTA6IEdUMTog
W0dVQyBDT01NVU5JQ0FUSU9OXSBNTUlPIHNlbmQgZmFpbGVkICgtDQo+IEVUSU1FRE9VVCkgWyAx
OTEyLjQwODY4OV0geGUgMDAwMDowMTowMC4xOiBbZHJtXSAqRVJST1IqIFZGOiBUaWxlMDoNCj4g
R1QxOiBGYWlsZWQgdG8gcmVzZXQgR3VDIHN0YXRlICgtRVRJTUVET1VUKSBbIDE5MTIuNDEzOTg2
XSB4ZQ0KPiAwMDAwOjAxOjAwLjE6IHByb2JlIHdpdGggZHJpdmVyIHhlIGZhaWxlZCB3aXRoIGVy
cm9yIC0xMTANCj4gDQo+IExldCdzIHNraXAgcmVhZGluZyB0aGUgbWVkaWEgdmVyc2lvbiBmb3Ig
VkZzIHdoZW4gdGhlIG1lZGlhIEdUIGlzIG5vdCBhbGxvd2VkLg0KPiANCj4gdjI6IG1vdmUgdGhl
IGNvbmRpdGlvbiBkaXJlY3RseSB0byB0aGUgVkYgcGF0aA0KPiANCj4gRml4ZXM6IDdhYmQ2OTI3
OGJiNSAoImRybS94ZS9jb25maWdmczogQWRkIGF0dHJpYnV0ZSB0byBkaXNhYmxlIEdUIHR5cGVz
IikNCj4gU2lnbmVkLW9mZi1ieTogUGlvdHIgUGnDs3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dza2lA
aW50ZWwuY29tPg0KPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4N
Cj4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiBD
YzogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQoNCkxHVE0uDQpSZXZp
ZXdlZC1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQoNCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgfCA2ICsrKysrKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBpbmRleA0KPiBiNWU4
OTM1ZmZmMWQuLmQxYzg4NWJiNzY0NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BjaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiBAQCAtNTU2
LDYgKzU1NiwxMiBAQCBzdGF0aWMgaW50IHJlYWRfZ21kaWQoc3RydWN0IHhlX2RldmljZSAqeGUs
IGVudW0NCj4geGVfZ21kaWRfdHlwZSB0eXBlLCB1MzIgKnZlciwgdQ0KPiAgCQlzdHJ1Y3QgeGVf
Z3QgKmd0IF9fZnJlZShrZnJlZSkgPSBOVUxMOw0KPiAgCQlpbnQgZXJyOw0KPiANCj4gKwkJLyog
RG9uJ3QgdHJ5IHRvIHJlYWQgbWVkaWEgdmVyIGlmIG1lZGlhIEdUIGlzIG5vdCBhbGxvd2VkICov
DQo+ICsJCWlmICh0eXBlID09IEdNRElEX01FRElBDQo+ICYmICF4ZV9jb25maWdmc19tZWRpYV9n
dF9hbGxvd2VkKHRvX3BjaV9kZXYoeGUtPmRybS5kZXYpKSkgew0KPiArCQkJKnZlciA9ICpyZXZp
ZCA9IDA7DQo+ICsJCQlyZXR1cm4gMDsNCj4gKwkJfQ0KPiArDQo+ICAJCWd0ID0ga3phbGxvYyhz
aXplb2YoKmd0KSwgR0ZQX0tFUk5FTCk7DQo+ICAJCWlmICghZ3QpDQo+ICAJCQlyZXR1cm4gLUVO
T01FTTsNCj4gLS0NCj4gMi4zNC4xDQoNCg==

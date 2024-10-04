Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E9DCF884F
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 23:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D8410E0CB;
	Fri,  4 Oct 2024 23:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acUfoPlq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686DF10E0CB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 23:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728083829; x=1759619829;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=GnNrIVrp11/C0Ba6DZ1O8VsOihytxoh3uQdLfnjVRg0=;
 b=acUfoPlqO3O3Zm7p9ikmVqoAzTVyIwBqNf7kCcIdep8ga34wBIJjOIIX
 pIhQGgpt66tq4ELqdKyOfBDOODdLYVJUofY6XY+dUDAgv9EM41rBOwm50
 nIrSQMJoZegAi4z0rRLCB15zpFhiEZaC5XIaXrVbxa3nHcBM4pfveOZzl
 OnixKmNZ3hKQSnlbF90wI4tbmsTuiGyx9xQ04Zkyhz+6A4ofZ0vjzz/2H
 9l3YVIFFqAmdl7dFoahMD/TKV3VqxvgPUt2lOk91SxZCD2+QOpoMaAKpR
 I6ilmvG3aSln4qnHP1VrJM4mgJrqmd+/BtbyjN1GTiL/4Y8Z8OXmQL9PC A==;
X-CSE-ConnectionGUID: sFeMwBi2SYiARbq8ynhKDQ==
X-CSE-MsgGUID: dc1FlBU+TO6BYYi9gI0VCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31203110"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="31203110"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 16:17:08 -0700
X-CSE-ConnectionGUID: QsmrECfRQ9+1mQM3N8Bsbw==
X-CSE-MsgGUID: VwZCCCtsQIqZBZJJmciotw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74835455"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 16:17:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 16:17:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 16:17:07 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 16:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViDkWaXJ0+7xzEqptGT/+cNm7T+FnDu8j/f0AMk5NmCnEW8oTeNeJYBvXA13CPwn5HYjk72/PMUX9Ll5vewiYQwatMs9l7ujCTXzS4VzH2ueryBihxUy8mI7JcUBLwrBtRNLwRom0gXMC0h9lTSymPSk/yM/N+lzACwHB6EVZ4Zs4kVYe0OyzY8s2AewC+ZWLVEzn7wv9Rhile+Mq3BI90R95727q4+LCsjSxz6vUbZkfI9WG0sLrq/3PqUaa6wEWXLRreIsJot8KVo7XMt3AfsFn6wl1QchBN6KEnyaXryS3uWwxX7s5T0loDO6F5gplpj1zJSfB5NSrIbRv8Oiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnNrIVrp11/C0Ba6DZ1O8VsOihytxoh3uQdLfnjVRg0=;
 b=CNDQ0L7v1Awm/pztEg9TXn0VwTMPf24LfJxAGFHtJFLw6uc8j9E4smQacHW34ZjfzvEZ95v+JsPMaM9zPa3m6cnGOmB7j+X711+08+6Apogj7uEDGiC00ratBNz/Y1BTtu2wLT0fqFFvCHZYAELqm8h/gO8L0HV55PQq653XBDIJkHkHUxJQFSWuXZ3FAUbOeCIKBD5xlE0z2VW35deSx4kcJI/bWg3UDZpbtdx6eh71poA5EHbwCr51fgqZwqoYXLgcj4oQ7NzgUP9GmEs3mbm79fhFBy0DSDSaYlSe1oeuzdr84eN3cB8cCAehhLhS3tNVHFD8VXIzQu0jhXL4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB6652.namprd11.prod.outlook.com (2603:10b6:510:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 23:17:05 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8026.019; Fri, 4 Oct 2024
 23:17:05 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v27 6/6] drm/xe/guc: Save manual engine capture into
 capture list
Thread-Topic: [PATCH v27 6/6] drm/xe/guc: Save manual engine capture into
 capture list
Thread-Index: AQHbFgzoH5MD6/VDmkmymXMmVn3GqrJ3OvCA
Date: Fri, 4 Oct 2024 23:17:05 +0000
Message-ID: <85aa6d27045a92ba491fe1444759bb657a354df2.camel@intel.com>
References: <20241004032400.3146208-1-zhanjun.dong@intel.com>
 <20241004032400.3146208-7-zhanjun.dong@intel.com>
In-Reply-To: <20241004032400.3146208-7-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB6652:EE_
x-ms-office365-filtering-correlation-id: e32ec8bf-b05b-4b3a-f2ab-08dce4caa942
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b3ZzKzJoUnVmUkVYWFJEQnpBSTNSOWxwSGFIa0dWSlVqMDdsTmR0RFdRZ1NF?=
 =?utf-8?B?WGdMNGxGeFZVWkNpcEkySjMrUjVlVkZkZjR0Snl3WURRQ3k4bXMwKzR5SERx?=
 =?utf-8?B?S0xsZHAyZGM5Q2lKK1c4enVwbFZrbFg1dEFoWXJZUzdJdHdEb0EwTisvcU02?=
 =?utf-8?B?SDE1bU9wd2ZCZVJPZ3c0WjZBblMyamVrbm5yQWRHT3NJdmxHZFJCa3JOMUxU?=
 =?utf-8?B?NE1zYXVlblpxdkJVNlJvbFFrMkNJS2ZwUy9uMzdhMzZjWmJHR2FUdUVUdno1?=
 =?utf-8?B?TjM0M3p1bFdSMktkaU8xZXF2YWdMTUpsaEdINXNjVWQzUVpUdU1MSHZLM0kr?=
 =?utf-8?B?NkRKVUN3ek9sdCtVU0hMckh1QnBKbCtxeFN5OGJYMytEU0lIdUprQnhxRGRy?=
 =?utf-8?B?VFdNRzBxUXJ4bldUUW82Wmp5TFFKRlcrdk9GbHJyZVNVY1dOQThVVU9BcmhY?=
 =?utf-8?B?WTlwYW5zVk9IbDhGVE45aEFKZ1pUc015MHdpOTI4QlkyaVAvU3NHVGVLamlX?=
 =?utf-8?B?V3JWTzZTMEExV2ZQTXFVUGhYVGhoV1pKeHdCRXFXc1hnUVY2Q1lYT1JIbkFJ?=
 =?utf-8?B?THh6S1dlOVpiOU0yaW9WRGFic0pRL3ZCYXMvUGgyTFpXaERiVURBNHNoNWdQ?=
 =?utf-8?B?TjIvM09lYUhVWFhlWjIyNFAyRWhnSjRZVGJMbW40a3V5VlRaMWZmUWdybkE0?=
 =?utf-8?B?T0xGUU5yR2RpTkJvOXFoNDE4ZkdkMWtuQXh6ZDRGSXRVMmFDTlhsQmUrWi9M?=
 =?utf-8?B?Y1diTGpLMXFnWU1FNkZlL29iVUZSUXE5UHlXaEtXZ0ozalVrUTdXckFYVnBw?=
 =?utf-8?B?azd3cVBqK1BJVmc2WHdwQkZXZVdvbkNBUnNleHB1Q2luS2x1ZFIvTzBndVJN?=
 =?utf-8?B?U0FhUHo2TmpCVkRXSW93KzkrMzF6MU5mWlc4ZGE4cUY0V205QUFmdVVyeFJr?=
 =?utf-8?B?azJUVldHMUhyMWZXdHBnN3lDVGVWVkkwQzIwTmtCaGNleFQyLzV3M2lmMGRp?=
 =?utf-8?B?eFJLZ0ZQdWZmdDdWUDdhYlRMRkhGU1RtT0U3aWtNaEpITGlWNFRLNjRQVzJX?=
 =?utf-8?B?TDhKUmhFL2g4ZVV5UXlRbWFnSzh3V2dUZlJVT3NHR01NUmlUODBDbTVCMk0z?=
 =?utf-8?B?M1JxZjR4WUtvdWxqcnpJSzVYangzMEtIc1pjRHBKQk05ejNzMk9ZT0pOUEF1?=
 =?utf-8?B?UlZ1bmtpU01ocWhzbDFCazZ6K210NzZkMUlNd1ZrUVNubGs5R3VsM3hHN3FQ?=
 =?utf-8?B?a05NZ3lrR2lzYyt2VnZVeUkwOVhCb1dSdUZFeGxEQ1hyemZWSDNQZ0JUbG1z?=
 =?utf-8?B?R3pqaXdmWG8zSE1qdUV1aGl2aUkvaFVXZGNBY1cwMG0yZ3RqdjJ3RjRiNlcy?=
 =?utf-8?B?Ujl1MTBBZ0JSclFiY3pnTlo2WTVLSjBOQWpIaEZ3V1gvSTg2MW5qL3c4Ni9w?=
 =?utf-8?B?K1RuVm1Udk5sdUxPTlBxa3VuRlY2VkpEVWxFVmVDdENMR0FXcUs1WFZUS05j?=
 =?utf-8?B?T0k0WXlZbzQwTk02SDc5aFdDenRBQVR2WG53QTM5ODJzcCtNRm1YaEk0K3JQ?=
 =?utf-8?B?ZXVocllpYWVSSW1rZ0d5TlBlTHh0NSt2VXlFbXJwbjFYQlJES0tPa3dtVDlH?=
 =?utf-8?B?V1ZHeUpKQ3lYSjhZVTR6b3BFODRMV1BkcEF2RzdZeUg5Q3FwUTQyT0dBWjNh?=
 =?utf-8?B?Tk5YdEphN09TVzlBYW9uWithbjJOQkkwYjBBUUVBNlF6U2lnRnVXc3FTRTdv?=
 =?utf-8?B?ZVdpUjNmVkExajVZT3pyL1hmNEloVkUyaGcydUM5dWlQWUt6RnphajJ4b0ln?=
 =?utf-8?B?V0FENGF6djZuTTc4b3dWUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnFHVXBHK3FQNjNuMHhxVENlNHhLdEhaUm1UcDhNSzhZaEt4ZEFUKzNyOWFW?=
 =?utf-8?B?T0x6eFJSZmp6ZldvRjdZUVo2SFJtcnQxN1VJN2c5VStsR2RLRklvTlNERG9L?=
 =?utf-8?B?Y25qdGhKb01QY0FBaHJFS2lORTJhdkxKUE5zeXlrWjkzVWFkQmp1dTV0Rkxj?=
 =?utf-8?B?N3BTbmdjMXJsQVVIZ0VaTHVXMHFHb29CSWxGVE94WWI3bTM5S1BmbmV1Mjd5?=
 =?utf-8?B?N2V0RHpNSURzQi9QZHRMc1pWZmJreVVKZ0FiYUhkc1RkK2tnaWIzZk5DanBN?=
 =?utf-8?B?K3lNbjJDa3Z3emloTFZiSVY4OTczVTdmbnFsRWZ1WlhCblVlMEw2b3pidVh1?=
 =?utf-8?B?ampqKzl4RGoyM0xSd1NzdDZDN3gvN2lsUDBtUE1HM2YyVWdSNm9yU3A0QVBP?=
 =?utf-8?B?ZHB6aXFuMGMzd2JQdFU0MXpwOVhZVjBqMWhGaEpCZStKeWpOR2thcnRQN3M5?=
 =?utf-8?B?ZTJoZFZnRzgyZFNVWkUxT2x0U2U3T2RFU3g5aWVMUzh4QWZCTXU2dGE3RnF6?=
 =?utf-8?B?YkNXRmdBVWhxQlRVbmhZTk12SW9OQzRncE1zQU9FYlN1K09WUnd6aC94YzRi?=
 =?utf-8?B?d25Na01nSnNyOVlodTBYQjc0ZENGV3dzWjJVYW5xc29zaDExQkcrL0hLZFAw?=
 =?utf-8?B?Y29sVVE0WEY3MU9PTTdRejZvcXNBbXA2cDU1dGVWZHdVOVhlcUJyek10TXRv?=
 =?utf-8?B?Y1d5LytscHhieVQ1Skc1K001WWsrSXQwQVdsQnNhWmdSWkRJUU85SVc1d2VC?=
 =?utf-8?B?K2dsNHRzVDdPTmNyOHdSY3ZYYThoL29YOEFFUUxHWEhLVURkbzJ3cmZ3YlN3?=
 =?utf-8?B?dVZTckRkNzlKd0RKYWErVEgvY3VnTmI0ZkEyYStsZHlERDdDYnV2VkY2SStV?=
 =?utf-8?B?K3dFSkN5aklaWmJ2Q1hGUWRmVTVVUHNYUGg0WjV1UC9xb0wvb0xncitKR1Br?=
 =?utf-8?B?ZHhyak9ySjh3RDN0OUlTZTdRQVVRRndIUm9XWWZ4bElmQlBGZlh1aUZxNjdZ?=
 =?utf-8?B?S05vTEZwM2RXdXRwenhML3hQQUVERk9IWFI2enhJVFg4K0E0bXlFWkh6cGlW?=
 =?utf-8?B?WUVDNEhnbllFSkYxSEhFM2RkR054MlJtRXdBR1NzQXZGcExXMCt6NjV2a2hC?=
 =?utf-8?B?cDBJY1UxaEsvZEJEQThFZm9IRm9yblFqNzRLbXFHTVY1UEI0WGF2Zng1TElF?=
 =?utf-8?B?bk5ZWHYyVFBvbzNwdFpGK0ZNSmN2NVpWQ21YMHVwN1Y0VFlmTEJXSjRmRTVz?=
 =?utf-8?B?SjV3ZXRzSnBFL25JVVdMUjZ1TkUwRTREeW4xZW9acEVZc2Vyc00vdW9DcmJC?=
 =?utf-8?B?YmV0OUp6MGwybDlDMWJZc3JnOTBiQnhXMkNDUlRKZU1ZY2pENzd1MXBSRGJU?=
 =?utf-8?B?Q2lKL2NpU2o2SHY5MUV5TWowYlhPQ0pJaEpMZ0JXc3ZRc0p1UVZPTHFWVkZa?=
 =?utf-8?B?aFZBaURhVVM0NXo1RGhTVm5tZ2VES2FVSlRiRU0wSHVzblAyU2M1c2IyeHpy?=
 =?utf-8?B?OUd5SUJ1SzNiZFZiamg2MEtyS1FiWi9jTm45SkpzZDJEdkN2NkRwc0pXY0Fs?=
 =?utf-8?B?elptUk1RRWJER1piNkkrYXNkd1hhRVNzZ0dtT09XQ1NFMWkybWNiZGNxWGZZ?=
 =?utf-8?B?dyt6bjFMOHZtTngwU2dSa0gxNXkzMUozc092eGwrbEpVRGxaRkZuOXBwazMr?=
 =?utf-8?B?dm5VQkNMT2hRMnVaRkVZcnlNU1FmNi9BMDBiOUc3d1VqUTR6QS9Sd09ublZp?=
 =?utf-8?B?cDgwdWR0WHVYZUo3eWozV0Vrb21Rb2NrdTV2eW5SdENiZ3pjWU9RSFZoN2Ft?=
 =?utf-8?B?WHVMR3kvbGN3UmVTMzl6V1NHbGdQMi9PVXNoYzVvb2tTWEF3ZVhLbnZLbzJi?=
 =?utf-8?B?K1ltcVR3M1BZV2RGcC92ZkVYNUpPR01qOHZWNFk0emZ2bkdzQmtzRnl2NG1B?=
 =?utf-8?B?UGl6MkNUelB4S2RnVU9ablVCeVVTWWVRZ2E5REcwTnRIZER6aXlkOUJ1MEVF?=
 =?utf-8?B?VkQwOTJBWEZFRmp6SGZJVHlGYUNUZVA4bWVoS3g4dUV6Q1Jtc3JreXU0WXps?=
 =?utf-8?B?RGFGcjg2WXB6OFFHd292Z29ueXA4bURNMzNURmNOT29SN0dZVEJ3VUM4OUNF?=
 =?utf-8?B?bUJtL0ZEd3JUUUdINmluTC9RNmc3VUt3dDRvVThpK3QzRVUyWVNMVFF1K2dR?=
 =?utf-8?Q?0dBdDVY5hfKeIB3kbs1mybw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C58A2EAE7F0E042B69D41CA67AF9171@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32ec8bf-b05b-4b3a-f2ab-08dce4caa942
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 23:17:05.3834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HNgq5kdHoqwpuU5I5IxxPHuLRDdtq1bWfJ9ffPy6cPTUpyObhIn38SGtPUGJR80Pa3MVmEQeUXngOinRVQUFLdDfgPrcXvebiCZlSAjKFv1Ppaz5wii3P1V/VLTN9t/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6652
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

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPg0KDQpPbiBUaHUsIDIwMjQtMTAtMDMgYXQgMjA6MjQgLTA3MDAsIFpoYW5qdW4gRG9uZyB3
cm90ZToNCj4gU2F2ZSBtYW51YWwgZW5naW5lIGNhcHR1cmUgaW50byBjYXB0dXJlIGxpc3QuDQo+
IFRoaXMgcmVtb3ZlcyBkdXBsaWNhdGUgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgYWNyb3NzIG1hbnVh
bC1jYXB0dXJlIHZzDQo+IGd1Yy1lcnItY2FwdHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpo
YW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gLS0tDQoNCg==

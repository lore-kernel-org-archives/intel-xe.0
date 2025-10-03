Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25787CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 18:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D063B10E962;
	Fri,  3 Oct 2025 18:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvZ1wtC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AE610E962
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 18:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759517926; x=1791053926;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3sHlD+QPO6W8S4UF6EbhMRXuMdahEpi+wZpsWEh09Uw=;
 b=WvZ1wtC+K+68fjUtOev4thAuVwTpQlIXEMTQ9cnOUqhY+az6gsrIqMQA
 rWPPRwsGkbU6qYdGGI8LMM3rHOKK1GdPHi43xX7IoSKDmIlH0wk/C89Bq
 enOqMU0dktf8vIs+vuAkLOZFEvXe7IgzAH31AO23JfYvPz/KsPx1M2pYr
 u2A4GA1HDVxwTA2yOBu0K6XzKIn4RL3wgAuT8wWUrvtdAcNLntbxbHeI5
 0Pwvt8+y0kBYAb0B0PwYK42mUFNm917dhBhV6FfWyhgZLp9bCYLn47Bl9
 Em4Qx+dyiYz//3+Ya3VSJvXpiCeOML47+bdFkI0g6A7up0Q3Du6V+7E7z g==;
X-CSE-ConnectionGUID: kupufv1ZT8qXhsNfTg3QDA==
X-CSE-MsgGUID: uyncVlsITEuLpgCQWdN90A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61765691"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61765691"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:58:46 -0700
X-CSE-ConnectionGUID: vEE4LLKVRTSovZuPhwK+2Q==
X-CSE-MsgGUID: cLkfKzw8St6QidmZtYCFuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="180160344"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:58:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:58:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 11:58:44 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:58:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9QzokzNZCfzQUfzWQwiW+MBtMJHxnCXLxBnKU5eOyUndTUAxISSVDHUCPWmjqucTac6LbUkLbwodnpnyb8+8HEx3JiGKZAO6e/MUkHe/3LfSFNFit86Da15ifCN6nMxembVoyYefQwX7i5shA7VeJyXBDd/42FZ5eOVEKXaTvGeLvpgJAKzoQhgP7q7xH85WF5/mbtt3gxnM+NRHANXISgukDRl8mHGWA/M/5ZM9F5dbUSxxRPVcpeexEe5NUzDk2k5bjZY037BbXFJlRncBzKvyvY3npi4jl4HnzukWzYv2ypnIBfx/R9Q3Y1KeWjEoW05kNenkwKfpNYh9xAklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sHlD+QPO6W8S4UF6EbhMRXuMdahEpi+wZpsWEh09Uw=;
 b=UTF55dfyRevf+n1SBj+LufauzY/A9tfkaPQde26yqbbxoO0tumRFvtked+qxHSjMxbI2faxVOLzBvhbi5Wgt5xtJ7pBOJenEIpIarr+qE1NZeWRIuLIbEMuNQG7CmpIRCsmQ7+Mr3jaT0ieBFCWmFPHA1MPvsdQTvURQP+OyfWYITCcpJVb66Ac6+O2vIA2LsuPo59WR9uAsiDVsjbypwAYPzsH8IZM97LdLospC0L3RQFUNIXeCQFpECsztjoFLknjdYFvVWIKIK8pTMO5wC2hzsU84IEzHiwWW5XIjH619iBf0MRPHF7Ekj6hlTEzTJ+AB0lt9ZPyN4S1NkTnwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.20; Fri, 3 Oct 2025 18:58:37 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 18:58:37 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Thread-Topic: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Thread-Index: AQHcM/D4jvxlEfzKm0yKUDEcvHBvRrSwxlAAgAABPoA=
Date: Fri, 3 Oct 2025 18:58:37 +0000
Message-ID: <65030659cc8fb5da4eaf4f28aa822bb149e0453f.camel@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-8-stuart.summers@intel.com>
 <aOAb0JnFULgND3ad@lstrano-desk.jf.intel.com>
In-Reply-To: <aOAb0JnFULgND3ad@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS7PR11MB6152:EE_
x-ms-office365-filtering-correlation-id: bf8109f7-25c9-4c1a-3e5d-08de02aedc02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?R2dxcy9yZGFtYXQ0NFNwcG1BaE1yaFZOVm16L0JnTjI1N2xIMngxai9nanpz?=
 =?utf-8?B?b3dqSkZOYnZ3K280RlZHVmgraVNsbTVTMTk3SkYyTVFwV1JOQmJPM1FQamd2?=
 =?utf-8?B?VnNZR1YxK2FQWW9ENG1ZalZ0SFpIaHdld1NVV0syN0pOWmJZczFHc1NIM29V?=
 =?utf-8?B?bG4vQUd3ZVBiRVlPTERaQzNQMnpaSXlMTUw2b3JWa1UyNEFXUXZ1NkhXeHFp?=
 =?utf-8?B?WEZaYUQ4N2RUbFMzRzA4TEFIRDJvaFJHVmtIeGxuQUcyanRrUU9PRnFyazlF?=
 =?utf-8?B?emk5RmFRSkJWRWpHSDUrS3pLLzFQcy9BVkNlTGw1Zk90QnptVjdUL3lZVjl3?=
 =?utf-8?B?V0dpbGhEbGMxWjAxRWlxSXJpYlUwcG9UV01JWDY3TUxQbzY1Q2ZodEp1TkZx?=
 =?utf-8?B?YjZvYUVybUUvelJvNUpsQ1lFQXI0ZzdzWFU4THdtTnY3ZnRVNE5vZ083TVY1?=
 =?utf-8?B?akt0RTFzUmNORndXK2NFUk1RVFFVSjVkandINzl5TmJjMW9hQk1yblV3V2R0?=
 =?utf-8?B?MW9jMkk1UnREV1BKSUFJVUI4b3lKUDl3VkpxRmtWVUo5ajdMOE1QZHAwZEdO?=
 =?utf-8?B?ZDV4RlhmajArVFVJVkVkUnQ5QUNNRUxrNndKb0ZobmFUUFVQNTdCRm5aNnJh?=
 =?utf-8?B?bEtQTlRnZjhwbzJoc21jMHEvYkNPTFJ2Ni9lUmRjc1dudkFENVBmei9RQlVu?=
 =?utf-8?B?cS9LbU1VU0xKb3pCOUhOQmU3YjFmT05pbGlVZlA5SUpoR05jOWtWNTAzVjRW?=
 =?utf-8?B?dVY1SkhSTnVIYUoyU29sWVhCUjE1cmlZVzF4bmlEMmdlZVFDOHgxOUNpTGFV?=
 =?utf-8?B?cjltc0w2SWp1R0UzMGlRTDNkcU1qUE5kVi9LWFpGRnU5MEVHME0rcVBTTkUw?=
 =?utf-8?B?aGl4eVFmZ0xEa2NyaW5aV3A3YlI3RkF3M2c2QXMxODFXWmJsT01JbjV3RTVh?=
 =?utf-8?B?QVYvTmpYTjFUL0VVV1BHM3EyODdhTzV1Mno1ZU1EZkkrWFk0KzhsTXFaWmlF?=
 =?utf-8?B?Z1l6aGRLcjNadWpQM3RKN09PWEd4Q2tObFVCam1tTkRKT2FmeWlyV2Z6enI4?=
 =?utf-8?B?Tjl2U2JONnVyS0tFVHBQWVRKSDVjMzc2ckpPdnRrTjBtejVDL0FXUU9oOHN5?=
 =?utf-8?B?RjlLcEtkZkExOFJGN3U3ZGgxMkYyR0VsMU5jZlZrS3kxZE03aDhEWStsY2M3?=
 =?utf-8?B?WTEwQU93Mmt4Qk5qR0VWaUg5RUJJR3hNa2dFeCtXcWNudFdNUFlnWVV5RFdR?=
 =?utf-8?B?aVJqOUQ3Zi9OUklmbnJBTStCc2FiVFVzUS9nWHdtdkJjWVJBYkRSSjI5T1lW?=
 =?utf-8?B?ODN6dFdabXJJcmEwbzFvZkFmNHlVYzFabll4NHEwWldUU2t3L2xtZE5yUGZt?=
 =?utf-8?B?OTdUcEZQNHM4M0dRV1FHWUZpdWJocExJUDF1WkVLaWFvcXZHZjF1T0taV3By?=
 =?utf-8?B?eVdmTjN2cGZoSDZiWlByU0l4MlFpVmpWWjdSWU1XZ0NYTm5KUXdWN0xkRWZr?=
 =?utf-8?B?bjJrS2Fxd1lqZzZpMFRlUU5EVHlkVUJNTng3ZUtKQkEranFvNGNlU0JVUXgy?=
 =?utf-8?B?YWZzSUU2TVQrSnVlMDM0NG9ZcVYraGptTnc4akdOOGx2NXF4L2ZjUC9XWFE4?=
 =?utf-8?B?c1BtZEV6dERzNGo5M2tsZ042RWxjcVp2TlJ6YzdiRDFYelliWlgxRDR6MkQ1?=
 =?utf-8?B?V1RPaXJnYzNBTkozb0FuZ1lKREtmRnVFN2lSb21ab0J4N3ZuRGRoZksvWEF0?=
 =?utf-8?B?LzNUU21uRXY5WmRObkQ2QjVUK01sMWtxb3l3QUhISGd0M0NCTDFZb1Rhcm4x?=
 =?utf-8?B?N0cyNkdJOGhRWlFWMkc0eDN3M3puZi9tNWpPbS9RN1R4czNPdk9XbXg5MGVv?=
 =?utf-8?B?TGJJZHJQMFBSbmZOb3F6eldtZk5tc000cTZRY1d3Nk0rNUdqM1ovOG9NMU1x?=
 =?utf-8?B?OXNFOXg5RkY5OUhHL0VMWVR3bmU0ZVpCV01OMVJuRUJYbGxDSm56eGpTa3RT?=
 =?utf-8?B?OUYwTVlXOFh0MnBCNUZRVTlsU3k0c2FHZTdmRjc4N1ljc2FiNEFrREcxZGcv?=
 =?utf-8?Q?wdkv6x?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDRrOXZkV201L3JMTzV4WHdZb3pFd3hSb0tuYlVyZmlKZ2dDdUg1NkJTM0ZB?=
 =?utf-8?B?eVFKNjkvVkxqVDcvU0tyVFdNck81V3FjYnZpa1RsMmVPSWdZbFVLSlVJVUdY?=
 =?utf-8?B?MnBFWWhGM00rMFBuZkxmT3paMk8vaEc2YkFLaUlBUlEraGtKS2h0cjZ3TG84?=
 =?utf-8?B?RDhLOVFCZ0tMc3I1cm1za3htSzJqUG10Vy9FNVVqcjk0dDRGaGpOL0h1bmlQ?=
 =?utf-8?B?OUtvK1lmVmNFNks4UFBiWnl0Q3NHWVZIV2NNZTZYenVWYTJ6Z3ZhNE9nUjNz?=
 =?utf-8?B?M3NUazNxZXJjWHZ5ODlEZUp0anRIeGxwKzNnejlYUkJnYW1aOURBSFB5Tzgx?=
 =?utf-8?B?NG4vRmdMeEVXMlNCcHlLa0JkWms1ejRLcFZNRDFmVWVubzkwdmwzSFVWdVFS?=
 =?utf-8?B?Yk4yY2MyQjhNS2NkdGdFNTlhd3FiOHRSNVk3SjIrN0NZNUgvM1YzRjVjT1N1?=
 =?utf-8?B?ZlZBWjQ4amt0WUt5UjhlQjJJa21nV3VwZFR6YXZ1TDlFeldiTUpmbFlKcklC?=
 =?utf-8?B?dUpKUk5pU1lJQ0Q4QnhPRlE2RTBsd09kVVV2ZFo3cEMzd0liWnROM1lxMFNK?=
 =?utf-8?B?aHNHZmZUdGFEY3hCVTBRZWRTNFhTcDFqU2tDWmN6cThyVmFGR1AwMWZRdHlh?=
 =?utf-8?B?SzczQ1p5Ry93QTNjQzgwdkVYTFpEU0RiSXhaNkhCTCtaY0xmRGZtTlNvM0J1?=
 =?utf-8?B?VVFVTkNsZEtsTVlHZkFiTS9ZM0hPQUxreWVuNFRyQkJCeFpqamVDWmY0Nk54?=
 =?utf-8?B?ME1PVkdYVTc0aThycUZiSVNkNmhjYVBoa2d5RUxvM2RRSUNsblNJMm5uT3BV?=
 =?utf-8?B?SGRDVWZUSWJCNVBtTFNoSENlUSt0aU8za3l3aFI3RUdnRm1JMjd3T01UUjg4?=
 =?utf-8?B?am85MjVPY3NJak9nVVVUNVovWWV1a0N5UFBoUG50UzVrUkFiR29SSFN3WXp1?=
 =?utf-8?B?bnNDQ3VWZlFTRFNnWFRWd2FocHp3ZDZKQXlUdU5OeXhOdEhnTitBeVhtR3FS?=
 =?utf-8?B?enBiTnRTMWFkejAyLy9EcTIzbW10cndpbjFVNTMrUHRwL3NKeFVkNHdURXBD?=
 =?utf-8?B?U1dtUDI2V2VWSktIWi91ZVpTbU0rUXQ3enkvODcrc2Q5N0djTEwrZXUwNlNS?=
 =?utf-8?B?UHJLZUxkOUxMTHFLbE80QUFjNi9QNGkvWXhFR3dNZUE4aXlwbnJZbnNZWlZ1?=
 =?utf-8?B?eURyNHFoajlYSjF2Y2J2N0tqMEg4aEVicEtzc095R1Bnc0FmcHVNY3phcFFT?=
 =?utf-8?B?TStaR0xJdkdwZE5wNmJlcnNoZjdsZzdQS3ljOXA1dkY3NjZtM3EyLzBHRTVU?=
 =?utf-8?B?SUJNM1VpdU1KcEY0Sm1Wd0N1K2g5cDJLdDJBVW53c3dCWFpsa285KzlMeTZP?=
 =?utf-8?B?dG5TcmFJejFkVWt1VU91eGZJMFNMZE5ib2Z3TjM0azltbE12ZDJCL0NKemdV?=
 =?utf-8?B?U0RZVytqYzFUeEFmTldTcWlxR3cyQUQ0aFdEZmE3cjVZOG9yOThPZDVkcEV0?=
 =?utf-8?B?R3Axbm5tazlrQnRydDFwc2dLK1ZmaVpqekFHTWVJMW5qdS9oOXZGZkxPN3ps?=
 =?utf-8?B?TDdEUCtBbWIySmZKWDlENktFOHFrVUJtZTdyRnRsb2svb3FVeG5qcEx3dkJr?=
 =?utf-8?B?Z2tsT1RPenp1djJTRGJBQ0pjWlNtT3VmZklXOExYc2pxeURoRjdoZkdhY1NF?=
 =?utf-8?B?UHMxWmg4UFhkMVVwNDl0WkF3bGUyYkJMZkgxcVpOU0ROSDZrN2lTV2hnN3Z1?=
 =?utf-8?B?UEI5K2c2d25mdm81M1gzQldGNW5YSGF6WFFGOEVsRUk5ZXpvNmFDZGFJU2l2?=
 =?utf-8?B?cjgwSnVsRjFPTlloUkJGR2RHZWk4WGtkaHluRGtSckR2TjlCTFNJRW85VUVt?=
 =?utf-8?B?Q0ErWVdOQnYvcEN0bks1ZTR2V2VKM0Zpc255dTFKeXovSmVqNHowWTdCbmpw?=
 =?utf-8?B?a2d2UjRJckpFNVZhbTFsQTRHcHZFaUpxd3ZMZXJpb2h0dkRwS0o4ai9yUHda?=
 =?utf-8?B?YjdmMGRXRnNrYzB5SHN5WmppU2w0dlNOUDNWY2NzbE5IcEkvbVZnSGV6aHVs?=
 =?utf-8?B?ZjdBRklLQ2k5cFltQWJXUHdkSmNIZyt6RkwvNFFGVWVTOFlnK09wVmJnQlds?=
 =?utf-8?B?WE9INUE4aWxMWkN4bzR6bzBGM2ZqREFtQmtpTjZkVE1ZMWtWdzYvYlNvUlZK?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <260C79BB0B59B5448C7468A31AADC85E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8109f7-25c9-4c1a-3e5d-08de02aedc02
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 18:58:37.1147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k+TG1dpAuRiqwluYT2RjtnC2QRAcmpvj3orHRbQGq8EFsLoFjwiAsKfdf2gmjvoKFzvMnhBjcMGzDuy5NLIfivNjpDlv9ye22Fv+VByjmL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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

T24gRnJpLCAyMDI1LTEwLTAzIGF0IDExOjU0IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIE9jdCAwMiwgMjAyNSBhdCAxMTowNDo0NFBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBJbiB0aGUgZXZlbnQgdGhlIEd1QyBiZWNvbWVzIHVucmVzcG9uc2l2ZSBk
dXJpbmcgYSBzY2hlZHVsaW5nDQo+ID4gZGlzYWJsZSBldmVudCwgd2Ugc3RpbGwgd2FudCB0aGUg
ZHJpdmVyIHRvIGJlIGFibGUgdG8gcmVjb3Zlci4NCj4gPiBUaGlzIHBhdGNoIGZvbGxvd3MgdGhl
IHNhbWUgbWV0aG9kb2xvZ3kgd2UgYWxyZWFkeSBoYXZlIGluIHBsYWNlDQo+ID4gZm9yIFRMQiBp
bnZhbGlkYXRpb24gcmVxdWVzdHMsIHdoZXJlIHdlIHNlbmQgYSByZXF1ZXN0IHRvIEd1Qw0KPiA+
IGFuZCB3YWl0IGZvciB0aGF0IGludmFsaWRhdGlvbiBkb25lIHJlc3BvbnNlLiBJZiB0aGUgcmVz
cG9uc2UNCj4gPiBkb2Vzbid0IGNvbWUgYmFjayBpbiB0aW1lIHdlIHRoZW4gYXQgbGVhc3QgcHJp
bnQgYSBtZXNzYWdlDQo+ID4gaW5kaWNhdGluZyB0aGUgaW52YWxpZGF0aW9uIGZhaWxlZCBmb3Ig
c29tZSByZWFzb24uDQo+ID4gDQo+ID4gSW4gdGhpcyBjYXNlLCB3ZSBzZW5kIHRoZSBzY2hlZHVs
ZSBkaXNhYmxlIGFuZCB0aGUgZXhwZWN0YXRpb24NCj4gPiBpcyB0aGF0IEd1QyB3aWxsIHJlc3Bv
bmQgd2l0aCBhIHNjaGVkdWxlIGRvbmUgcmVzcG9uc2UuIFRoZSBLTUQNCj4gPiB0aGVuIGNhdGNo
ZXMgdGhhdCByZXNwb25zZSBhbmQgaW4gdHVybiBzZW5kcyBhIGNvbnRleHQNCj4gPiBkZXJlZ2lz
dHJhdGlvbg0KPiA+IHJlc3BvbnNlLiBTbyBpbiB0aGUgZXZlbnQgR3VDIGJlY29tZXMgdW5yZXNw
b25zaXZlIGFmdGVyIHdlIHNlbmQNCj4gPiB0aGUgc2NoZWR1bGUgZGlzYWJsZSwgd2UgYWN0dWFs
bHkgaGF2ZSB0d28gZzJoIHJlc3BvbnNlcyB0aGF0DQo+ID4gaGF2ZSBiZWVuIHJlc2VydmVkIGJ1
dCBuZXZlciByZWNlaXZlZC4NCj4gPiANCj4gPiBUbyBoYW5kbGUgdGhpcywgbWFrZSBzdXJlIHRo
ZSBwZW5kaW5nIGRpc2FibGUgZXZlbnQgaW4gdGhlDQo+ID4gZXhlYyBxdWV1ZSBnZXRzIGNsZWFy
ZWQgKGkuZS4gd2UgcmVjZWl2ZWQgdGhhdCByZXNwb25zZSBmcm9tDQo+ID4gR3VDKS4gSWYgaXQg
ZG9lc24ndCBpbiBhIHJlYXNvbmFibGUgYW1vdW50IG9mIHRpbWUsIGFzc3VtZQ0KPiA+IEd1QyBp
cyBkZWFkOiBiYW4gdGhlIGV4ZWMgcXVldWUsIHF1ZXVlIHVwIGEgR1QgcmVzZXQsIGFuZA0KPiA+
IG1hbnVhbGx5IGNhbGwgdGhlIHNjaGVkdWxlIGRvbmUgaGFuZGxlci4gVGhlbiBpbiB0aGUgc2No
ZWR1bGUNCj4gPiBkb25lIGhhbmRsZXIsIGluIHR1cm4sIGNoZWNrIHdoZXRoZXIgdGhlIGNvbnRl
eHQgaGFkIGJlZW4NCj4gPiBiYW5uZWQuIElmIHNvLCBtYW51YWxseSBjYWxsIHRoZSBkZXJlZ2lz
dHJhdGlvbiBkb25lIGhhbmRsZXINCj4gPiB0byBlbnN1cmUgYWxsIHJlc291cmNlcyByZWxhdGVk
IHRvIHRoYXQgZXhlYyBxdWV1ZSBnZXQNCj4gPiBjbGVhbmVkIHVwIHByb3Blcmx5LiBXaXRob3V0
IHRoaXMsIGlmIHRoZSBkZXZpY2UgYmVjb21lcw0KPiA+IHdlZGdlZCBhZnRlciBhbiBleGVjIHF1
ZXVlIGhhcyBiZWVuIGNyZWF0ZWQsIHRoZSBhdHRhY2hlZA0KPiA+IHJlc291cmNlcyBsaWtlIHRo
ZSBMUkMgd2lsbCBub3QgZ2V0IGZlZWQgcHJvcGVybHkgcmVzdWx0aW5nDQo+ID4gaW4gYSBtZW1v
cnkgbGVhay4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0
LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKystDQo+ID4gwqAxIGZpbGUg
Y2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gaW5kZXggNDViNzJiZWJmYzYzLi5hMTc3
ZDg3Yzg1MjQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiBA
QCAtOTM5LDYgKzkzOSw5IEBAIGludCB4ZV9ndWNfcmVhZF9zdG9wcGVkKHN0cnVjdCB4ZV9ndWMg
Kmd1YykNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdVQ19DT05URVhUXyMj
ZW5hYmxlX2Rpc2FibGUswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqANCj4gPiDCoMKgwqDCoMKgXA0KPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gwqANCj4gPiAr
c3RhdGljIHZvaWQgaGFuZGxlX3NjaGVkX2RvbmUoc3RydWN0IHhlX2d1YyAqZ3VjLCBzdHJ1Y3QN
Cj4gPiB4ZV9leGVjX3F1ZXVlICpxLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgcnVubmFibGVfc3RhdGUpOw0KPiA+ICsN
Cj4gPiDCoHN0YXRpYyB2b2lkIGRpc2FibGVfc2NoZWR1bGluZ19kZXJlZ2lzdGVyKHN0cnVjdCB4
ZV9ndWMgKmd1YywNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV9leGVj
X3F1ZXVlICpxKQ0KPiA+IMKgew0KPiA+IEBAIC05NzQsNiArOTc3LDE3IEBAIHN0YXRpYyB2b2lk
DQo+ID4gZGlzYWJsZV9zY2hlZHVsaW5nX2RlcmVnaXN0ZXIoc3RydWN0IHhlX2d1YyAqZ3VjLA0K
PiA+IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndWNfY3Rfc2VuZCgmZ3VjLT5jdCwgYWN0aW9uLCBBUlJB
WV9TSVpFKGFjdGlvbiksDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgRzJIX0xFTl9EV19TQ0hFRF9DT05URVhUX01PREVfU0VUICsNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHMkhfTEVOX0RXX0RFUkVHSVNU
RVJfQ09OVEVYVCwgMik7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHdhaXRfZXZl
bnRfdGltZW91dChndWMtPmN0LndxLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhZXhlY19xdWV1ZV9wZW5kaW5nX2Rp
c2FibGUocSkgfHwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfZ3VjX3JlYWRfc3RvcHBlZChndWMpLA0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBIWiAqIDUpOw0KPiANCj4gVGhpcyBkb2Vzbid0IGxvb2sgcmlnaHQuIERlcmVnaXN0ZXIg
aXMgZGVzaWduZWQgdG8gYmUgZnVsbHkgYXN5bmMuIElmDQo+IHRoaXMgZmxvdyBzdG9wcyB3b3Jr
aW5nIGZvciB3aGF0ZXZlciByZWFzb24gdGhlIEd1QyBpcyBkZWFkIGFuZA0KPiBldmVudHVhbGx5
IHNvbWV3aGVyZSBpbiBkcml2ZXIgd2lsbCBkZXRlY3QgdGhpcyBhbmQgdHJpZ2dlciBhIEdUDQo+
IHJlc2V0DQo+IHdoaWNoIGlzIGNsZWFudXAgYWxsIGxvc3QgSDJHLg0KPiANCj4gPiArwqDCoMKg
wqDCoMKgwqBpZiAoIXJldCB8fCB4ZV9ndWNfcmVhZF9zdG9wcGVkKGd1YykpIHsNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3Rfd2FybihndWNfdG9fZ3QoZ3VjKSwgIlNj
aGVkdWxlIGRpc2FibGUgZmFpbGVkDQo+ID4gdG8gcmVzcG9uZCIpOw0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBzZXRfZXhlY19xdWV1ZV9iYW5uZWQocSk7DQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGhhbmRsZV9zY2hlZF9kb25lKGd1YywgcSwgMCk7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X3Jlc2V0X2FzeW5jKHEtPmd0
KTsNCj4gPiArwqDCoMKgwqDCoMKgwqB9DQo+ID4gwqB9DQo+ID4gwqANCj4gPiDCoHN0YXRpYyB2
b2lkIHhlX2d1Y19leGVjX3F1ZXVlX3RyaWdnZXJfY2xlYW51cChzdHJ1Y3QgeGVfZXhlY19xdWV1
ZQ0KPiA+ICpxKQ0KPiA+IEBAIC0yMTE3LDYgKzIxMzEsOCBAQCBnMmhfZXhlY19xdWV1ZV9sb29r
dXAoc3RydWN0IHhlX2d1YyAqZ3VjLCB1MzINCj4gPiBndWNfaWQpDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoHJldHVybiBxOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gK3N0YXRpYyB2b2lkIGhhbmRsZV9k
ZXJlZ2lzdGVyX2RvbmUoc3RydWN0IHhlX2d1YyAqZ3VjLCBzdHJ1Y3QNCj4gPiB4ZV9leGVjX3F1
ZXVlICpxKTsNCj4gPiArDQo+ID4gwqBzdGF0aWMgdm9pZCBkZXJlZ2lzdGVyX2V4ZWNfcXVldWUo
c3RydWN0IHhlX2d1YyAqZ3VjLCBzdHJ1Y3QNCj4gPiB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+IMKg
ew0KPiA+IMKgwqDCoMKgwqDCoMKgwqB1MzIgYWN0aW9uW10gPSB7DQo+ID4gQEAgLTIxMzEsNyAr
MjE0NywxMiBAQCBzdGF0aWMgdm9pZCBkZXJlZ2lzdGVyX2V4ZWNfcXVldWUoc3RydWN0DQo+ID4g
eGVfZ3VjICpndWMsIHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+IMKgDQo+ID4gwqDCoMKg
wqDCoMKgwqDCoHRyYWNlX3hlX2V4ZWNfcXVldWVfZGVyZWdpc3RlcihxKTsNCj4gPiDCoA0KPiA+
IC3CoMKgwqDCoMKgwqDCoHhlX2d1Y19jdF9zZW5kX2cyaF9oYW5kbGVyKCZndWMtPmN0LCBhY3Rp
b24sDQo+ID4gQVJSQVlfU0laRShhY3Rpb24pKTsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoZXhl
Y19xdWV1ZV9iYW5uZWQocSkpIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aGFuZGxlX2RlcmVnaXN0ZXJfZG9uZShndWMsIHEpOw0KPiANCj4gVGhpcyB3b3VsZCBsZWF2ZSB0
aGUgR3VDIHdpdGggcmVmZXJlbmNlIHRvIGd1Y19pZCBhbmQgc3Vic2VxdWVudA0KPiByZXVzZQ0K
PiBvZiB0aGUgZ3VjX2lkIChpLmUuLCBuZXh0IHJlZ2lzdGVyKSB3aWxsIGZhbGwuDQoNCkJ1dCBh
Z2FpbiwgaW4gdGhpcyBjYXNlIHRoZSBHdUMgaXMgZGVhZCBhbmQgd2Ugc2hvdWxkIGJlIGdldHRp
bmcgdGhhdA0KcmVzZXQgZXZlbnQgeW91IGhhZCBtZW50aW9uZWQgYWJvdmUuIFRoZSBpc3N1ZSBJ
J20gaGF2aW5nIGlzDQpzcGVjaWZpY2FsbHkgYXJvdW5kIHdlZGdlIGV2ZW50cy4gV2l0aG91dCBh
IEdUIHdlZGdlLCB3ZSB3aWxsIG5vcm1hbGx5DQpnbyB0aHJvdWdoIHRoZSBHVCByZXNldCBmbG93
IGFuZCByZWNvdmVyIGxpa2UgeW91IG1lbnRpb25lZC4gQnV0IGluIHRoZQ0KY2FzZSBvZiBhIHdl
ZGdlLCB3ZSBkb24ndCByZWRvIHRoZSBzb2Z0d2FyZSBwYXJ0IG9mIHRoZSByZXNldCAoaS5lLiB3
ZQ0KZG9uJ3QgcmVzZXQgY29udGV4dHMsIGV0YykgcGVyIGd0X3Jlc2V0KCk6DQpzdGF0aWMgaW50
IGd0X3Jlc2V0KHN0cnVjdCB4ZV9ndCAqZ3QpDQp7DQogICAgICAgIHVuc2lnbmVkIGludCBmd19y
ZWY7DQogICAgICAgIGludCBlcnI7DQoNCiAgICAgICAgaWYgKHhlX2RldmljZV93ZWRnZWQoZ3Rf
dG9feGUoZ3QpKSkNCiAgICAgICAgICAgICAgICByZXR1cm4gLUVDQU5DRUxFRDsNCg0KTWF5YmUg
aW5zdGVhZCBvZiBiYW5uZWQgSSBjYW4gY2hlY2sgZm9yIGJhbm5lZCBhbmQgd2VkZ2VkIGhlcmU/
IE9yDQptYXliZSB3ZSBzaG91bGQgcmV0aGluayB0aGUgc29mdHdhcmUgcmVzZXQgZmxvdyBpbiB0
aGUgZXZlbnQgb2YgYQ0Kd2VkZ2U/DQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiBNYXR0DQo+
IA0KPiA+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHhlX2d1Y19jdF9zZW5kX2cyaF9oYW5kbGVyKCZndWMtPmN0LCBhY3Rpb24sDQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVJSQVlfU0laRShhY3Rpb24pKTsNCj4gPiAr
wqDCoMKgwqDCoMKgwqB9DQo+ID4gwqB9DQo+ID4gwqANCj4gPiDCoHN0YXRpYyB2b2lkIGhhbmRs
ZV9zY2hlZF9kb25lKHN0cnVjdCB4ZV9ndWMgKmd1Yywgc3RydWN0DQo+ID4geGVfZXhlY19xdWV1
ZSAqcSwNCj4gPiAtLSANCj4gPiAyLjM0LjENCj4gPiANCg0K

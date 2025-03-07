Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFFEC282DE
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 12:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3266C10E15B;
	Fri,  7 Mar 2025 12:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4QwRf+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4583710E15B
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741350107; x=1772886107;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pl9Ju5Rq93W/ysDJZskH8IuvoEUr3/KpA6BMpO7NbqA=;
 b=R4QwRf+h0yt5m/p5Qp1ExPk+7/6XdmGvVH3e1nF714gJKPzl5ZSnczvD
 Gfas4V+krzRHTBbbc6kOd3h4oNLksHpoB99pkNZd9JqmCqR/QoE0Uj5SD
 5iU+qVE9PPPqczWvMs68oaTXyDHWfqDBHqc45ivf2PnBJUD4xwVEEYM0Q
 GIyRCY2By5l88uRK/GAhPZc49ejq1+oHN2hG5B+251sf2wmTV6Y6Op2bx
 glVfRTOKXtEUeBVdIId73KZAHQ61U7bAQuO01N9VB6lwul2p3pAQf1NOr
 w/h5m9xONTvIivaNsp+O1el8bU4iFc4rbNP14rNr7jL2//4pYGBKYp9X0 w==;
X-CSE-ConnectionGUID: mbb4/+xSQjmuOwMGRqLIcw==
X-CSE-MsgGUID: rsPzR71TRTCQ/m4DJms6fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53032033"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53032033"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:21:46 -0800
X-CSE-ConnectionGUID: GGrrXENQSDKDxAU0hDJMQQ==
X-CSE-MsgGUID: VUR1MqY3Tsyv/t0B6bowfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="123902919"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:21:46 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 7 Mar 2025 04:21:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Mar 2025 04:21:45 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 04:21:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=von9gTS2x/G/1eC/R3rGbHxIdNUcNYo977iXwrVpMg/WN8WjbGROevVakHSR0SZWfmxNzHx5kFKtj1Tf8NN92pY1f1+QPBIP2tZs+SFPqiZKVEuGazSQOSWXc4ltrVleRbXlSNScjjwRBAxP/EpBk8s2YZAPb2Uets9NcrYO1sqtwHd8pmSJFZADPPnhCiu3tAlseDOgz3mOV70K4Ek6gSoos4Xk6PYwR2tmePFH6mMZ6sOihiico2m6F1snCHw0lPQUe+YhQlrFuPorhXpWRYMsJVTOFzwgfS0JPPeB+c/8wjn1WAKVeIjLbssonKkQu33Vqp0D0HS+UVu3YTMdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pl9Ju5Rq93W/ysDJZskH8IuvoEUr3/KpA6BMpO7NbqA=;
 b=QyjKU8Pl6Rv6LjlCCM+R8ReclHE3+9XijHxJ/gtsBWFmcgyp8YhmCpkTEBXLMz7T7Mfl/aUHHSE+zXA2aYCyytqWguBeZY8LI2AQkdLCy2rm07uXNaveD/O8UjHYgyHszQjbFMPCtSeMfzfQWvTP/caPJNRfi0/XC4HS7zPrghP+ahOoxmcsv0k9bijn6LPqeGiAGdiYmX9nGEcRLzTkkTNQ062MnnK4G/R0URrS4ze795fNLMAasPbF9FBWAQuQLyIwt3G5g1T++90Ywd/IzTkLXwwR6IV2uDhhTectZGAToOxAFzeSJn97pK/crL27jrwogV+Y6P8BTDW373ZBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CYXPR11MB8711.namprd11.prod.outlook.com (2603:10b6:930:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 12:21:29 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 12:21:29 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Remove pointless gen11 assertions
Thread-Topic: [PATCH 1/2] drm/xe: Remove pointless gen11 assertions
Thread-Index: AQHbjuROedumU/3H7EmjCIiTj9RMhLNnmOjg
Date: Fri, 7 Mar 2025 12:21:29 +0000
Message-ID: <SJ1PR11MB6204B9B182FE1E6E6F83F1D581D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
 <20250306-drop-gen-v1-1-03683e56006a@intel.com>
In-Reply-To: <20250306-drop-gen-v1-1-03683e56006a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CYXPR11MB8711:EE_
x-ms-office365-filtering-correlation-id: bcdf2c57-5895-4d40-6e41-08dd5d7296ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Rk00MDNaL2lNL091WmZGNlh4TDdIU0VvUEdHTzZxNUYwMEh6cldqYmdNZ0NI?=
 =?utf-8?B?TWU5Y0tFU0tvOFRCTG8vSHhoOWIyRE1GcXB1SEZLbUN1Z1B4aXk1bk1ELzFj?=
 =?utf-8?B?aU9kdVJOWDhuR01Lb2lqcFhrQjhpSHBiVUl0Y2x1N1BPN1piSVBWU3VmWUNv?=
 =?utf-8?B?VERHS3gzbE90QmNNMGJDelVLRjNxR0p4OXZTRXVWMlFmRElYZzZGN0EwdTY3?=
 =?utf-8?B?aFJBeTIrdjYrZTlsUmdNd25PS3hVODNLQ3REcWxveWh5RnNld3dUS2ZzUHB5?=
 =?utf-8?B?ZWkwUkJWa3hpNzdPMmhvV2ZJZHNGcTg2RXArdE42bDhncmJyQ21PZE9VVTFY?=
 =?utf-8?B?WkUxaG54ckpsNUZZYUplYXZjQlJqZVNRRHJVV2RnMFBZZE5mZXdYNFJpYkZE?=
 =?utf-8?B?Yk5iVitRaXJmMlk3VG90dlpFWDlXRFUxR0Y5M3FzZU5kd2pUa2NWenBuVUJ3?=
 =?utf-8?B?Y3BEQTZWVmpNUDhCMFdLMElmc0xSbGFPTlVxT0ZwcDNwVkdOOUFielkzQzFz?=
 =?utf-8?B?dmFBdlNzL2F2UW44TjZhRzRzMlo5cko4Z1Q1eURqWDlxZU9pZlBUNFZlRDJX?=
 =?utf-8?B?ajNuc1JqUVFOMjlNZG5DSlhyQUt3dUdVT3poSEhzU2ZQQUZIOTBZZlVudCtu?=
 =?utf-8?B?YUd0R0duUkVRYnZHdW9uNTYzbGo1RjBkQ0hGV0VwbjVsMVNVTjA2YTNzejFw?=
 =?utf-8?B?RTAxSkhaOEZydUZvZHByZlJOZXkrV002VUdBQVc1VWhxQ1lRSHQ4NXJibWFF?=
 =?utf-8?B?bWd0ejQrQ0x2NjNWNUljdWZrYnlRaExZa0pyVzRmN2tPWW1XOU9YU0pmSHpQ?=
 =?utf-8?B?b2cxZXNBUG9qc2JhTm9NbE1rNEZhZlpNbytPZ05GWGswWmt2NCtpSVVXWmtS?=
 =?utf-8?B?TXhOd0x1ZzNuSG53dTFmajRvM09XSDVFZllUbitRbzYrN1U1K2d3czAwQkdL?=
 =?utf-8?B?WEs4S2FZa3BqNHNWaExnT3N1Z0EvbXZrQVJPay9Va2hwMlZoRjRnc1BSc0Z4?=
 =?utf-8?B?RkhDZHpYQU5qbDFhMXZhQXdxQXpsQ3BQUUd0Vmw1bG1BWE1aM2lQSGxxcXVn?=
 =?utf-8?B?RUxlbmpOU2dUbFN1MUFRTHc4Z0xBTjV4YmxzMUdOMUR3VTMwYldBTk85azJt?=
 =?utf-8?B?Mm5ERW1GbDBUMzJxaGJaZjJMTTVacllBZkNSVFFqSHdZdzg1MWdwTGJ0T1lt?=
 =?utf-8?B?UCt0T3J6MVN4ZTVTUCtobVM0b0YrNjRJVTNBNjA2ZU85MjlkWjdudWNxd2c3?=
 =?utf-8?B?NFpkaVV1ZTBuWk9nVXJZLzdLWHV6S1VVbHBEeHRuQXU1cURMbzQ2eDNlb1Nu?=
 =?utf-8?B?dW5WM0tqb20zbHJaeU5veFNaUDhET1hhWVQ4cXlBcHlOTEJ4eHY5aVlnWDU1?=
 =?utf-8?B?TkVlMFBzU01VcE9GMmtVWFEraFdkcVYrYWpWZ2tUR1RFcWVweHRKVjVkVmV3?=
 =?utf-8?B?U21FdDVOeW9yWGlMaUdWaXFUNTlnbCtEdHRhOVQ2Q3RlMHVVV0pYK3FJUys3?=
 =?utf-8?B?Q2tLOTA1UDk2QVdsVE9WOWtJOENzRWI3YmhjTjU5YXBLWXVyTUUxZ1RmRkpG?=
 =?utf-8?B?alJEcHk0WkUwdjB4cTNzbEpkK2dvaTcvS0FVYTFjeTNIbVVJQ3hkb0s4a2o3?=
 =?utf-8?B?S3FjWnE0OUYwR1ljVkZRRjU4dk5nWnB2RGpKY2Z3NVdKU0ZJWWZGRXVkMXBY?=
 =?utf-8?B?cXAzZ1BmQVRxKzZwT1Ftb2pSRHA5bHZVRHJrcVBpY3lPVkcxb1RSOFJNTGtP?=
 =?utf-8?B?TUdSSkR2YUM1VXVCY1Z4RWxHejdWWmdPK3Y2bjhsM2VQRlB0VHZ0NmJ1L05o?=
 =?utf-8?B?RVhtbmdjL2JZenFaY2Z0SndVSGlnWktOZWZLNUMvV2tpUVVrRUpSbjBIamx5?=
 =?utf-8?B?TkVIbllmR3B6cmhIdnQ5bFZWdFdiRHBncURpaWdnMGRJN1JPSFB4b2M0U3BZ?=
 =?utf-8?Q?F83BHcDy6KkhCRpDLXe/S/ww/cwnAGt7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFBMTXVTVW4yYXV1SkNreEphSDNXRnhJUUZpT1lSUWV1NWZxcTJYcVVVTFF1?=
 =?utf-8?B?b2Rqb0dIbHkydm9EcGFzMnNFa3pOeGE5RVdNZ0VaeWRWWnlxYnJtNzV6V2ZQ?=
 =?utf-8?B?RUo4YXpaczAvMU52ejcxUFpyQmJpRTdRckwrR3RseVU3YXpZUjMwYWJFa0xr?=
 =?utf-8?B?VjY0TXJLMm5maEJrTURUL0xYSDRHNzZvb2YyN2kwWTExSHJ5emRWZjJTWTNU?=
 =?utf-8?B?TEZOSERGTnVUYVhHTlNKaTA5NDhhZEJwNmNoWTNld3BDYlJCMzJVWExLYnpZ?=
 =?utf-8?B?K0pKRXNBemJTZlQrTXJjczFISS9KMWJnK0laTXVjejBuc0ZlaEFvQlRJbGg1?=
 =?utf-8?B?ZCtUMXAxTU1DSHM1c3k0SktVRzJTN3daSFdQUW9tdm8xdEhJSjlPcWRQVC9H?=
 =?utf-8?B?REt1bXNXRDNaMWs5Q3NNSmZKK3ZLd1dranUwMWFHRW14WHhCb0w4cGEzL3JE?=
 =?utf-8?B?Uzkydy9NaTdGYjNGdWp4cDcxZjRhRW5aRTNER09CNUp3Qmx0NjR6SFl2Z1NU?=
 =?utf-8?B?MVpTT3doT2JKeXRQMzJGMGpSTEpFcUNJNHRMVzdOaVFhNU1jcGRkT0ZNTm5E?=
 =?utf-8?B?S0FUVDR1MDNYVmZtMnNGNUVnRzFudWM5ckN3bkhabUFrVURsRmVINzlHN0Vw?=
 =?utf-8?B?MlRvYkJiMUloTnZ2M2tuMk0xSk9HT09KZndoVzIwQVliNEZtdnk1d3d0OC91?=
 =?utf-8?B?VHloZFZuMlhJTGt4VlZUcVNiWkltRlkxdjZlN1UxL3NKVHdydzB5cTk3SXVE?=
 =?utf-8?B?eTY0Z2NiQjlPSlpRdVNiK0ZVemhkdmpGM0hDUUZmYXFnd3J1Y1NheFR2MGJs?=
 =?utf-8?B?QVZZa2FJRDFGcUJZMnZtejFMOTY4WjgzSVdoNVdmaC8vam9WR0ZGRnFxb05F?=
 =?utf-8?B?STNzNnFOK0Rnem1ySjVVUUFjZjdYd0VxQ0cybmFPL0VXazE4SHVKWnRsWmZx?=
 =?utf-8?B?bUlCM0t2dzRPOVVDSjdTY0ZjTStFN1VyNEdFUnhCRDhRMldzdUlyTHNrUWtV?=
 =?utf-8?B?RlY4QU5uUzJXYk93b0FuQjg1Mk0ySnRUdDdOU3VQczcybE1tTWRLQjBUTktB?=
 =?utf-8?B?K2FmMldFZE1oTlRVMzVVcy80NVVLZm9pdlRTM2dlSFMxa0VCYjlyTjJZN2Fm?=
 =?utf-8?B?aDhvajB3TDBpN2tyem80VDg4eUdDOHlVTXJoVEFZMWpuT2tONlQ3bVY5djFt?=
 =?utf-8?B?SmNXQUN4aDVMdFFFREhMWDhlZXlmZ01SLzFzc0Jidnkwc3N5dUVHeUJiM2JY?=
 =?utf-8?B?cXhadnJvcXBFd0x2enJUS1kyRnh4WHY5cHVxNnBDeHk2UllIY2NWUXNrcEZw?=
 =?utf-8?B?ZTVXTUlScWNhWEF6bjljWmtFQUdna1c2OVFjNjRVbkNlQllWZkZsZTh1QmYv?=
 =?utf-8?B?bnZsRXl1enZiWThBQ1I2TzhvL1VWT3Rsb3gvTkl2ZWRPc3RyR1B3dTlzelFy?=
 =?utf-8?B?ZERRYXJjSW54OTQvY3V5M1d0Mit6VkJiUjZJMytzU2VqdGxFNTJNWVlsZmJt?=
 =?utf-8?B?T0s4RXFsUHFFamJlZ2xOcXNjTGkzSUExVE9WRFp6Qzg3NE5LaDlsTC9heHk0?=
 =?utf-8?B?bkt0UHM1RzlsNjdacktNbm5zeDI4eVJUMmloUXdUQVVSTmZJQVVGVXhNelZO?=
 =?utf-8?B?L1JZTFRVZmo3RXFJaW4zbWNYZjk4MUhEL2pXSEwreVc3RXZ0WnJSM1dOV1dw?=
 =?utf-8?B?VUVYQjFjZm1Ud0wvQ2NvOTlWY2N6WkV3ZzFlVXRSMFRwR3NBUERZYjBPUFJn?=
 =?utf-8?B?REwyRVdmb2lYeStWVFBFMHBWeWNxUXNBb1JScHZENmZCNHFMQWhLdzBKSVZx?=
 =?utf-8?B?Q3pRY1p5NGNuNU16SVRqbWZNMjRsOUN1VmdQMWhDWG1ERm9LY1A1WStHTVow?=
 =?utf-8?B?YW5USzdDUjk2bnJKRW94UEJGd2tpUnVwZzRmSmVHeXZnQzc5UExPbE1rMWlH?=
 =?utf-8?B?RnpNRFZMYXJzOFV2L1pNZkxzaFVJR1I4VE8zZTNwc1NPVVg5N0p1bStFd3pF?=
 =?utf-8?B?a2ZkMFAwSHJQcW1laWtVcGZ3TEo3M1Fjelpzb3JYeTVXT3dQb3JyQWppaTJC?=
 =?utf-8?B?VHJVWTNtbHBqWmRFZ1Q4MnNCUEM2TTdYZzd5ZUpRTEROYXRxU3RkaWl3eFRK?=
 =?utf-8?Q?+3UNnG4jGXT4VA0FekP6ti/Zu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdf2c57-5895-4d40-6e41-08dd5d7296ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 12:21:29.1686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kY5AdIiwblgMNDDEJN45OpY1y1174ogr0ui7Z5c8F0z1wdfmRLit5ipogDwJBf2/b6ksit7GkihU0WeCzpQeSyeT88MUqRQJdKOfVkw+Z+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8711
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
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTHVjYXMNCj4g
RGUgTWFyY2hpDQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggNywgMjAyNSAzOjM4IEFNDQo+IFRvOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERlIE1hcmNoaSwgTHVjYXMgPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL3hlOiBS
ZW1vdmUgcG9pbnRsZXNzIGdlbjExIGFzc2VydGlvbnMNCj4gDQo+IHhlIGRyaXZlciBkb2Vzbid0
IHJlYWxseSB3b3JrIGluIGdlbjExLiBTdG9wIGFzc2VydGluZyBmb3IgPj0gMTEsIGFzIGl0IHdv
dWxkDQo+IGxpa2VseSBleHBsb2RlIGFueXdheSBpZiB0cmllZCBvbiBzdWNoIHBsYXRmb3Jtcy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3JjZV93YWtlLmMgfCA2
IC0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2ZvcmNlX3dha2UuYw0KPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9mb3JjZV93YWtlLmMNCj4gaW5kZXgNCj4gNGY2Nzg0ZTVhYmY4ODkxM2I4MWEz
NjRiYjM5M2Y2Mjg2ZDUyYmU3OC4uOGE1Y2JhMjJiNTg2MTAyMjRiOA0KPiA1NGU0MmI5NDMxZGNh
ZTE3NGFjMWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3JjZV93YWtl
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2ZvcmNlX3dha2UuYw0KPiBAQCAtNDks
OSArNDksNiBAQCB2b2lkIHhlX2ZvcmNlX3dha2VfaW5pdF9ndChzdHJ1Y3QgeGVfZ3QgKmd0LCBz
dHJ1Y3QNCj4geGVfZm9yY2Vfd2FrZSAqZncpDQo+ICAJZnctPmd0ID0gZ3Q7DQo+ICAJc3Bpbl9s
b2NrX2luaXQoJmZ3LT5sb2NrKTsNCj4gDQo+IC0JLyogQXNzdW1pbmcgZ2VuMTErIHNvIGFzc2Vy
dCB0aGlzIGFzc3VtcHRpb24gaXMgY29ycmVjdCAqLw0KPiAtCXhlX2d0X2Fzc2VydChndCwgR1JB
UEhJQ1NfVkVSKGd0X3RvX3hlKGd0KSkgPj0gMTEpOw0KPiAtDQo+ICAJaWYgKHhlLT5pbmZvLmdy
YXBoaWNzX3ZlcngxMDAgPj0gMTI3MCkgew0KPiAgCQlpbml0X2RvbWFpbihmdywgWEVfRldfRE9N
QUlOX0lEX0dULA0KPiAgCQkJICAgIEZPUkNFV0FLRV9HVCwNCj4gQEAgLTY3LDkgKzY0LDYgQEAg
dm9pZCB4ZV9mb3JjZV93YWtlX2luaXRfZW5naW5lcyhzdHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1Y3QN
Cj4geGVfZm9yY2Vfd2FrZSAqZncpICB7DQo+ICAJaW50IGksIGo7DQo+IA0KPiAtCS8qIEFzc3Vt
aW5nIGdlbjExKyBzbyBhc3NlcnQgdGhpcyBhc3N1bXB0aW9uIGlzIGNvcnJlY3QgKi8NCj4gLQl4
ZV9ndF9hc3NlcnQoZ3QsIEdSQVBISUNTX1ZFUihndF90b194ZShndCkpID49IDExKTsNCj4gLQ0K
DQpZZXMgbG9va3MgdXNlbGVzcywgTEdUTSwNClJldmlld2VkLWJ5OiBUZWphcyBVcGFkaHlheSA8
dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KDQpUZWphcw0KPiAgCWlmICgheGVfZ3RfaXNfbWVk
aWFfdHlwZShndCkpDQo+ICAJCWluaXRfZG9tYWluKGZ3LCBYRV9GV19ET01BSU5fSURfUkVOREVS
LA0KPiAgCQkJICAgIEZPUkNFV0FLRV9SRU5ERVIsDQo+IA0KPiAtLQ0KPiAyLjQ4LjENCg==

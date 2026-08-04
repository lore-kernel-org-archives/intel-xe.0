Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6708EC55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 06:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7AC10E101;
	Tue,  4 Aug 2026 06:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSBFRXDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D83010E85F
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 06:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785823524; x=1817359524;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QtZ2YwdaKJCV8wq0buZr5zWw/3Jkm/yH0sJ5X7dS/Fo=;
 b=jSBFRXDj9DNxNwnUt6M2uCTTQK5gVOihL+RDe6xomg99hSwIQ/tH5zVl
 ZQ2IS8vTfNFnYt5HaQfAuA8frkyOFTey2Wf+SwAH71AlQLTLeW+E1/Hkn
 htOyCAOLpdvtghV8zrksvinrKY8NzYWxfZ+i3XkKrV+U0L1Qq0doLnZTm
 XYTgTvcXmiLoQKLNIOgOyQRm1O6uEYh6rQhZ3Gvae8XJ0SekPQ84qFf3K
 IjweukYuF6fGms5nxV2TxLdKqNe0BNOcQvoy0z9QOTM6l9EnhA7LPeV54
 4b7tHYWl88B3jaZab0aZTWStf6MkqsKEUaAnsDlSFsTmGOJe2UccumAMO g==;
X-CSE-ConnectionGUID: w6IjdfsRRbKuJLboF6B67Q==
X-CSE-MsgGUID: amVHCGA4TJWZxKAmWiSSpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97734575"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="97734575"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:05:21 -0700
X-CSE-ConnectionGUID: H6CVawx1RXeL+dn4Ovmqtw==
X-CSE-MsgGUID: 751kDbQ7TtOxSuts4JvbOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="262007504"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:05:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 23:05:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 23:05:19 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 23:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dK7M19mBZNzDeSDP/DDcT5uRqe6rPK1026GDVKXQR1eUdy9stC+ivKTb2lN2WrDgZ4KoCt9//pZPI37eFPldmBK4YQV5ZnqpwbW/RCtFcgSDympcbxvODGE5hL2JaVHD0wVfV21qRxKgC79KxjQ56jvP83Bcy2zzxhiW3SrmoyUkK+SV6xxWEJaFo0YWuRWHri+UTbMTRW5ZBU4FSKOQ3Amowm0mh1jq8BKpH8Vo1JMr0pHsR8r1QcMcSGgUheRNCOKRap/4LvEEg0Md2GUaZQ8ZKFaBUxCoVJ/H5FmisKg6Fk6aqVUr6wFptV+BZgOuXdlun4o7fTC/KkhGWvUDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h6Eu5OmL35LbJCqlaKRDJ8wRNzGDlFMLI4TytcRuNs=;
 b=xc51jJHAauUeuVOWAeavhLNyjwoilzm8SfPpNqE8YCtoQEx7n4wqsSQt/qpsF3KmiK/EOKbJaz2Z3p5VovNa1YdvQia98diQYPQATo42v15Ks578gqn1AT+6ZYWLPxxzXdncfmeD+Z3e9JUsN0/Q8H4f/Z/mghn1XqEO0xMtPpvxR1ux5jliUAlcD09KLFH71/Du0W7jImrRlyQubz39Eh6WOXFju0YqV3UuztImOYimCRfjZ+TvFdxwXmnvbbrPGlOr3oHu1atKc26X9rkWgDaQYM+1JIlWoih2PHdSopkwd3JjKkpq4o6Ckat8G6bGDkUmymlxl7IHt/+ZpcuQOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SAWPR11MB9760.namprd11.prod.outlook.com (2603:10b6:806:4c9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 06:05:18 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 06:05:17 +0000
Message-ID: <f70d047f-021a-4ac0-892e-3af837aca082@intel.com>
Date: Tue, 4 Aug 2026 11:35:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/23] drm/xe/log: Extend components list with hardware
 items
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-12-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SAWPR11MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab68e2d-e056-4cbf-9ece-08def1ee5b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: n77d6HddIoj7PEZ0Pk2F54NXR8w/9U/PSA7Ii/2R+fth8/vFAYmXAk2OF/5aaqhUFz0SfJ6ZsjdYlzFPCGKzt3Gi2TGTsTOkyg/NEjkjSJRoKMUzu4uMvBhfQHZtpH0+kTv/CVSe87X42G8OQbDxTmcjv/aIPG3XHEFFSPNQH8Qypf2UuZtpwmODNWi3XrBVLqN0NbI8/RaO5gMXi6nxkj9+buxLjW6Nm+3QV8oOXtJPELOEXFhsVh+ZK/ZWGyGmbrAjHIdKzuk0unpXd7SzqWJwSGGw6c0SXW1TrOm/WDM1lipUAaiZfZ8WugUy5Bi6nY9FppNV7uIn8kZZ/qhAUXxO/8G07rAGbsd9TQyAQfWAVvVJnkEaDovynk6ftHgNSQwiUnJNFpi7hA9wlSg2Wgb105GdMflo2ZZL3HmFOOmbzvokVjzP6F66/Uw8pRUw6pm/vMLEtz88YWrZ2EO7tXPhJlTRdtxTLqAy4k+U67X6t23950SUYd3rANRPM6UyA5v3/LP21zonNqCjZbEeYXiozWW03qB+qt019t3jHzLb6bOfNZFaIW49b9lyKscMXJL8munNK5yw4bN+qz2ak9bGO2t9tpNcMSUNtq8DDO1KvpO2gMtSIlTJTSAeyyxUFKSXB+1jMJoDu0Z1sI8lhKf3hIckme72R5Tc41Q1r6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE5IU3NwYWhUNWlRSE00OHFaZW9kR1F5VGhZcE4rTDZwdlVyQ1lyTlRucU81?=
 =?utf-8?B?WUh5NCtuYzB2RElmb2NydE5uY0lpUzZGdVZEanptRWJFWDQvaVRqY3FYSU1F?=
 =?utf-8?B?aXhCdktkaWhTUURQNldkcGFUYk9VRDhEMks1REFMUTJmZkN3YUxyalMycnZa?=
 =?utf-8?B?aHdKYnVndHVSRXBpVUVVZXVEM012THRBUkswcUswRzNZcjltamtJYTJ1Zldw?=
 =?utf-8?B?SXJlTHk1OXhyZThKUTJKbS9Zek5nQzFOc3liZ2xnazdUVG5pL0RnSXJ1QlJW?=
 =?utf-8?B?VjViVXU0WFYwNWNyTmdwYjN4S3NBZnVleDFKeU04WUwvUWVrK0Z3SVcreTVT?=
 =?utf-8?B?dGVPbmxJU3dqbC9KZ3o2eDNja2kreElaM09OSVJWMzVIWDlVMVBJOG9FZXg2?=
 =?utf-8?B?RmlKWkRoSzFHRHMrTzhWUUFQMk5lMFJlQzdWTG5BdGZ1eklXM1o3bldWN0hE?=
 =?utf-8?B?YnlxK3gzd3ZIamZDQXNIOXpCK2s3N3ExaklrNE5oUVFyMEcvWVQ2VEdGNXRG?=
 =?utf-8?B?SnJNdWRvUzZwdVdBT2NwcnlVTm5TNVlpOTZRSjloRUtJK0pOVjY2NGF1VDEr?=
 =?utf-8?B?Y3lWRytnL1JobklWd1JsVTJ1V2lRTXM1T1p5RzFuczkwVXJHZjU1dVVabmZK?=
 =?utf-8?B?V1l3R2I0U1pENllQR2hSeWtSTUNsSVlza1dCNjFrTEZicTJTUVRweEFMRmpQ?=
 =?utf-8?B?VmR2b3YvTGxGZTkvQTNQdGRFTmxnNitrVnlDZFdIVDZuMmY1Ny9oUUh4U29B?=
 =?utf-8?B?Mm4zd1c3MGdETkxhQ0o5c3I3MlEyQXhIUlZ5YWRIdkJHWVQ1Z2FDbVVuMUl0?=
 =?utf-8?B?TDhLd1dvZWpPN29qVHUrV240a2c4djZKS0hvem0xd3l4YmU1bXdlTlZzcG9H?=
 =?utf-8?B?ZmFZMVFFUUZrVXNvOW9DZC84SXBKcWJZZENDR2t2bVNHTVFldk5tcHhJTUZL?=
 =?utf-8?B?L05Wa3V3UUVXc3llNHk5MCtlbWViK0NNZTRxNDJNQzFkM3lqU0dDa3ArYlNw?=
 =?utf-8?B?cU11eWNXZGhPdXA0eFlmaU1OWkdUYXdTWjRUbllPdThwZjVzWDloeDhJWFVE?=
 =?utf-8?B?cWhBVUZhSXkvM2dhbC9jSXFzb3JtOGhzZkVpV2kzQUV5ckdmRU1iM1N2NFZB?=
 =?utf-8?B?WCtlMExtaXRndWZaYTRsZzkyMW1tL2lsdnovQk5ncTBtZUJreDE3OEFPV3Q2?=
 =?utf-8?B?bHBrQkVieGJMRi9IZzNjQ2NWajRiak1YYjJVSkNpYnhFVUVOSDlUZU02Z0xu?=
 =?utf-8?B?aVFaL090RStCZzdON1lZV2FrTEhQM3ZzZlJhYUwyN29WQkg4b0JsUmdCOWV6?=
 =?utf-8?B?YldRVkNLcmlvdHdlUDBNV0JwN3ArbzV2Z1JkRnhIZU14RXZ0WmVwR04zcXZp?=
 =?utf-8?B?ZlZERldkMmFjR2c3UjZYRGVXQlljSW1wME9GbDFaQTAvMXZQNDdRd1liTmpz?=
 =?utf-8?B?Q2g3QUxkbzJJZytqUlZ4em5COXVlRXRoMGdONUIvNW1GajdCejJPN0dhSnp4?=
 =?utf-8?B?SmFGVkxLT1NYai9kTmRZeFVpL1Z5M2YremtDMXNwMWU5bmhaNlRrcXFmblJD?=
 =?utf-8?B?SEUrbXZWZWVQZ3F0QnRNZGROb3pMbUpPbFUyT3B2MElkNkU0SXc4eHMxUUYw?=
 =?utf-8?B?aSs2WnkwTU5NL2JFWHNwUW5QbUVMeVBwSVg2eU90WWlhM2M5OXdOUzdhSlcw?=
 =?utf-8?B?ZmlsUXUvdEZ3ckZNeGR5NTFteEtabUx6MGtrUVRaMTRKUXJ4MlV0NDlVSHN4?=
 =?utf-8?B?SVBpMG5nNHB5Y1ZkUk1UZ0hlR1l5U2xOdGkzNnJpNHFDeFdpNTFHc1JDbWxm?=
 =?utf-8?B?STg5WHp6blFpV01TamFWK0pydHUxTlpLdzMrNS9hNTRhQnE2SjBIREg4dldY?=
 =?utf-8?B?bVliWWxxMnp0Wm9obi82NXJ2MGU3SWxiblQ1YmllVlcwY1EwN05IUGNkOXNK?=
 =?utf-8?B?bUJPRUx5OUVDb3NPWEJzR0pFdHRlMm01T2d3ZTlicG5PZm5HOFdoR3hxTkRF?=
 =?utf-8?B?OXl5bXRWMGhTV0FDWDBZdWszYW43YlI0Sis0em1FTDNZZWlKQm5zQXFCV1RT?=
 =?utf-8?B?Wmo5VWwxU2U0a3BiL0FtL1MwT2VBYUJFSVZQR2F1RlF3TGxpaURNMTZGQ0JU?=
 =?utf-8?B?T2JYNmRaRW1IYjFHbHludzBVd0FVeW9FR2JEWTdDL1NzMVlmQnZFT2lCSWpw?=
 =?utf-8?B?OFdoS1RUeGhSTXUyeUd6VDB2WCtscVFqODg0eGFpaE16MjFTcE9WR1N5R0t6?=
 =?utf-8?B?cy9oUzhDNkpuc2ZlMUk1SThEV3ZycDJ6S0FDRloweW9FbFpybzN4V0lnbS9v?=
 =?utf-8?B?d1F2ZDIybWUvMkxqUE0zSW5TT3Zrdkd0RGVxQlFxZ1pUOEZPODllT3hMUFY2?=
 =?utf-8?Q?/N04dB84IALEFC+o=3D?=
X-Exchange-RoutingPolicyChecked: m3IfAhw943TJ6j2ScU11XLrfnc3REriZQG/2mxdW7Y5wi5QEQEZwAwmAXDbiPxhWRlY8LQYO1EmHsOspmHHeWxeMz1alE/H1rbhNb5OjEPQ77Q2xDZkZMwsGU1E8/yZEPZ+oeMfYZNGToJLP65kpb55j0QTxWifh58Vrk4ZdnUVbAHDSzxWi6dC2oGJXkj2NOikdaIJSawzCzCEF+ICXrtMBe/QQuY/ONSDf8oj5794i2u0qmC6V/9qSJqoJG4PPYcrYZggVg11F7NOjheJRStVTSSN/3742K1KANWbiQWCRpCCBrYJ2yz1q2rU/YMe0wOIx7thFrE2TymUjI3Apxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab68e2d-e056-4cbf-9ece-08def1ee5b8f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:05:17.8138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYnOFY4/tZyBFBy6gQvq2sNGB7cPv99Ji85MHnES+Mga+EGwjI023AreSOJUhbXm9tk5HtmKcOJiR2ODI+MqXv3nWD4O5Uynsgy390PBvkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9760
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Update our super macro with new top level hardware components.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> ---
> v2: follow enum xe_ras_component values (Aravind)
> ---
>   drivers/gpu/drm/xe/abi/xe_log_abi.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> index 4861a5b58c10..b3373d4b29d5 100644
> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> @@ -129,6 +129,10 @@ enum xe_log_location_bits {
>    *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>    */
>   #define DEFINE_XE_LOG_COMPONENTS(define) \
> +	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
> +	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
> +
> +#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>   	/* */									\
>   	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
>   	define(SYSTEM, 2, DRM, SW, "DRM")					\
> @@ -156,6 +160,14 @@ enum xe_log_location_bits {
>   	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
>   	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
>   	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
> +
> +#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
> +	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
> +	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
> +	/*     HARDWARE, 3, RESERVED */						\
> +	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
> +	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
> +	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\
>   	/* eod */
>   
>   /**

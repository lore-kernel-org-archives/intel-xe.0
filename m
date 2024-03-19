Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2D4C54E68
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 23:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1843510FC4C;
	Tue, 19 Mar 2024 23:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHA+XQ9a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE1010FC4C
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 23:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710891318; x=1742427318;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jrYQUi482bRIgrvgGPVf2QKU2jbF6dBbci5QzEmpL4E=;
 b=SHA+XQ9anhp/ZPJ++ZT8Z3Y/NuFiJsGkgdnLl3Ne6lGzjJu9KnKLI6tz
 SKNIBdyCL+KHb0dEAgnxvfa5Y1V/8GKSeEWD1AK5HHTtxGswi7lmf2KaO
 VO8Z9GO0vS/9jfB47gP5RoljzjpWI7E/FsxVIxk7NHogOWOv8Bf2r7q6u
 Mpj1wmo7+H0I12C/Pi0vZW3dKw07l6j4jgxHDhtkcjo63mN+BTroty57c
 sp6YwRX2tiRZ6mGYksflIIr1VnR+keZpmDg6RscUFlC3OX5qb922D9kDK
 yEvSeeQku5JnsZr3F3LOoyOjTRWE1bxzfejqjiaofwb5xS2LbvItVlBkw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6400844"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="6400844"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 16:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="14360643"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 16:35:18 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 16:35:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 16:35:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 16:35:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvhEX70t/h74dPc6ka7hDbAtYwBAzLjmQbconkAbIvxNBBhPuE0yBk41pVTlwgxpBnqtmPKn+FOuD62l6hCup7Fqfg1GojNP6rCqfdefq0rwL2OqRDK5AivrdOEfnO3uDlorEMujrF8gpOEkxW+YGX13DCl3R/8hOOPT8iq5MMTh3XwloYf1kaleEsxqRHWpNxSJNlt0Nm5Qlq7aVRAC+sp3X8f+IdhUvKrtu56NQgLEQG44QHt8eOtLj+r6N0wh/yTO0ReKTJT32yE1R0224WaZecNIS0wvRLWMCD2nozWmOgitWA4bOrG4rEfdwqMs1eUAp42QIokFG7Wqo+j3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqkZDs1r1Bu9QKPE1UIgBidvG3uqSERF9Q94Ja/8iko=;
 b=YVS4XZXdXNxBYaQmNLgjbh8L6y8otRCkP70oTvufxPut1xWhFxRl81t7gxGYEQp65ZCutiogn6UboAw0IpZCnlpJIRFLcMNP9ZgZfdGW2z1AtKUpvZ26+T26I0sSS64YU/Nwze6/15BOh8gMJy/pAFe31dcLz8CIFoDef8WM15rvLQr3xpGJspP7fEpffqAKYuQgO97dZst57V3UmHrg4CVsY7wKA70otfOW8u94W3mYEfl+GpFYszQD/l536/C9wAbbWCiu/8ndgDHGpA6yjMBBc/hdFkb8GIyyqE/vLc0/U7HZzzELhofs288FrmzIUtsZHaeaVv6XXQKh/jGbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB6931.namprd11.prod.outlook.com (2603:10b6:510:206::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.10; Tue, 19 Mar
 2024 23:35:09 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::a223:8cc3:d822:d2c4]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::a223:8cc3:d822:d2c4%5]) with mapi id 15.20.7409.009; Tue, 19 Mar 2024
 23:35:08 +0000
Date: Tue, 19 Mar 2024 16:35:06 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Use correct function pointer type
Message-ID: <ZfohKlLeqcPdfq/D@nvishwa1-DESK>
References: <20240319174919.1847-1-niranjana.vishwanathapura@intel.com>
 <85msqu56g9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <85msqu56g9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf5c1b1-9516-472d-d175-08dc486d36b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lEu8xPTBZYW41pEdIT+HvcuyZad4P8nPqp5U0PtvS7e817Rm0k84OePTmUBnyGLYdMSCPo1fL3yCx/wP3AoKTDhYaCiC5EsJ11skXVoO/haWcdGA71iWyjOWUZdsT9lOMlw7HgaWLuBO9n5aPxx/nu3rZ63E2yBO002dU0w8j2eLejSTuaEOxzshXRcF0iDm4K0KuZFzFLADIBEtBUp527JmrHv9a8SPgkUAqvTZgV25Qu9cEHnpW0uInOHYjIiqXTzQiOPssuRGmiVeB9YJm9cEzkgGZR19F7K9fMnKh2tNqpaF8XMZPDOmtg/iSfn3VdewRoEoyrS399OWW/9oxp8gqh/etWIwi+yv3ChpGZxFUY4+j4sIuuOJ9StHJGKLEPcAtjhUdvhftdf3ixtafVwwnezzsfNVAkUpXjFYqTrvBTfLDEHWvWB0+sDP7qFX5pLd/XJU7jH125dpTwKvdN8mPLfdi663YxMJLQFiac/7maFBGN3dSnuLJN2UdbrOkk1qCH4kQw/N+0w4CjQkh1yDMJwyeasO9Rn+cdET0id5qwzHvEOwOQtmcXxbfuZ8v/PXX6VutNfiy59i6luqXlnpsWpmGOq5Xt4Bi0Mn0P522X7dLecPtLLcMYyosUFeq9W5G+HC9LV0Uw+0b+qkKQarpwBlBnMTF+PN25kpp1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ATpR5FOAgtKB2ihCcF9abCy2nhCaMDKKEhfU9mKBLPY9z9x8Keupunm/yo1z?=
 =?us-ascii?Q?bMUBAonmsj3yPw6DKyja6Ibe6NfSWrLJBzrl8DZUlyJ6hrw0MJAOaUTgq05w?=
 =?us-ascii?Q?GfyJnrqsqGpaDI9LyPOIcfpeeDhOZiQ2vOM0f+qBYkWLqaD1YdHNyMtx6EM2?=
 =?us-ascii?Q?Wa0auyTZdVwlL2ViVusgspR1Ke5OUgsxcdqgENjm1RO8DJKD4weTNoTeZFDg?=
 =?us-ascii?Q?nQHS9nVpy7q//Sybr0fU4s5akPZrdthoDSl+3zx9AYJmdnwU9HcunSg/tBkL?=
 =?us-ascii?Q?y0XHxoOpIDXCBpSv9fQW++8/LzNNl5IcCI2D2VTmHPeZEwW0+YKVb/KHSVA3?=
 =?us-ascii?Q?SUYqiGW7axLILsYAQMuR9+XdUoXy4iQPZuPBw0s+pDmH4Na/W79yCw174cqE?=
 =?us-ascii?Q?ugmsEWTLZ62YKlADJHRM+zTrqEuzpK7Jtptzwv5BSPHnIdm7NsdTT4JTBvOW?=
 =?us-ascii?Q?cSPmFZPttYoJQzH4VpXPLhKxXPXb2R7zTe1A1plqXcbnPcAioLnFmEs1/tgw?=
 =?us-ascii?Q?o3Wbu6dnvMTCjMrUaZXVjlZ1g02+PfrCfM0R5L5u4AKuy8GvfNPIJcBkfOl3?=
 =?us-ascii?Q?z84ySvm4/z1O2h2MUxMyC0CMTPFpQm0WFzNHJ5oikWTsbY+yLLJ8jTv6zRrJ?=
 =?us-ascii?Q?h6YcQtSeFGhh8IMnzDHtyA4ID4RdslGQA1yMVRJ9RZccygMWeVayCJ8WvQkQ?=
 =?us-ascii?Q?nx+INeSYyTqerSDnlOVTyb+MWOTiI8ngSt69MFp9z90wft4hydU7JWWVvws+?=
 =?us-ascii?Q?DeHghFJ9st1zCxiQ9zChdY9SMIQIBmIBMbS2czLm39ZERk0Xo+E5cLqkg4HL?=
 =?us-ascii?Q?YgIatUWKEf8pz5YwpD4tWwy/+MREUI/HLi0K5TssluA+49OGvvfea/yXKVJj?=
 =?us-ascii?Q?a8d2/Sq0hkD46QoocNAv4KYzMKKve9z2gYBsBTmk91wmUxpTyNUOOywCicf1?=
 =?us-ascii?Q?CrQtJfmkq5pozaaHydPfe1nEDAdz05fp4T9rDqgIcHao/5kkTV/U8kIYgrWn?=
 =?us-ascii?Q?PnfGxuHgym7/rRN85QvFuHcl+rZ4YRJctdNXxR2Okdal06nKmeFvHs0JZplM?=
 =?us-ascii?Q?kHBL4jzGoHAfJ06D3TyHEgFTrnyyKArYneyPqjoaTq+x/0Pp2SL/0GKQxolf?=
 =?us-ascii?Q?Q/0EG7nxqNX6CNPjfbHkpqN6GY6nJcUFgoxsqzZZGh517s2QkGAPSh+2spLR?=
 =?us-ascii?Q?jkuQRFQxQjjQlIiMZfAQIrMVIsfdncltM24O8BTdnubLY6qX/0ik8lh2GZiC?=
 =?us-ascii?Q?Jp/tn6gD0ygxsbEcVJgt39q9UrW3Vz6dNKyYcQ/OQqcw9Fx6FOH5pu3v43uP?=
 =?us-ascii?Q?tlXTY48YGW9wCux8CmNNo9vx9ifDfAcUeVEv1SKtrNvHy3yNTjrphfilKgtr?=
 =?us-ascii?Q?YCqqKT6+U7ZRR1Wwvxa8l6guHaUKJDm5cXQoZ5phPvw1DoH+kyY4RDLRKaPv?=
 =?us-ascii?Q?bOwCiE47vJZeVuiGVVcwMFq4oIdyHaXsee0qYnjRQNDr+jHeUjDQ+7nW/g2/?=
 =?us-ascii?Q?CK31AITeTMVRTBh2Z6cDb+QfvsvnE/zNYA0anzt5CeO5R51MpCcB+YZEOH0B?=
 =?us-ascii?Q?KxRstKL0o0+PSA4K5owOX3ARlyM9tvaZPY8kwMtYDIFqTHgjBhWQUWEm8Ju6?=
 =?us-ascii?Q?Ww780adCNUklyRNLItSL6/I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf5c1b1-9516-472d-d175-08dc486d36b1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 23:35:08.7695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4z1+zwLOXPQXlBO7j8x7Vdah0P8U7ay2GyTamqu7s763rCXpeG0kMQbiZF1OZcanFy74BBlwCSuJjkEAZ/8rmi+G1MZYW2isGWn7W4dR0t/3POWKtT8Npfz+XwnjHc/Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6931
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

On Tue, Mar 19, 2024 at 01:09:58PM -0700, Dixit, Ashutosh wrote:
>On Tue, 19 Mar 2024 10:49:19 -0700, Niranjana Vishwanathapura wrote:
>>
>> Use xe_exec_queue_user_extension_fn type for
>> exec_queue_user_extension_funcs.`
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 2016c1af9633..dd10188e8f4d 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -388,7 +388,7 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
>>					       struct xe_exec_queue *q,
>>					       u64 extension);
>>
>> -static const xe_exec_queue_set_property_fn exec_queue_user_extension_funcs[] = {
>> +static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
>>	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
>
>The change is correct, though the types xe_exec_queue_set_property_fn and
>xe_exec_queue_user_extension_fn are exactly the same (one has 'u64 value'
>and the other 'u64 extension'). So it may even be possible to eliminte one
>of them. That is why the compiler does not complain.
>

Yah, but it can change. So, using the correct type.

>Anyway:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>

Thanks,
Niranjana

>
>
>>  };
>>
>> --
>> 2.43.0
>>

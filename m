Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06C9D3C54C
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 05:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242B410E0C0;
	Fri, 18 Oct 2024 05:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlwDjyD6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D392510E0C0
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 05:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729230297; x=1760766297;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AfGPu2ikN6Qqi0A6Vbm/yLlCJMOo0ZqzAWwcyUxQE+Y=;
 b=TlwDjyD6cp6MPV+pwTok2OYpkRppdcG7QinYZq/kVSk/23giPJ9lA5JD
 k2/rK20KkhEu2XSFXBHzoDCMcDwRRmQXRirhDbl5XSSspdPqp8ILlgKo9
 qCCI2+Udw3jg5fxyn/FsKyClpcZN9pL1loU+bx+neY3O1qYtL5FGu8Rjo
 S83mc/vYXgqRxieOp1RhPkKl4XZlw0chCOo7J/Hqo2NtSdmtRd/n8uh7a
 373f5xhrHbDDA6gYLSG2saYqTwozSlaQG0NRw6Jml6iKUKMCI181B7Has
 ikKKwUNJNdde8AJLWFawRsU75CosQ68cTK+LuxQr77LAz28A8lYUnKkin A==;
X-CSE-ConnectionGUID: otw7LzTvTp2Ew5iEsPi/lQ==
X-CSE-MsgGUID: gPDd0USKR6mGqe6x09VKgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28846626"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28846626"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 22:44:56 -0700
X-CSE-ConnectionGUID: VvGreR3USZG/V38H7hQlgw==
X-CSE-MsgGUID: dxyCCxz5Q4WLD2wxZHhluA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="109503295"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 22:44:56 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 22:44:55 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 22:44:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 22:44:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 22:44:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lum17DEaIhZajF60m5rpWv6MgflxiZyCiC/gV3RZw2K+xZupsD4bCHnLiafK/PcysgGWc7a3fbcmL2xOrUjgXf5A93Lqj98O+SPv1+z0mUPxs6g8RAdUFO9j6FIayFW9Tyb1Ad8+dHA+Ig8i1tLMi9fzAq7K9WSJ9NDs3akTzqXnptS88Sme3tvan5sGrIs4SMVblNMQ36MR0i+xYO/DW8bL8UYk3hyVo/6UCtvACfEl3F2nHZAJQcbx0zHXqdSNbtl7yBsUBkgMpsXPfP9YX6k8QB1up4/oeR852T5pTo/U0Wmr6kH0ZP0k9enWLptwvCN1XGwkiugA7vmO5F3qng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDE8aw33dBzc8jHT41Kzyk+iKs+L8+8dR2VsJYWAqRk=;
 b=MBrcwi5f1D9mGvS9mIDB9CWs9z/GoSfcMufXkoTpBebydIejtUY/AHkzaVSfBgr/slxxqWleUhsNk6mdUI+4MzEtabOhgpU3EIFLL1j7ErnZ/uwQvbE+lRLOYG5skql/KXM7nVhjJ8ezDSCF8/TU++ZBXSN+YdzRinjSlvDIJfZxsPwp/OWUKquTEpKvuqkblITsMJ0Wkq51wplERJOs1aofn5ZaBZXVteTu23cM4RldSr1nFD+I/h9WNa2VMvP5DCJ5CTx6BmLUxwGSYId9+EgwLKKJ7urKyPHKAOd0d18S0Tc+qsYRly7cE1GlFnzTOhDwxvaoKEoCjvLxdHCxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 05:44:47 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%3]) with mapi id 15.20.8069.019; Fri, 18 Oct 2024
 05:44:47 +0000
Message-ID: <d6876566-1385-40b0-b4f2-7d5c67ea4367@intel.com>
Date: Fri, 18 Oct 2024 11:14:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "Pottumuttu, Sai Teja"
 <sai.teja.pottumuttu@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20240930112146.2673086-1-nemesa.garg@intel.com>
 <20241016072436.261438-1-nemesa.garg@intel.com>
 <SN7PR11MB6750713F83272902F5472C03E3472@SN7PR11MB6750.namprd11.prod.outlook.com>
 <9abd8034-abd5-48da-b5af-ec2f24bb0795@intel.com>
 <IA1PR11MB64675D48E2FBAE7A8BB4622BE3402@IA1PR11MB6467.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <IA1PR11MB64675D48E2FBAE7A8BB4622BE3402@IA1PR11MB6467.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CY8PR11MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: b3510b8a-7260-4d28-222d-08dcef37f9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTluaEdiT08xS1RjNWgvanlMZWNxMGZSZm9Cang5TytLTW5xenBBbG45T3o4?=
 =?utf-8?B?c3BPeS8vNW9jTi96ZG5scmREQ1pIWlhJV2Y5ZU5sd0o3K2kzT0dmOEFadk9Z?=
 =?utf-8?B?U2dlNmh3VWd6Um40SUt4SXVVaC9IcnBuUyt1RVpsNmhUckF2dHJLSW00Rk9Q?=
 =?utf-8?B?TC8rYTR0VmdNSDkyZ0F4YmZ4QmMraGJiWnRMNTMxdHVxNDJiWTgvWEpyMllY?=
 =?utf-8?B?U0hQRFEzVG1SeUdOL2czUmRjcFA5dGtpckxuYlZJNFpQR0cwL1V1a3JGblQr?=
 =?utf-8?B?dUJWZGJJY29TT3R5eE41aG5yY1QrSHdwM21uSjlBekowcEV0Q2dwSDFnNURy?=
 =?utf-8?B?aDNUZ1pPblJveXZ6c2l6eVZ6TUJiR1dwSzh3bkpRakxhaTVNVDFnMFNyQ0pV?=
 =?utf-8?B?YVVvb0ZZRE1OVWdjUE92Nm42UGlGSEY0L00yRHE5YW1ZUXhrdlVZR2xvWUNU?=
 =?utf-8?B?dk5hSHJwYUVxZVZFbVhCTkRhdFpQVzJXeEdRaEQ1S2w5YWxCSEtTRnJCMmQ3?=
 =?utf-8?B?NzV5NUJpb3ZxTUtWbG1QZTlhUW1lUktLbHV0YXVUUnNKa2Vsd2pjTHN6TC9y?=
 =?utf-8?B?aDRjWEx0QUE4SzdoN2w2OEpOZU83Y1hIbCtlUUY5RytiMnV5YTJ4VkFVUnNt?=
 =?utf-8?B?MGdVUzh5RkJRaGlBTGFubEs3OGZnLzdsZy8xcEV2L1dyUlpmQ3FUQy9Vb0s0?=
 =?utf-8?B?RTBnZTEvVUlQRVFiMkMyR3MvTEg4ay9ZMHoyK3g1RkJnYThEVS9RVkxiUDdB?=
 =?utf-8?B?TUxoNVNqMVFHRk9UUDdtbktWRnBiUDB6L1FzK0lLazBkZlZVcEx4YVFwNW5u?=
 =?utf-8?B?K2h1T0Q2bmErY01VR0phdWlkb2dSeUFiSzVGeXBYd2d2dUFHWDF2WHRVOFlS?=
 =?utf-8?B?eHNrR0dXUk1GWk5QdU5HWFI1QTNJZVFHam1oM0J5MHV6dC9xbGFvVkRzaVZG?=
 =?utf-8?B?UGZMUUVEU3FtWnNveUl0WElEdzhhQnZwc0JxRGo4QW53ajRmZSsrOENMcGxU?=
 =?utf-8?B?STc2L3R6UUR6Y0cyK2ZJZXN4QTZyNlVWVEZFSkJrOVA2aGZucUI0cHo3VkVp?=
 =?utf-8?B?NFo3bVZzQXhGL3N5MXFmbUVsTjFzMFRCNHo3RGM5aXA3RTN1SjBmOWNsNkhZ?=
 =?utf-8?B?SlQvMmZhOTVDbjRFM1FLeGZDQm1CYlB6Z2IycEx4NlNoeGExeExCYURhU0tW?=
 =?utf-8?B?c1ZpSGkvYXlVVEpjSFZSTkk2VnFFcUFNcXpmVmNLMmlSZER2TG5wMjZWRXpQ?=
 =?utf-8?B?N0NmcVkwcVZ3cWdyZEVNQWEvQWJtNWF5VjFGdExNK1pVMFVqRVBiakZKTHhw?=
 =?utf-8?B?U01YVk5NbVNEdlJpUXpzZ25ab3hQRjhDek80QngrKzVlMmhRSy9xaCtqdTl5?=
 =?utf-8?B?bWtnOEtPZStwTE8yUmU1b3lHQkE3RHJPM2tCLzl2b2EvMTFSMVdMMWIxRjRB?=
 =?utf-8?B?VkNyS3JDS3ZuSHhScnMwMlhjQUhjT29mREtlMDNrU3JWaTBGZHQ0UTc4NWls?=
 =?utf-8?B?OGljNEVVK2tWa1d0STVKRlMyQXMxNUxsTXlRTHJ3dnNLdWt4V2pBWUlnbTlP?=
 =?utf-8?B?Yjh3Qm1sRzhJRlBGVndHRTlRU0hWV3RjRUVrYW4yZGxDT0tVQ3RSbG5SQkdv?=
 =?utf-8?B?YVZLRVZ0dkVEQy96K0dNK2lhU0svaXVLUW9QSkhQenU5anJnUnBlQkdYNzlT?=
 =?utf-8?B?NC9rQW4vSDV5NXZzQ2QxTjN1TjlBWitVRFBHV2tyUm9FT3piY2JoeTJBVzBN?=
 =?utf-8?Q?QvyWVM4Ug36o4g+rWXtdNTBk3A3QI9iRCFIYvxi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHR0VmNMdHpnUXdIanhTTTdkWE9Oc21KTFVhTWoweFZwanRFVHZ5ZEZNeGNa?=
 =?utf-8?B?RjFtek5LSktTbmVqOHAzY1ZUZmw3QlluWkNtQ3prc0M0NVNoVU1wSVpqbkx5?=
 =?utf-8?B?ZE9nRmZRcWZIcmdQQjFjNjNLODN0OFFHNmx6OGFqekt0OTlVWVhxdFBRTXBE?=
 =?utf-8?B?dEt4ZzRvdVB1UjEzWmlqald5R1dBMjNHV1JBNVE4OWVMTlRpWCthcklZZlFa?=
 =?utf-8?B?akF3L0o3dDk2bWtnZzNlcVJRQUIyTU54TndOQ01lV3NLYzBtWUYzeis5eFRW?=
 =?utf-8?B?eitpOTRzWVR0U0RsQ1lqQ0o3S3gyVUh3bEk1WDgzOFpqZ2JIYnRDNFQ0L2I2?=
 =?utf-8?B?Qk4wRzF3MWpNS3Z6eG9MUjVhZUdvRUFqaEx5VExBaXBLRlR2eVRwekpOZDM5?=
 =?utf-8?B?a2tQYUxHL3cySlR0UGU5dVd3bUt1a3Y4bzRGb3RGekQxeCs0dWh6L25nelA1?=
 =?utf-8?B?WVJTSWtmL2ZxbTNWczVMS1d2aFdHSHhSeithd2JrZTV0cEN3dlE1MDJVbkpW?=
 =?utf-8?B?Y25jQlpONWJSNENIamc0OHVoRHpXWWtFdkl5bEdQOXREbDF6QlhWTzdXeHpB?=
 =?utf-8?B?Rkt3WExBTmRTVUd1RmtaYUIrb2U0V2ZLUG9lMjdscWpUMDRtaC8xZUtaajlF?=
 =?utf-8?B?Y0ZZSDhBOUg0dXgzTDFBeDdXc3hoRTcyYmFqNzBnN3AzYTZwaFJHZC9BQUxO?=
 =?utf-8?B?cXZxZmRLeURodU5RMnovNzE0aG1Ga2Vob0FWZ0IxazJFWlQ0cmJkOGdZUEll?=
 =?utf-8?B?NUFaM0RBQTNVc3dCUml0d3N1cUpOdnV2UE5BS1NXYXNYVGcyTFVUWGlsZ2Uz?=
 =?utf-8?B?SDFvYkVtSm9CRTVTbFMzS1phNHc1cU50bkVxZzZLNGFSbzYzNXNmaU9oSCsw?=
 =?utf-8?B?d2grSXE5TjZhOUE1QlVtVUx6UEp4REtGck43Y1Y0ZEVPa0VqWTJ6aGJUZGth?=
 =?utf-8?B?c1hsYVBZM1VMcmhuMTlsQ2RVS0pYRy9JK2VtM1poUTF1TTZmNGRMQzZwYkF4?=
 =?utf-8?B?U004SGJYalhpVTh5N0ZXZVgwU3UzZjNESkIzdnM1ZWhKL253RUpsaExwekJ4?=
 =?utf-8?B?ZVM3TDQvelkrVTVTQXorVEFJV3haT3FBaWNtd3BlQnNCNUxMblNpcUJld0tB?=
 =?utf-8?B?Um16L1h4K0hmS2xJd3FJVHNWd2Z0VW9LUUwzc1duMUFqNWZnWEREeVdrVzQ2?=
 =?utf-8?B?MW9VUDFPMkxOeU9OVWZSWXVwL3BqR1RCRHZmd3JJSFN1ZGZTRnNIS05UQ05a?=
 =?utf-8?B?ZFhBZElUbVBqVVBjdWdFcStLMHpnVmM3c3RXUXVVc1ppR0RWL2Y1MUxndCtp?=
 =?utf-8?B?MXBYaEJSaG9VZTB3aW9EaGlDOVltWGRld0dQWlhRZ3NucGVPQ1F3K2MyVVhY?=
 =?utf-8?B?bmd4Sk5oMWtjeGxUVkttSGw1UGVBU0VVVEd0eUtwZStvNy9oV2VSclYxeGFq?=
 =?utf-8?B?UDA1RzNPTzcra2JlbkltaVNVMzBnZFV2V3RqNGRHRVpRdWZ6Y1B6bFYwaG5C?=
 =?utf-8?B?OGdIcERCcjdXVGR4MnNSSElWS2l1V01lR3dNdmN6WVJmbXNWbTdTTEZyTHRn?=
 =?utf-8?B?SUlFemYwYlNWZWRvZzA3TEVFNE5wTGdJaUdDaCs1WWg1bFNIS0hnZGwxSTlY?=
 =?utf-8?B?OXEzRGIwZ1M1WXZPUnRXVW9uaVlDcHZqaEU0cXhKaEVHcVlNMkpHSDZXdnRF?=
 =?utf-8?B?ZHBRZ2ZTLzh2NG53dlhmUlRvbzFSSERLQWFYQlFUL0JtclcvV0hXMVE3K1do?=
 =?utf-8?B?YWFRbDRwNVpISHNVKzN3QXQwM1ducHhUejN4OERMSDkySHg3K3JWUUQyQ2tv?=
 =?utf-8?B?SElYcmlsMFUvMjN4azlQb3FjQytRUnQzQzBlMFhScE9OOWZBMzNLcUtaVVht?=
 =?utf-8?B?R0JYME81LzZxL3R0RldJZnlZbzd5UjZ4WjdCQkZvQnZkekZIQ1FzbEhUUUVi?=
 =?utf-8?B?VXdUSldhLytnOEhMcWpIYWFnYUtHM3Q3U0c5SjlpYndKZnhWOUZNYmw1Mm90?=
 =?utf-8?B?VFpOaGE2MFdrL3FlVHowNEoyV1VnNVRTMVQrdGZvU29CSmR0OCtzbU9xNFI1?=
 =?utf-8?B?RkJxK0taeEhLNnlPRjVONEJIclJRckYvSUU4eGVSa3JuSlVoZXhEOGpFRjFk?=
 =?utf-8?B?UFd2dWxGZVhYdjAwSzRWNWIwaGZ0S1ZtQ3JkMmZkY21LUEhDZjdySVdad0Q0?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3510b8a-7260-4d28-222d-08dcef37f9b1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 05:44:47.4281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uirtjFz8CuAUza+kecCkbeGhp3nLPLlC9vCOKbuY7q0oarieSI9TnZwMQcJWCa4J2tmi7U0rGipgps2C4DSOp1LBAkO2ZK5LaG6u435ihUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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


On 10/18/2024 10:34, Garg, Nemesa wrote:
>
>> -----Original Message-----
>> From: Pottumuttu, Sai Teja <sai.teja.pottumuttu@intel.com>
>> Sent: Thursday, October 17, 2024 10:24 PM
>> To: Kandpal, Suraj <suraj.kandpal@intel.com>; Garg, Nemesa
>> <nemesa.garg@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>> Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
>> yuv
>>
>>
>> On 17-10-2024 13:35, Kandpal, Suraj wrote:
>>>> -----Original Message-----
>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>>> Nemesa Garg
>>>> Sent: Wednesday, October 16, 2024 12:55 PM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Garg, Nemesa <nemesa.garg@intel.com>
>>>> Subject: [PATCH] drm/i915/display: Workaround for odd panning for
>>>> planar yuv
>>>>
>>>> Disable the support for odd x pan for even xsize for NV12 format as
>>>> underrun issue is seen.
>> - Probably with the discussion and the latest update to the patch we should also
>> update the commit message to aptly reflect what are we doing here. (We can
>> remove even xsize part or maybe give more explanation on why even x size is not
>> being checked in the patch)
>>
>> - We should ideally be using the workaround lineage number in the commit
>> message.
>>
> Sure.
>> - Also, seems like NV12 is not the only planar format, should we check for a planar
>> format in general instead of NV12 specifically?
>> Cc: Matt Roper
>>
> In WA its mentioned that the issue is seen for YUV420 format so that's why I'm checking for NV12 format.
Could you please explain me:

1. Was this issue reproducible for Planar formats or Semi Planar formats 
(if they are different)?

2. Did we check it on only YUV_420 or all the planar formats (if the 
issue is only on Planar Formats). If it's only for YUV_420, then can we 
have commit title as "Workaround for odd panning of YUV_420..." or 
something like that. If not, then can we test it for the other formats 
as well?

3. Are YUV_420 and NV_12 formats the same, and is NV_12 a planar format 
or a semi_planar format? (drm/drm_fourcc.h makes me think otherwise, 
correct me if I'm wrong??)

-shekhar

CC: Matt Roper, Sai Teja

>
> Thanks,
> Nemesa
>
>> Thanks
>> Sai Teja
>>
>>>> WA: 16024459452
>>> This should be right above your signed-off-by The rest LGTM,
>>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>>>
>>>> v2: Replace HSD with WA in commit message [Suraj]
>>>>       Modified the condition for handling odd panning
>>>>
>>>> v3: Simplified the condition for checking hsub
>>>>       Using older framework for wa as rev1[Jani]
>>>>
>>>> v4: Modify the condition for hsub [Sai Teja]
>>>>       Initialize hsub in else path [Dan]
>>>>
>>>> v5: Replace IS_LUNARLAKE with display version.
>>>>       Resolve nitpicks[Jani]
>>>>
>>>> v6: Replace -EINVAL with hsub [Suraj]
>>>>       Remove src_w check as not required
>>>>
>>>> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/intel_atomic_plane.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>>> b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>>> index e979786aa5cf..2d7ca6e62926 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>>> @@ -1031,6 +1031,11 @@ int intel_plane_check_src_coordinates(struct
>>>> intel_plane_state *plane_state)
>>>>    		 */
>>>>    		hsub = 1;
>>>>    		vsub = 1;
>>>> +
>>>> +		/* Wa_16023981245 */
>>>> +		if (DISPLAY_VER(i915) == 20 && fb->format->format ==
>>>> DRM_FORMAT_NV12 &&
>>>> +		    src_x % 2 != 0)
>>>> +			hsub = 2;
>>>>    	} else {
>>>>    		hsub = fb->format->hsub;
>>>>    		vsub = fb->format->vsub;
>>>> --
>>>> 2.25.1

-- 
-shekhar


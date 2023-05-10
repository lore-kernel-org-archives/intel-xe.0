Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB24AC7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 19:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4D310E515;
	Wed, 10 May 2023 19:58:57 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C6710E515
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 19:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683748735; x=1715284735;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=6uH27hRdoAgdzlGO2QMxKD4au51LGpS2aeFazQRdOaM=;
 b=PMNe0BwVPfvSEWNy/9DhZheENB/jmD+CmD2wGGWAfytdazm2wsEqxcJn
 MOMmqWKjdHxPlM02WgmtfKCp/uGl747vwUMgj9FkFhVhb7Uoh+AdEh7mk
 Zt3DZNQxfie5rLKWZNnGqknI3EB2hccIzKmmgv30cwiqJKRqwSI2gR4ee
 6XKzl3UKb5Sigw5oRLc7qsYGCs1XZG7wDfP/4ngQUHRHFSgInQ3Dok7MO
 ybSPWYQLjFcWacK0MdePHLU2w6iziGiv0iCMg7BtjTJv/06dsHjQjstM2
 d7rxhUQjtInyMH00mSWBX4AkxFKZ9ww4PPwvoA6NFxef5IQPyvuwklgkX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347768893"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="347768893"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="676966756"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="676966756"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 10 May 2023 12:58:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 12:58:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 12:58:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 12:58:54 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 12:58:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvsjlSUspAW8hDrfrK9V2CSPjrn9o7dAGoey2hVLmCjFZ6apk7mm7cZlPXzp9TT7sQoVnjxZhVrSpP1k4gwpjmfHTh1RQmIx910QNxyrT/Pbjk2POYjB2Juh+j6QQXc6IW1Z6eSi8yTlgjkxamOo8tn54w2PRrFekXF/v73aHdpjFG7gIRFKAwuboCJd/Ky8XDsdEx31MnmkLW++dSanK0mEGbL0k9znBPuCDGpeisWmTcu09gElOIBeaYNxna6hfVENi8b5dVamgLwkddAyvFhGh0Cco2PGxy3HlQInu6F2tBHa1Sc+G6ozysyCAhbUMjN+TJsOB4ef1JGypxmCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g33s7So37s0Jo5lcMpA5Y7vfItZDGM5Uvc61nfTpkt0=;
 b=SggFSTTbom+mvULYmVvu97j8QAfPLhEW0bMRAA8iZfFSTb0Y1ptTJA6/RZbQwbDQNnH3cUnT8bggl2wPbGBGdeoxskINXQmZBVJq5WQWm4D0rltYHjuZBTAnUNqPxQWyV4nmz0Yb2dYQ3/0wWlHFyGGulsza81Plmh7medk4rW2IzRW7GLLb0eGrCoGnrqjUBaKvKky8KUxWZ9sbaRZCfoMY+yFJ26MtC2yhGjam6n8svj2M3gkAYMYG61S/aXi6Oml1jKXsacPiBaGyfdUuw+5hiVh6hVhq9LhsgYaZa2ahTyK4HvsIRoaP0h3m2YfuS/0n911MsxAKCFLZmY072g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 19:58:52 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::28c6:f268:89bd:e45a]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::28c6:f268:89bd:e45a%7]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 19:58:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87pm78midb.fsf@intel.com>
References: <20230509222053.1541049-1-gustavo.sousa@intel.com>
 <87pm78midb.fsf@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 10 May 2023 16:58:46 -0300
Message-ID: <168374872604.358529.7514478797295259747@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::28) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS0PR11MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fdb913a-7e95-4982-c46b-08db5190fa3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24ZPHItRw+ApT2P6PtsRefgQrZxkXPfdrc72JRWWH+Qfk6SmkyYLDggBARo4msDGsJdWhZZMyMP2UdQ5bxzk3V5nwU9OEWwbRPqEFXPGVInBNjDTstnetIfXychVWYGWOUqGyoT5AlILc860Kb9ILP5xULQTgBupfWyuzD0PFlhz7hy9kUTMyfnmWDKU+e+8sW4OweLhdWuoDb+Rrd3n4cxVvc050btreT0E3RMvNMZajiYI0QJ5dl+ZyTLnpqNK4SEXrNYuC1/Wc7oSOFpVQrifS85j0dmgk6WJgzQSCZaE09Kc6Tp5je4BD7QUBZSNzt5D8LdCV+0+buqb1rEhEn2NSdPjW2BPzS2Ffk9cTdpU0LGqlbUd3md6HxiFWFqdWuC5wqXeqtiHUbDbzvHw65hZ1wtBh0/FtrIv3r5sjZe3qSlgpbgLsXcGRnkD2Swh4qOvFMQXALET9MIqydL8uWyGhOd+N1I2w1cTRRML7rctYRseU+ItAXA5SImy9nxk8AxA97FnfEfUD73pq2x7qc1ya+qBPjsqPinF2k1L6/kOD0B+VU3MI79I+ZSit49R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(39860400002)(366004)(376002)(396003)(451199021)(2906002)(86362001)(82960400001)(26005)(6506007)(6512007)(9686003)(44832011)(478600001)(186003)(5660300002)(33716001)(6486002)(6666004)(38100700002)(66556008)(66476007)(66946007)(41300700001)(316002)(8676002)(8936002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUV2VHlLWmhBamFGTkVzYVRMTVNRT3NrenVPYmFJZjJDeWhDdGhUdlQ1eEJY?=
 =?utf-8?B?cWFtVzMyalVjbHNCQmFCeWpMeFRvcnZybGZPTXdFcjkyYjZCRnIyc2wzazkx?=
 =?utf-8?B?ZlJyOUZ4cEhSbXNVeVY3Y2hLbzFIV1NuTTU3WmNXMWxFd0RUZ28wVDlWMGUw?=
 =?utf-8?B?cGVFU1BFVzBXTnZSWXRCOG9UMHlOcGpxcFhkWkE1UktFVDdFZG9UajRVRjBP?=
 =?utf-8?B?ZWt4aGg5Q0lKcE1PemtLZVJjN1pzWHpoRVNrb1Uxay9QRHBLdS8xZm8xc2F2?=
 =?utf-8?B?MXFWYUhLK2w3NVhYTVpVMVp6VUN6NHBBTHU4STVDdzRYa0ZHWkdEaEVnYVBK?=
 =?utf-8?B?NEVoLytBVzNDZ1ArQlFZN05zMnpSLzF3eXpiZXlqcUFrMXFQTzk3ZzY1Vm5I?=
 =?utf-8?B?amNHcUQxVjNZK1BqeFpsd0NHUnRNaGFHcFg4NDYwUWd2MVd4YTdMZHR1cXk5?=
 =?utf-8?B?WFdyUXhtTFZLRXVsc3h2OVpGaWlrNmJrMDIyTVhtSzdBbDNrYnBGMEZsbVBa?=
 =?utf-8?B?TXdobzZTUFlOdFh3cVdNVXN6V2UyWk1HRXI2cjhUeTVhWXFEemFHcDJXRVh6?=
 =?utf-8?B?d25DWkhWMkViTi9ZNUxpMHhRNlZacUxjU0d2Lzd3MHpIZ1hiMzZEQXQ1VUp1?=
 =?utf-8?B?azdGS21RbGdrdi96aGZ6MmNjaXp6Ykh3MzZWS1RpSlMxZHNlS2E4THdRUWp3?=
 =?utf-8?B?M2c3NlBlbUtQOW9WSTM1RFFMaWw2bVh1dnhaOU4rZ2h1VnRLaG1RWjZESmgr?=
 =?utf-8?B?cHhCSVRQR09YQm1naEtaM0dHQ201WEdSQVd4NnRDdnZzQ2kyeVYyYzl6ays1?=
 =?utf-8?B?cDVzZlBjUVE4ekhUQlFYeWplUlBweEVLbkJUaUk3aVhocklMdFhSSHNyUVA1?=
 =?utf-8?B?L29QeExsTmVxYjF6NWdvdXZqTEg2RmVBdXV0bkVaWDVVZ0p1UE5LNFhUcCtX?=
 =?utf-8?B?SExoZHk3b0JGTFcyZVdxVnY1a0hFamlnWm1HZVBiUVBXSXVLVjBOZmlWbDFQ?=
 =?utf-8?B?MlRlYlZKYTB2TWp6WlhkN2FieVdodXNNeHovTEFkQ3BTYnpUMVdHcWV3Sy9J?=
 =?utf-8?B?dEMrQXRwZEJQZHM2TjMrYzdGOFFTR2NPSzZiVlZDeUlFL0JIMkZ6MENOY29O?=
 =?utf-8?B?bFN4UStRb0w4dFVhNHVkMHFjQjBjUkVWUkNCcjFoNWwrRGFWSEVCSk1LbTZk?=
 =?utf-8?B?dWIrZjk4OVJuamF5UDloZEkveUlNUmQ0eVltQXkvWEF6T3EvN1hxdEFtZ3M2?=
 =?utf-8?B?MUwzL3JJcFB3YytYbHdYbjZLKzNKdVI4UEF1Yk1IMjBnUlVCd3NoV0FmU3c2?=
 =?utf-8?B?clZreWJyM2theGM4TzdMdzhkU1IrcnNSU3ZYV3lCMWtQTWpVT293MTYvWFhU?=
 =?utf-8?B?RzRJWTFMa3ZUTFNCK2pJWGk0Szl3OTNLdXNVRWpHSmtaWjJtUkJ5L0czMzc3?=
 =?utf-8?B?dlZHbXZMTHY1TElXcXdhL3hrdTVtTy9Mb0ZoRXEzVjJSeEY3TXhGaDBxL3RX?=
 =?utf-8?B?aEtlenEvckJMUE9LY3ZkUG5CSEJQYktLMWNqdVYrSndFOXZlK2xZTzQydkhL?=
 =?utf-8?B?dlo5NExGREJ5cWxNaHI3LzhoSG02SklHTmFFbEh5ZEU4RGM5NUhCeE5oUzBn?=
 =?utf-8?B?bGJ0U1IyT1lCM2VQWDVTd0lEUDdmSVA1MTJFRlhPczNaY0FyRHJIdFFTZWRm?=
 =?utf-8?B?aWlpS3VKV2VzMmhTV2x6L1ZmMXN2Q2ljOHRya2J3MzMzTEtoeCtROUU2ZHBl?=
 =?utf-8?B?SGNCd2toVXpNc1pTenRTR1VmaTlic01kcEJkc3MrbHF5QlJDWUtLajdRQ0ll?=
 =?utf-8?B?RTgvSHBSejJRQXYzTUhINUw0WHM1UkVlck9IZXprdmdneThZYzdPSnJLVGhB?=
 =?utf-8?B?a25JUlJhWXBaZEJ2V2d4YnUrZ1djb05vYVBXTjJtRC8vSkM1d1dObGJjbndT?=
 =?utf-8?B?a2N5Sy9uaVkrWVhhQlBLQWlQRWJRY1lCZTFUemJkTXQ5Snk0VXNVNnF1ZlZF?=
 =?utf-8?B?cW5qVFFoZmdVaGFWc0huQlpaWnZodzNIME4zelVGM0hiaTBlUXVxZDV2N2lS?=
 =?utf-8?B?NzZWRklmUVo2YU5FcFJpVG1leHZuYWRacW1KcERXOW0ydE1JOStNZmJwa1dJ?=
 =?utf-8?Q?fsRMuTNWUCQga8IZgIANeUo7v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdb913a-7e95-4982-c46b-08db5190fa3b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 19:58:51.9898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oM9IyOTjO4Fa3vwrWBM7XAgxbPt6kkTNGdf7H+dNmzenuncL5KL50Ri+/heYKiRL62GboVPckq5fsVC42HS7+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Call exit functions when
 xe_register_pci_driver() fails
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

Quoting Jani Nikula (2023-05-10 10:22:08)
>On Tue, 09 May 2023, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> Make sure all necessary exit functions are also called when
>> xe_register_pci_driver() fails.
>>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_module.c | 16 ++++++++++------
>>  1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_modu=
le.c
>> index 6860586ce7f8..9698875852d3 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -53,14 +53,18 @@ static int __init xe_init(void)
>> =20
>>          for (i =3D 0; i < ARRAY_SIZE(init_funcs); i++) {
>>                  err =3D init_funcs[i].init();
>> -                if (err) {
>> -                        while (i--)
>> -                                init_funcs[i].exit();
>> -                        return err;
>> -                }
>> +                if (err)
>> +                        break;
>>          }
>> =20
>> -        return xe_register_pci_driver();
>> +        if (!err)
>> +                err =3D xe_register_pci_driver();
>
>Why aren't xe_register_pci_driver() and xe_unregister_pci_driver()
>init/exit functions in the array? It would avoid the special casing
>here, and allow some init functions to be called after register.

Hm... I would imagine that the intention would to make it explicit that
xe_register_pci_driver() must be the latest one called and, if that was the
case (which is probably false based on your comment), maybe adding a commen=
t on
the array entry would also suffice.

So should we just add them to the array?

One issue would to be related to the function names, which would be
incompatible with using MAKE_INIT_EXIT_FUNCS(). Since those functions are o=
nly
used in this file, I guess it would be okay to rename them to
xe_pci_module_init() and xe_pci_module_exit() for consistency sake. Thought=
s?

--
Gustavo Sousa

>
>BR,
>Jani.
>
>
>> +
>> +        if (err)
>> +                while (i--)
>> +                        init_funcs[i].exit();
>> +
>> +        return err;
>>  }
>> =20
>>  static void __exit xe_exit(void)
>
>--=20
>Jani Nikula, Intel Open Source Graphics Center

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD4AC48260
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 00:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0018210F072;
	Fri,  9 Feb 2024 00:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iv2YHdJf";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 09 Feb 2024 00:37:18 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F7910F06D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Feb 2024 00:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707439038; x=1738975038;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3XWg0DLY2qcXOqLkpfePCEH/V6gGaL8CVLQyNw1XGas=;
 b=Iv2YHdJfRy0rwMV7tKt9lIHacjK6DL1IBi8AuPkThFzmlv/lGOfDuqND
 b4ABOEnWQKtAGY3FLMC4xEYAIYqW5ALd6MippXfJmHLubszYaSn/sDuoK
 kZcdMNk3fgBvu4Tb/SgRNMtaRW262sM2IhkteT3uE3XzNljX3KMhZ3+aB
 W9RQJhjNrAQee+scz90NQNyR4Rva5E1rNMxPM/d2urWcx6gS97GNPFhzZ
 AsRPGYg2B3MNJ+RvB3hC/rONhhJ/mSPCcZiModKaCMlHqHpzBeYwGrrDE
 WIUU20vbEWT+uDiIB2UDrCHuazs2wccV5IUEtHRek91wXjef+rrWQ/adX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1242136"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1242136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 16:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; d="scan'208";a="32880889"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 16:30:10 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 16:30:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 16:30:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 16:30:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwVlwLSC7APez0F2TsCy7BOyD4MxOpmTHj/L5wyOT1IzdpZ7h+kU8LidNSkCByyWPQnIhJEZY8PZs7v4pEhqpLYwbOP+UVOvYOXKUeUVOnFwy2SxbccCNyLc8T4CNQWK+fEsHEbe0ibRWJdQRJA2SmsMpPZyuoDNnXJeSffv+MyBpvgFPF3NdfpOy5DL5AGQ2Uo6gY2nijHzL4yaC3iGSyovUTgDwTboaWm4vX6bVEm6EiFfdJgjeyGPhB5RGRZa2yHRfJBpHmmZ4Qpsqul/Qwtjv23UG5lmXrGcZB1T/uFtcjpfvd3koZZLVwnEUD6BTp/Bn2P7uLdpchmRSd0RRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaSe5tsYhd2e/c4zrUrF3uJ12GlO0/0EKrOWX5NQVf8=;
 b=dJyanU+UW7nJx6prmGIV6gC2QgPG9rEggLhycnxBEj+BjSlZlYv1lX2eiXakW5Dc9ptOJCW2m3ilWJowWGy4QdisGlJiLHBUYiM/ShAakTP5tf/nFzrAL7o5qP9XdiVk8p+cZVWaaLmnRdj5Rjhyo30evongWaUtq5qQLXL6h25YXxg5wj3TlONmhQQQ1DeWQy9Na9xkqOXDV+d84cqs7/WZ3jHwWVJfnvRQEohbhqVmYAB/3z+yitT0gDpacdVue6m+DhSuEGVFmdZ02GbxXGZMArBdt8k1oNbxzAWPumDi8L3NhuMRYDmzNasyy/z43uj5E8joEhuoQBfO5krfhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH8PR11MB8285.namprd11.prod.outlook.com (2603:10b6:510:1c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Fri, 9 Feb
 2024 00:30:06 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03%7]) with mapi id 15.20.7270.024; Fri, 9 Feb 2024
 00:30:06 +0000
Message-ID: <d37b18a9-ab2d-478b-9510-087c8ff76ec5@intel.com>
Date: Thu, 8 Feb 2024 16:29:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>, Matt Roper
 <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Gustavo
 Sousa" <gustavo.sousa@intel.com>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
 <bbb3bc27-73cd-47e4-bdb2-8a12e8aaf2ca@intel.com>
 <ZcL5c1TTfCxUckCi@DUT025-TGLU.fm.intel.com>
 <zcvxg35dgst3vffu76v532dhl5lob6ilpi3hktg4ptnqc6lsbd@dsrjrmgk2kdj>
 <6d27be6f-f501-4bba-a8f9-ae80f23484bd@intel.com>
 <v5mwvlynhfvcre2iudh3am34y7eh4llhifj32gw3l56g4idvw6@uo6rutzsqmyl>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <v5mwvlynhfvcre2iudh3am34y7eh4llhifj32gw3l56g4idvw6@uo6rutzsqmyl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH8PR11MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: 059ddfb4-340a-4ebe-3b9b-08dc290643e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JBPls9LxfQbcF9Y8Qb0oazSsn0/aA9r9Zu9zWOWpy4ZbwG9bl1ip4liPB/3xWcxsj4Uk9ElOYhgNqVYLkwajbbo2qLB8p2UFRSU0PN8XEFbW9hGzxa2+vmOKoI2YUAGUtn/pistoKiNOtoLuNoc7YBv+t5j8TO9CXKjYhfVoRCDMXnYvdpgVXuAccraai+gsHBZyDgg84xkXMXvCRXvUkUj4cgAHN7HSFI+MSh7gAulTNoyAr9+NB8ibXGMTbJaRY0mc0dFe0BHWgfGgsFvn12E5goNyMVG/YlHQqY7oEkZ8a6HyXzP0oftJC3ILhAQAraZazebwfXV8r7IE8LQLf8qHULjjlYV5QVWLaV4905VZXauMgvfpn3z2hiah200jp5t8t6o8GJ6+ejMTQqGzszECkpRNJHtF4pHhXtZoD6g6cApEkXboovIMQDxrnvJIccq/mUp4/b7XhmHL+vweSxaY007ZDPTjmWtDJ6WiR+ND7oFPNuB1gllu+k3eketqeF/hP6zfJveJTCSpaQjHCc79ilH0D8w9uQ22703RSO0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(346002)(376002)(396003)(230922051799003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(36756003)(6486002)(83380400001)(53546011)(966005)(478600001)(5660300002)(30864003)(26005)(107886003)(2616005)(6512007)(66946007)(66556008)(66476007)(2906002)(37006003)(4326008)(8676002)(6636002)(316002)(8936002)(86362001)(6862004)(31696002)(38100700002)(82960400001)(54906003)(66899024)(6506007)(6666004)(41300700001)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHpMcFBaVm9pUU5acVRQMk5lK0tBakFIdC9CSitJUDM1YUhYOVU1bFdEbS8z?=
 =?utf-8?B?RGcweGJjQ0xhTnNERCtQVjZ6SHFtS2F6ZVFCYjFGS0Q5Z0VqQ01HTW5hR0tI?=
 =?utf-8?B?OEFyeGg2QitLcHA0eDZuU0RvR1JhSHJ2REgydnV2dEFkY1MvRGVCcmlHdHhR?=
 =?utf-8?B?SnlvTGNsbEl5T2NENklaR3RMaXZBaGhxVllUdVBIbnNqVEljdFRNdFBHeGRv?=
 =?utf-8?B?UGZpTFF4allmVkJPcGhYT2FOMGk1cVVoRVR0WFVhQkRHVzhYL01PRmJXd2hi?=
 =?utf-8?B?U0VPR2VkR3NmQlFvRGdreGw3dGxPcnEzOHliTEZoWEYyTnFhUzBnVGRPZk1U?=
 =?utf-8?B?MGNaZWFwL21CZG5BQnN6N0tkQ1V0UHZSR1lUL3JqanJ6a3NUQ2hHaGhLc1lz?=
 =?utf-8?B?d1RXVDEwQkRBWThmOVgwa3VZZWVMayt3YUhaU3BWWkkyZ05jaWlKMEx0enAw?=
 =?utf-8?B?QWhIZ0ZETEtJMHovQzlnTkxGK092anA2cWM4MUZRQzZXRDBuY0JkOGwzS0k0?=
 =?utf-8?B?NG5kU1ZqUm0zM3gwWnNDVWx1TGxjVUlaK3M0NFhOb2JLaTVQdXVpTDkraWJo?=
 =?utf-8?B?cmpuU0srbGpkTGt6MkNybVJIT0pWbjVTU1dMOXZLanhDZ05VK1Q4QUJvNC8y?=
 =?utf-8?B?RkQ1eXdGSmF5YmdaSy9hTm8zNURlSGhIU0VjdHRYamh3VDMzNUV0UWVFVVAy?=
 =?utf-8?B?WmZzSFYyZUdkOEZEM2p1UmUzSkVjVmNXYXg4TWsvOE1nOU5YS1hSVFVyZjFr?=
 =?utf-8?B?RHJZUU5YcS9kZmEvSW9NUzdRYzgvaHFBbGZhaEwzWUxHNkZmRnZSemxOK3lm?=
 =?utf-8?B?VkhNUFc1RytZRUl6SXlSbEEzV3kraWd5ejBJVWVtOWovcWNQeExvUjFvYlpt?=
 =?utf-8?B?ZHU0M0NCMk1Vb0xYZjJpditqNi94QVpNaTJkZFdUdm5ENW1jbWVTR3o1ZW1p?=
 =?utf-8?B?dUV6Vll0WDRmWkJJVXVScjVrZTRGZXl0QnlUWkR3NVY4bjl5VktPOStYRDBT?=
 =?utf-8?B?MmdFUFUwSWJuWC9jUFN5dC9xM0lEU2h5TE5LK1NIQllHNjhHdDk2WjMzYnZW?=
 =?utf-8?B?ZHpwaUphNmVyVktZK0F4SmhpQzFwNVA0bHN5NU5oTDVFdHFkUEJzZUZSRDdX?=
 =?utf-8?B?UnQyMjRwMGJSNDVpeGpPVGpQMjhIUDN2R2tMTGhNUXFkZHk0QXYyVDM4dGZT?=
 =?utf-8?B?K0wzYTJnamlaMG5PbWFUODJoUTFZVVZyNW4xd0pZTTI4YWV3ZmMxc3FLcEZJ?=
 =?utf-8?B?R2I5OWpIUmJXWUtvOTYzNHYrL3J1eFpMaFRsQ093U1p3OWF1Rk1tSkJyM0JN?=
 =?utf-8?B?UHo1WFc4enZmQmF5SnNYck8yYlhJNzg5OXRkM0J3eFdFak1VNk1LYU1GR25h?=
 =?utf-8?B?Nm9HWGxRekVWWTFZZ3dkeDQvY05oanZQTkhFdUUxWnAzV3VibHJ5UDRVZHEz?=
 =?utf-8?B?c2VZV01sU2FYVEJrM0M2ZXlCdFMxT0pQUlJKNjFuQmFCOG9KMElWdjM4QXZD?=
 =?utf-8?B?Z21sYUtkdkt1d0JCY2dKVmZLOUVnamdOOE8rMnp6NFNMNXduemt3RDRycVg5?=
 =?utf-8?B?c29XM2dRdUV2TzN6TXk3NWg2a01Wcmk5TG45ZUpOeWRseVVjWW56WUlGTUM1?=
 =?utf-8?B?dTc5ZkV3RFlDczlkNXo4SXJHZVpZajAxVFJBUk1JRi9KT3JxUXl4VVBmRG9u?=
 =?utf-8?B?aEhYditRcUk5RlNMZkJxd3Z3bkV4SUt4TlBxU2k1L00vN1huKzZlMUpiZE9X?=
 =?utf-8?B?Qm8wNHJib0V5blZWVjZOc3U0OHh0NXE1Tkozc3pFcU1Hb3FpRTlPM1FoM1du?=
 =?utf-8?B?RHRicFFBOEQxL3dPb0dtZkpRNDNBNk5MVEpNZ0F3LzgxQ2R6eUE4Q0M1MWRk?=
 =?utf-8?B?aGZkWTAySGJZQWR5YWpRakVYb2tsL2psWFNwY0pzZlFjZ1o0NndwR3crYVVY?=
 =?utf-8?B?QVVuS0NIT2RabUlFWjMvUEF1Q1dpemNGN1VZY28weDZLNmRjbVJpOFFpb3Z2?=
 =?utf-8?B?d052RkIwSytiVEV4a1hsNUlwM3EyOERybFBMU3VPWUxlTHMvZ0N0MDFlcTE4?=
 =?utf-8?B?L2VMUGdQOHVHVDRqZ01jQlpwVEJEaVZlckpOWGdNVTRPRTlFUTE4elVZcW5B?=
 =?utf-8?B?dllDTTdwOENZM2pMektZMjhlOSszTS82TXBxa1ZYcG05VWMwcmlaZlZ0ZHlX?=
 =?utf-8?Q?bE7/7p7lPx3PQ6+nQrIxz68=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 059ddfb4-340a-4ebe-3b9b-08dc290643e6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 00:30:06.6839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nT5xKBoY7FoxBkTwiGWQl2FURfa/jmgkw3yrAYfA8vXMJpDDJMqxdKsILHnB8zGpeym78MvCxwqXw2YuiJ1uBE+jEGHyinDMKMnfiQgP5Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8285
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



On 2/7/2024 12:40 PM, Lucas De Marchi wrote:
> On Wed, Feb 07, 2024 at 10:34:07AM -0800, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 2/7/2024 8:42 AM, Lucas De Marchi wrote:
>>> +Gustavo who is dealing with DMC firmware lately
>>>
>>> On Wed, Feb 07, 2024 at 03:30:59AM +0000, Matthew Brost wrote:
>>>> On Tue, Feb 06, 2024 at 05:18:50PM -0800, John Harrison wrote:
>>>>> On 2/6/2024 15:41, Daniele Ceraolo Spurio wrote:
>>>>>> Supporting older GuC versions comes with baggage, both on the coding
>>>>>> side (due to interfaces only being available from a certain version
>>>>>> onwards) and on the testing side (due to having to make sure 
>>>>> the driver
>>>>>> works as expected with older GuCs).
>>>>>> Since all of our Xe platform are still under force probe, we haven't
>>>>>> committed to support any specific GuC version and we therefore don't
>>>>>> need to support the older once, which means that we can force 
>>>>> a bottom
>>>>>> limit to what GuC we accept. This allows us to remove any 
>>>>>> conditional
>>>>>> statements based on older GuC versions and also to approach newer
>>>>>> additions knowing that we'll never attempt to load something older
>>>>>> than our minimum requirement.
>>>>>>
>>>>>> RFC: this patch sets the minimum to the current GuC version (70.19),
>>>>>> but that can be moved one way or the other. The main aim here is
>>>>> Ideally, this would be bumped every time we update Xe to a newer 
>>>>> firmware
>>>>> version right up to the point when force probe is lifted. At that 
>>>>> point it
>>>>> becomes fixed and we have to add the version check support back in 
>>>>> for
>>>>> future w/a's and features.
>>>>>
>>>>> Get's my vote :).
>>>
>>> Yeah, but see my other reply... I think we will have to wait the
>>> firmware being available in linux-firmware for that.
>>>
>>> Also, let's kickstart a discussion on our process with some
>>> possible changes so we can get it documented. I think we have a good
>>> opportunity here to start adopting the
>>> https://gitlab.freedesktop.org/drm/firmware repo.
>>>
>>> Rough idea:
>>>
>>> 1) use intel-staging branch with tags for pull requests to
>>>    linux-firmware, just like documented in their readme.
>>>    IMO the naming is rather unfortunate since it would be
>>>    good to use it for (2) below.... but since it's already used
>>>    we can use something else.
>>>
>>>    this would mainly replace the use we have today for
>>>    https://cgit.freedesktop.org/drm/drm-firmware/ ,    which could 
>>> be retired. From  upstream linux-firmware pov the only
>>>    change would be the remote location and that we start using tags
>>>    for the pull requests, coming from a single branch regardless of
>>>    the firmware (guc, huc, dmc, gsc): intel-staging. Once accepted in
>>>    linux-firmware, the branch is fast-forwarded.
>>
>> I think this needs a bit more fleshing out, because before we do a 
>> pull request, we do want to run CI on the blobs. Also, in several 
>> occasions we went through a couple of versions before we closed on 
>> what to push to linux-firmware (e.g. in the latest push we started 
>> with 70.19.1 but then pushed 70.19.2), so we can't go to 
>> intel-staging until we're actually ready to push. I think the process 
>> you have below for mmp blobs should work for this early testing flow 
>> as well, but we might end up with a lot of noise in the 
>> staging-intel-for-CI branch.
>
> that would be a throw away branch where we push stuff to be able to test
> on CI. I don't think the commit history matters much there. The fact

That depends on how CI does things. With the current handling of 
throwaway branches we have on drm-firmware, a CI request can 
accidentally roll back another one. e.g., if we push a throwaway branch 
with a GuC update and then another with a DMC update, the second push 
will roll-back the GuC to what's on the new branch (likely the 
linux-firmware version). That's why there was a suggestion ti use a 
unified branch for CI as well.


> that the firmware is available to match what is in the kernel and that
> there's a documented process for using it in my view trumps the
> this downside.
>
> what I expect would be, considering the LNL case as example:
>
> 1) Start testing with the mmp version:
>
>     a) Add firmware to  drm/firmware intel-staging-for-CI
>     b) Add commit in topic/xe-for-CI on the kernel side to make
>        use of that firmware
>
> 2) Ooops, that has bugs
>
>     a) add a second mmp firmware to drm/firmware intel-staging-for-CI
>     b) replace commit in topic/xe-for-CI on the kernel side
>
> 3) we think we are good, let's try for real
>
>     a) Add lnl_guc_70.bin to drm/firmware intel-staging-for-CI
>     b) replace commit in topic/xe-for-CI on the kernel side
>
> 4) yay, it worked
>
>     a) Add that lnl_gu_70.bin firmware to intel-staging branch and
>        prepare pull request to linux-firmware
>     b) move patch from topic/xe-for-CI to drm-xe-next: i.e., rebase
>        topic/xe-for-CI on top of drm-xe-next leaving that commit as
>        first one. git push topic/xe-for-CI, dim push drm-xe-next (or
>        implement the logic in dim to push 2 branches)
>
>     We may need some time between (a) and (b) depending on where we
>     are on the kernel release cycle: we don't want to submit a
>     kernel pull request before the firmware is available @
>     linux-firmware repo.
>
> Note that the fact we are using mmp makes it more complex, although
> explicit.  Going direct with lnl_gu_70.bin would also work and avoid
> updating the commits on the kernel side.

This works for a completely new release. For updating an existing 
release, we'll have to push, potentially multiple times, all the 
*_guc_70.bin binaries to intel-staging-for-CI. Just to be clear, I have 
nothing against this, just noting that it would generate a lot of noise 
in that branch and potentially use a lot of space on disk.

>
>>
>> We also need some rules to handle the case where there is already a 
>> PR in flight and we need to push some more blobs. This might be as 
>> easy as the committer seeing that there are commits on top of master, 
>> replying to the previous PR to deprecate it, and then generating a 
>> new PR with all the blobs.
>
> the pull requests to linux-firmware would come from tags, not a branch.
> So you have (tip of the branch is on top):
>
>     o <intel-staging> intel: Add lnl_guc_70.bin
>     o <refs/tags/intel-2024-01-30> intel: Update dg2_guc_70.bin  <-- 
> last in flight pull request
>     o intel: Add lnl_dmc.bin
>     o <origin/main> ....  <--  where linux-firmware is at
>
> Looking at amd-staging, it seems to match what they are doing:
> https://gitlab.freedesktop.org/drm/firmware/-/commits/amd-staging?ref_type=heads 
>
>
> see the amd-$DATE tags

Sorry I wasn't very clear in my comment, what I wanted to point out was 
that if we are on a unified branch and we have the PR against a specific 
tag (intel-2024-01-30 in your example) already in flight, how do we 
generate a new PR for the newer commit that comes after the tag (and 
which will have its own new tag)? Does git do some tag magic and handle 
it for us, or do we need to generate a new PR that supersedes the one in 
flight?


>
>>
>>
>>>
>>> 2) mmp firmware versions are only ever pushed to a separate 
>>> staging-intel-for-CI
>>>    branch. There is no pull request in the mailing for this. We can 
>>> either
>>>    push directly to the branch or create MRs in gitlab. CI would start
>>>    using this branch for the extra firmware for platforms instead of
>>>    whatever it's using today to process the pull requests from the
>>>    mailing list.  Or whatever it's using, because I don't know and 
>>> don't
>>>    see it documented anywhere.
>>
>> As long as the CI team is ok with this, I'm all for it.
>>
>>>
>>>    The patch on the kernel side to use the mmp firmware is only ever
>>>    pushed to the topic/xe-for-CI branch since a) the firmware is 
>>> coming from
>>>    a non-official location and b) end users and distro packaging
>>>    shouldn't see a warning when building the kernel due to a possibly
>>>    missing firmware
>>> 3) Raising firmware version requirement for past platforms used as
>>>    SDV can be done **unless** it raises the major version. That's 
>>> because
>>>    end users would start seeing the warning that we avoided in (2).
>>
>> Who are the end users here? If we're talking about older 
>> non-officially supported platforms, the only users should be 
>> developers and they should be able to handle having to update the 
>> firmwares to a newer major versions.
>
> distros and any developer outside Intel. The kernel build system is
> unaware of xe.force_probe. So if you have, after the several macros:
>
> MODULE_FIRMWARE("xe/tgl_guc_71.bin")
>
> It will show up in `modinfo -f firmware xe`. And it will show as a
> warning when installing/packaging a kernel.
>
> It doesn't matter for minor/patch updates because the file name is
> major-only and **running** with that module is protected by the
> force_probe. The major may be updated when it's available in
> linux-firmware, which means i915 started using it (for i915 that would
> be "as an option, with fallback to the previous major release" of
> course).

Ok I get the concern. My assumption here was that we'd only update the 
minimum required version if that version was in linux-firmware even for 
minor updates, hence why I didn't see why a major update would be 
different. I guess we could go with a more relaxed approach where we 
allow the required minor to be updated for force-probe platforms as long 
as the firmware is available on a public/CI branch even if it is not in 
linux-firmware.

Getting back on track with the original purpose of this patch, are you 
ok with setting the minimum to 70.19 if I first push the matching PVC 
70.19 binary (via the old method for now), while we continue sorting out 
how to manage the new repo?

Daniele

>
> Lucas De Marchi
>
>>
>> Daniele
>>
>>>
>>> thoughts?
>>>
>>> Lucas De Marchi
>>>
>>>>>
>>>>
>>>> Mine too.
>>>>
>>>> With that:
>>>> Acked-by: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>>> John.
>>>>>
>>>>>> agreeing to stop supporting very old GuC releases on the newer 
>>>>> driver.
>>>>>>
>>>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>>> <daniele.ceraolospurio@intel.com>
>>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>>>>>>    drivers/gpu/drm/xe/xe_uc_fw.c | 36 
>>>>> ++++++++++++++---------------------
>>>>>>    2 files changed, 16 insertions(+), 34 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>>>> b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> index 868208a39829..5e6b27aac495 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> @@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct 
>>>>> xe_guc *guc)
>>>>>>        return flags;
>>>>>>    }
>>>>>> -#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 
>>>>> 8) | (pat))
>>>>>> -
>>>>>>    static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>>>>    {
>>>>>>        struct xe_device *xe = guc_to_xe(guc);
>>>>>>        struct xe_gt *gt = guc_to_gt(guc);
>>>>>> -    struct xe_uc_fw *uc_fw = &guc->fw;
>>>>>> -    struct xe_uc_fw_version *version = 
>>>>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>>> -
>>>>>>        u32 flags = 0;
>>>>>>        if (XE_WA(gt, 22012773006))
>>>>>> @@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>>>>        if (XE_WA(gt, 1509372804))
>>>>>>            flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>>>>> -    if (XE_WA(gt, 14018913170)) {
>>>>>> -        if (GUC_VER(version->major, version->minor, 
>>>>> version->patch) >= GUC_VER(70, 7, 0))
>>>>>> -            flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>>>> -        else
>>>>>> -            drm_dbg(&xe->drm, "Skip WA 14018913170: GUC 
>>>>> version expected >= 70.7.0, found %u.%u.%u\n",
>>>>>> - version->major, version->minor, version->patch);
>>>>>> -    }
>>>>>> +    if (XE_WA(gt, 14018913170))
>>>>>> +        flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>>>>        return flags;
>>>>>>    }
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>> index 4714f2c8d2ba..e5bf59616f3d 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>> @@ -296,36 +296,28 @@ static void uc_fw_fini(struct drm_device 
>>>>> *drm, void *arg)
>>>>>> xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>>>>>>    }
>>>>>> -static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>>>>> uc_css_header *css)
>>>>>> +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>>>>> uc_css_header *css)
>>>>>>    {
>>>>>>        struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>>>>>        struct xe_uc_fw_version *release = 
>>>>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>>>        struct xe_uc_fw_version *compatibility = 
>>>>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>>>>>        xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>>>>> -    xe_gt_assert(gt, release->major >= 70);
>>>>>> -
>>>>>> -    if (release->major > 70 || release->minor >= 6) {
>>>>>> -        /* v70.6.0 adds CSS header support */
>>>>>> -        compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>>>>> -                         css->submission_version);
>>>>>> -        compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>>>>> -                         css->submission_version);
>>>>>> -        compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>>> -                         css->submission_version);
>>>>>> -    } else if (release->minor >= 3) {
>>>>>> -        /* v70.3.0 introduced v1.1.0 */
>>>>>> -        compatibility->major = 1;
>>>>>> -        compatibility->minor = 1;
>>>>>> -        compatibility->patch = 0;
>>>>>> -    } else {
>>>>>> -        /* v70.0.0 introduced v1.0.0 */
>>>>>> -        compatibility->major = 1;
>>>>>> -        compatibility->minor = 0;
>>>>>> -        compatibility->patch = 0;
>>>>>> +
>>>>>> +    /* We don't support GuC releases older than 70.19 */
>>>>>> +    if (release->major < 70 || (release->major == 70 && 
>>>>> release->minor < 19)) {
>>>>>> +        xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or 
>>>>> newer is required\n",
>>>>>> +              release->major, release->minor);
>>>>>> +        return -EINVAL;
>>>>>>        }
>>>>>> +    compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, 
>>>>> css->submission_version);
>>>>>> +    compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, 
>>>>> css->submission_version);
>>>>>> +    compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>>>>> css->submission_version);
>>>>>> +
>>>>>>        uc_fw->private_data_size = css->private_data_size;
>>>>>> +
>>>>>> +    return 0;
>>>>>>    }
>>>>>>    int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>>>>>> @@ -424,7 +416,7 @@ static int parse_css_header(struct 
>>>>> xe_uc_fw *uc_fw, const void *fw_data, size_t
>>>>>>        release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>>>>> css->sw_version);
>>>>>>        if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>>>>> -        guc_read_css_info(uc_fw, css);
>>>>>> +        return guc_read_css_info(uc_fw, css);
>>>>>>        return 0;
>>>>>>    }
>>>>>
>>


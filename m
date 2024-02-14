Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E811C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 21:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3665D10E172;
	Wed, 14 Feb 2024 21:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVykOe/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784B810E172
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 21:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707946430; x=1739482430;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=G2fki+d11SBjZJPu5GIklOcsERA/mzxHam75Xp0buJg=;
 b=ZVykOe/z3WTpdMf+lkZmrHa3mLZAtN57MfhpLRq5miav5oKMvP/quyPz
 KuCDkY4Nz+dTo9wuyk+0CXnjYUz+M7jhexqpZEVt8Y1AHyXa+UxhBRcIH
 6ySLat1XYH/k2lqiLxLN2xTPuyMyLieXxIGE+tDHD0kQO922MqZfybjTt
 U1qX7pAYKjM4l+JM8zphAnNINP4GX2Sd+ADxhqxQDe2XAwZZySYq8g1Ez
 57lvWaXYgLSoY8OLDdDGh48+r6b2CNvnWLqBB3/zuPJ9UQm/ZPNBHBy6n
 OYq0US9aEmcEBihqbJ6gfD2QtsUgKVUSX80KwOJ5pE2TRLZ5J6r+C60Hl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5791490"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208,217";a="5791490"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 13:33:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208,217";a="3305823"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 13:33:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 13:33:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 13:33:49 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 13:33:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqzCW7riuSHwB36w/jhBueuM6FOCDykl59VUHz5SDcQmSebzPxM06tMc2RQ7I1TnbPIM3Lg/VjnWiTMmlt4aoldE6YpRqmgYL3c0hKTecrWw7uik4zU/915M4oC42hC6GsLPpnGXWWx4QUvSCPdPO1pNJmRbxxbcsLt+rRvuQ9f3nKD11MTQDpBK3gXODvs6+1JbITjPYL/t8jY/80VB4+wCmJDHRx1DRuqslxD0A2YOWyehUdxRNkU1nXYzSnaMhhoCSp0hiOid1EUZAOQC2LDXVbpnL6I2Hrg1c0XMMe3r3BqCcCbZyEpfpnB8q8waQK1DJd3fdAQI9PaR6auDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78O1ovg3At58OXKBtV0r8nVYNvIyJZNN6qOqlqYk53A=;
 b=lTfLadHuwjARA1hjHTQsVXPhmncuIXNpFkZNNSpyGcyd2n8jGaIMiLPi5WH/Qu1Lp3DioX92Y/vVXFHknaod4JwbNFwFZDkkvZBt4aYNdvvo4QlF0yW8isa9/aEVXpMtjRn/4WCQVHq+r84ybpZqxSrifYmVlt5KFmP3gHKEPziCauINi27GdDZFkBMQf9/Ia+U9lQjSgHNwFEBUxGw4x0itylFd0/HQLkXfVNnklhR2GctFsOgy2DL+r9V2CzBzFEJvfx9lqdQrzn8fiNdgeMwO6M6mycSoHGXQrJqp+PFBdPGlqlC5AYqfIqRed4aaJt0Zdx471+aO1WgH8huPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40; Wed, 14 Feb
 2024 21:33:40 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03%7]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 21:33:40 +0000
Content-Type: multipart/alternative;
 boundary="------------HIBU6NpuC9ATh58p4ZP3Lzs0"
Message-ID: <72c36e5e-b118-4e03-9c5a-cf9d734570b9@intel.com>
Date: Wed, 14 Feb 2024 13:33:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
Content-Language: en-US
To: Gustavo Sousa <gustavo.sousa@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>, Matt Roper
 <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
 <bbb3bc27-73cd-47e4-bdb2-8a12e8aaf2ca@intel.com>
 <ZcL5c1TTfCxUckCi@DUT025-TGLU.fm.intel.com>
 <zcvxg35dgst3vffu76v532dhl5lob6ilpi3hktg4ptnqc6lsbd@dsrjrmgk2kdj>
 <6d27be6f-f501-4bba-a8f9-ae80f23484bd@intel.com>
 <v5mwvlynhfvcre2iudh3am34y7eh4llhifj32gw3l56g4idvw6@uo6rutzsqmyl>
 <d37b18a9-ab2d-478b-9510-087c8ff76ec5@intel.com>
 <qj734bhlz3yprl7y7eyb5fj2wzvumv4m3ehvh5kg7rseugsrjn@wjljwsrxsyft>
 <170793852364.56490.8544413096300747144@gjsousa-mobl2>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <170793852364.56490.8544413096300747144@gjsousa-mobl2>
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN0PR11MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 1096911f-4f52-42d7-4bf6-08dc2da49cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hw2wGYfsGzuV06T8m3oOD8AhuI85VslrrtBnm9CLwfPJmdkblKfAAiSfkneugEOZU6n1dw5w6MuiqwzjOfQnlYHT/vx33ezK0KTm1BksJEKSo1VX44GNZ/GQv98/eMjars3DKZwiJzIdUDAoQ6E6xU6FM4klxXVEZ6FEp8uDkJyTaLl5MxDeSRpSxibZzI5VTRSZJoKqOsUMxb/1md5pE77VFjriQCHQJKyEOaWvDomCrTterA21opVJ7H4ysDZEKxFZaSdJz+DcAy6hJGo6XRMB5b3rWRxBzqy4HJye1BMN9j4yKoP1rxjjA1KQ8bOQGqvTq3lr0tFcpD9S1Y6bT+a552TGo1PfSbsaQV0jfBc0f6l21LxXqV2NghOcjnwWufFeCBSMlzGWtLmtx00c9G9qFVRuU60pBR4nhfo6DW+SDfhIrHH+hJTRIbCAcZaw5UbDVd0q2PhvStJXeSmtAek0D9Rk2Tf6ac7YaMAhlm/l0qR7tLDr5Mdxyx+aqCaZ56oM+3ABe2IzPbLPKdheya3sf4G9HaUjPgdfTCjM4kTC1G9b8dKbWzIdfwwCDgqsiEF/g2NAxjVZ1/EWrvSfeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230273577357003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(36756003)(66556008)(6512007)(478600001)(26005)(83380400001)(53546011)(6636002)(4326008)(5660300002)(8676002)(66946007)(41300700001)(8936002)(66476007)(316002)(966005)(6486002)(6506007)(54906003)(166002)(82960400001)(38100700002)(66899024)(31696002)(86362001)(110136005)(33964004)(2616005)(107886003)(2906002)(30864003)(31686004)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjMvWjE3MGJJN3FPYWUxM0NpRW1yVmNRR2EvQVR5dEJ1NUV4RnNleHZSWnNY?=
 =?utf-8?B?dGR4R2R6enJmWmxMeTVhSTJVK0RaRGc5YklaRTVXSnJTY2FOOGFLODhlVmI0?=
 =?utf-8?B?YUxnYTdIWmdUU3VXTGVMVWwrTXdGR05VZ2lvam1iN2p2Z2lBK09Sbyt5Ui9B?=
 =?utf-8?B?TGZNVktlRzdGMHYzSnBBYzVNVXVDdG85akxnanIvdlUzckNWRXpmMjMwY0JX?=
 =?utf-8?B?VUVqcldzUlkrWFlDZkpUdWIzNDA0anp5Nmh1ZnRIMG82N2VtS3hPU2JNblpL?=
 =?utf-8?B?RlZ3Q2tQNm56dFQydXpEWWFSdkdwblA1MU40cy8xZkhlaUdNeFNQREN4ZnBG?=
 =?utf-8?B?Z1hyUnliaFR6ZHkrZHRnclQ3bFBxS3ltRkNhTkg3QUZ4Y3lwazNBWVhzRDNT?=
 =?utf-8?B?WU5VQ2JOVFpCSnF1TnVMNWZXWksvM0tVekdGcmZ4OE1RUWp3SU1pOTJKNHJZ?=
 =?utf-8?B?RE5WOWxQM09pVVNDbGZwajFVYWVkYk9xUjBER3NZVVJvNWRlZHZ6cndsRmVF?=
 =?utf-8?B?enR0NUhGL3Nsa2RWK0ZMdmpOa1VuR3Nia0dOeUd5RjZpSS9JQmMrYnZOWGNP?=
 =?utf-8?B?ZmF3VUMxMWxXdjRKaXk1b2JmNkE0S2R2cDhYaURseldrbVRuUU93UWdRMDBR?=
 =?utf-8?B?NlRmYjVuWXNySzBMd2FxT0lONldOM216cGhIZk9wYWp6TmtJSytGRlQxVlVn?=
 =?utf-8?B?dWY5Z2U0aFo1VEM0YTRENlhMaFJYTXhMS093amdqemhmanNOUFBvbjlDdTFJ?=
 =?utf-8?B?dGRZT2o3aHIxWlVWVGFocy9zL25BZXljYXprNytpU3Z6WUZBanZHUUNwYmV3?=
 =?utf-8?B?RzN4ZnduYkFMK3NQRHM1aWUya25XbjNPcU5OTVIwZVBMbGpockQ0OWQrdTBW?=
 =?utf-8?B?cjY0Y1BHeDBCYzlKdFNPVW5MVCs2NE5LUjBvNjBielM3V1FEdlhIRzFneThP?=
 =?utf-8?B?NkdITEJWTlRmZHk5ejJlWkR6UEhKMFZYaXhtTzc5a3BHSVB3U3o2eFFLVzJL?=
 =?utf-8?B?WlZkV1pYMVNVV1RuLy9Gb1JJVVBURFcwdytlMFA2Tnltd0xiSFI5dmZVSE9o?=
 =?utf-8?B?QkJsc1FLYnJVSU9QMWl5aWw1b3pjOXBjYi9WNnVlSERDWkgvR3p6ajZDRmU4?=
 =?utf-8?B?TS9OUlhtUjNhOElwUEJENXJVZEhSRDM2U2MvRkNPcnI0NFNUNDRLd0I1SE9v?=
 =?utf-8?B?em5VUnNwR0dzK1ErcU1nNCtsd3BxVGh3eTBoTGdSaXlVNERxbVhZZ3YybU9W?=
 =?utf-8?B?WVdGWUx5UnkyNzZTcmFFTlc0czFHbGRPeU1Xa0kvNWcvSDdqKzluV05WNWZp?=
 =?utf-8?B?MUsyM0NwdWkydVVrUkphWExpbHkwL3lJU1AzbE56NjZBRmF6eFBTQWdTU2Rn?=
 =?utf-8?B?cHlENjhscjVtQ1RVVVFhVWlqSTUyQ3h0aUkySStwVTcyNUpJQ1RjR3FwK040?=
 =?utf-8?B?S3RaOEVVdlVBYnRyUDZaQjM0VzFNeXA5WUtMMHhCQmpHbU1PNThlbnQ3OHhm?=
 =?utf-8?B?YmcrTXNjNm1DVmxsa2VJeWJ0Q1NYWGxGc2hPVUVwVlZkVEhNQWZkREkzYWJ5?=
 =?utf-8?B?Um5RbE9xSnZTTWE0VkROOWROVXJXa091eXlnZjVOa2xWQ3VZQ0R0dEkxM05C?=
 =?utf-8?B?cm0zNjZNQ2tMOFRFQWU1Ty94dklwZW9pYlBYVThiT3dPQ2ZWamNBWFRXQVRq?=
 =?utf-8?B?SWVia0ZqOTVaTlVGZVlHYnRlOXY1RDYreGdqOFQrV0d0QzlsTlNydlhvWjRy?=
 =?utf-8?B?OHNGVTZGZDR0a2VUWXEzSHYvNDdwN29ZcGlPVVhTWE5XczVMdjNGQWUvRlpl?=
 =?utf-8?B?dUkzQWM0OCswOEdNQi92VlFjcEpyT0diR0pKRXFsTWl4ZTJ4d09FY29ENzE2?=
 =?utf-8?B?V0NVdGk3WE4zVnRya2RxQ3lLa2ZWM242Umw3cUVwMjRSZm92VEo4cG9MT3oy?=
 =?utf-8?B?bWlLUERoQzNLUG9yOGZNcTJZT2JZbUM4dXVLZlRCNjAyYy9OdjU0MUZITXVC?=
 =?utf-8?B?aWU1TFY3eTAvc1NCWVF5Y3pvU1k2MW9QU1JzVDk3c0lBamR3U0gzbktsTThl?=
 =?utf-8?B?ejU3UytqVGZ6ZmpQaTNITFlSS0pxY295ZE5ERjE3elBhYmhDeU41am9abWsz?=
 =?utf-8?B?dmY3NG1yQUVjSTVGdTF1bHg3aEhXVXpJM0VpRDZhWVhSc2l2eUNzM2hKOGVM?=
 =?utf-8?Q?yLBmDkYahXwRaAc+gKh5qFE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1096911f-4f52-42d7-4bf6-08dc2da49cae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 21:33:40.7881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsTFga+G4IKBLgCB7TlBPDu3+r7gAbimYr+0nRD/UTEkYgmpjo7jwzyy1widAv7pzFv7vYe7YyEpH03qYTGGRnURbEA9QA9Naa0tPWIN5E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6208
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

--------------HIBU6NpuC9ATh58p4ZP3Lzs0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2/14/2024 11:22 AM, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2024-02-09 03:01:26-03:00)
>> On Thu, Feb 08, 2024 at 04:29:55PM -0800, Daniele Ceraolo Spurio wrote:
>>>
>>> On 2/7/2024 12:40 PM, Lucas De Marchi wrote:
>>>> On Wed, Feb 07, 2024 at 10:34:07AM -0800, Daniele Ceraolo Spurio wrote:
>>>>>
>>>>> On 2/7/2024 8:42 AM, Lucas De Marchi wrote:
>>>>>> +Gustavo who is dealing with DMC firmware lately
> Hey, guys. Sorry for being so late for the party...
>
>>>>>> On Wed, Feb 07, 2024 at 03:30:59AM +0000, Matthew Brost wrote:
>>>>>>> On Tue, Feb 06, 2024 at 05:18:50PM -0800, John Harrison wrote:
>>>>>>>> On 2/6/2024 15:41, Daniele Ceraolo Spurio wrote:
>>>>>>>>> Supporting older GuC versions comes with baggage, both on the coding
>>>>>>>>> side (due to interfaces only being available from a certain version
>>>>>>>>> onwards) and on the testing side (due to having to make
>>>>>>>>> sure
>>>>>>>> the driver
>>>>>>>>> works as expected with older GuCs).
>>>>>>>>> Since all of our Xe platform are still under force probe, we haven't
>>>>>>>>> committed to support any specific GuC version and we therefore don't
>>>>>>>>> need to support the older once, which means that we can
>>>>>>>>> force
>>>>>>>> a bottom
>>>>>>>>> limit to what GuC we accept. This allows us to remove any
>>>>>>>>> conditional
>>>>>>>>> statements based on older GuC versions and also to approach newer
>>>>>>>>> additions knowing that we'll never attempt to load something older
>>>>>>>>> than our minimum requirement.
>>>>>>>>>
>>>>>>>>> RFC: this patch sets the minimum to the current GuC version (70.19),
>>>>>>>>> but that can be moved one way or the other. The main aim here is
>>>>>>>> Ideally, this would be bumped every time we update Xe to a
>>>>>>>> newer firmware
>>>>>>>> version right up to the point when force probe is lifted. At
>>>>>>>> that point it
>>>>>>>> becomes fixed and we have to add the version check support
>>>>>>>> back in for
>>>>>>>> future w/a's and features.
>>>>>>>>
>>>>>>>> Get's my vote :).
>>>>>> Yeah, but see my other reply... I think we will have to wait the
>>>>>> firmware being available in linux-firmware for that.
>>>>>>
>>>>>> Also, let's kickstart a discussion on our process with some
>>>>>> possible changes so we can get it documented. I think we have a good
>>>>>> opportunity here to start adopting the
>>>>>> https://gitlab.freedesktop.org/drm/firmware  repo.
>>>>>>
>>>>>> Rough idea:
>>>>>>
>>>>>> 1) use intel-staging branch with tags for pull requests to
>>>>>>     linux-firmware, just like documented in their readme.
>>>>>>     IMO the naming is rather unfortunate since it would be
>>>>>>     good to use it for (2) below.... but since it's already used
> Agreed. The <vendor>-staging branches, as proposed in the README, look
> more like some sort of <vendor>-next type of branch.
>
> I think it would be good if vendors could have their own `<vendor>/*`
> (or `<vendor>-*`) namespace for branch names so that, while having some
> common conventions, they could also adapt parts of it to their needs.
> For example, we could have branches like intel/next for (1) and intel/ci
> for (2). Not sure how easy it is to do this now, though.
>
>>>>>>     we can use something else.
>>>>>>
>>>>>>     this would mainly replace the use we have today for
>>>>>>     https://cgit.freedesktop.org/drm/drm-firmware/  ,    which
>>>>>> could be retired. From  upstream linux-firmware pov the only
>>>>>>     change would be the remote location and that we start using tags
>>>>>>     for the pull requests, coming from a single branch regardless of
>>>>>>     the firmware (guc, huc, dmc, gsc): intel-staging. Once accepted in
>>>>>>     linux-firmware, the branch is fast-forwarded.
>>>>> I think this needs a bit more fleshing out, because before we do a
>>>>> pull request, we do want to run CI on the blobs. Also, in several
>>>>> occasions we went through a couple of versions before we closed on
>>>>> what to push to linux-firmware (e.g. in the latest push we started
>>>>> with 70.19.1 but then pushed 70.19.2), so we can't go to
>>>>> intel-staging until we're actually ready to push. I think the
>>>>> process you have below for mmp blobs should work for this early
>>>>> testing flow as well, but we might end up with a lot of noise in
>>>>> the staging-intel-for-CI branch.
>>>> that would be a throw away branch where we push stuff to be able to test
>>>> on CI. I don't think the commit history matters much there. The fact
>>> That depends on how CI does things. With the current handling of
>>> throwaway branches we have on drm-firmware, a CI request can
>>> accidentally roll back another one. e.g., if we push a throwaway
>>> branch with a GuC update and then another with a DMC update, the
>>> second push will roll-back the GuC to what's on the new branch (likely
>>> the linux-firmware version). That's why there was a suggestion ti use
>>> a unified branch for CI as well.
>> not sure we are talking about the same thing. It is a unified branch for
>> CI: staging-intel-for-CI is where the mmp +
>> about-to-be-upstreamed-for-the-first-time firmware blobs are added,
>> regardless if it's guc, dmc, huc, etc. IMO it's much simpler since CI
>> basically has to take the additional firmware from this 1 branch. No
>> risk of rolling back another firmware because of the new one.
> Maybe we are having some confusion here because of the term "throwaway"
> for intel-staging-for-ci?
>
> We use throwaway branches for the current process, but I guess
> intel-staging-for-ci would not really be a "throwaway" branch per se and
> a unified one (as already mentioned above).
>
> I think using intel-staging-for-ci will be okay if teams take the care
> of only adding/updating/removing blobs they are responsible for.

Just to clarify my POV, I see 3 use cases:

1) mmp + about-to-be-upstreamed-for-the-first-time blobs 2) CI on 
updates to existing blobs 3) Official push to linux-firmware for #1 we 
agreed to use intel-staging-for-ci while for #3 we have intel-staging. I 
was just saying that we should use intel-staging-for-ci for #2 as well, 
which however might create a lot of churn on that branch.

Daniele

>
>>>
>>>> that the firmware is available to match what is in the kernel and that
>>>> there's a documented process for using it in my view trumps the
>>>> this downside.
>>>>
>>>> what I expect would be, considering the LNL case as example:
>>>>
>>>> 1) Start testing with the mmp version:
>>>>
>>>>      a) Add firmware to  drm/firmware intel-staging-for-CI
>>>>      b) Add commit in topic/xe-for-CI on the kernel side to make
>>>>         use of that firmware
> How would we check for CI after (b)?
>
> For DMC, I have been doing something similar. Differences are:
>
>    * for (a), I am using an intel-ci branch on drm/drm-firmware and send
>      a pull request to intel-gfx so that CI makes the mmp blobs
>      available;
>
>    * for (b), I send a "[CI]"-tagged patch to intel-gfx making the kernel
>      explicitly use that fully versioned blob path. One advantage here is
>      that I keep a broken DMC release from causing CI noise on existing
>      unrelated patch series.
>
>>>> 2) Ooops, that has bugs
>>>>
>>>>      a) add a second mmp firmware to drm/firmware intel-staging-for-CI
>>>>      b) replace commit in topic/xe-for-CI on the kernel side
>>>>
>>>> 3) we think we are good, let's try for real
>>>>
>>>>      a) Add lnl_guc_70.bin to drm/firmware intel-staging-for-CI
>>>>      b) replace commit in topic/xe-for-CI on the kernel side
>>>>
>>>> 4) yay, it worked
>>>>
>>>>      a) Add that lnl_gu_70.bin firmware to intel-staging branch and
>>>>         prepare pull request to linux-firmware
>>>>      b) move patch from topic/xe-for-CI to drm-xe-next: i.e., rebase
>>>>         topic/xe-for-CI on top of drm-xe-next leaving that commit as
>>>>         first one. git push topic/xe-for-CI, dim push drm-xe-next (or
>>>>         implement the logic in dim to push 2 branches)
>>>>
>>>>      We may need some time between (a) and (b) depending on where we
>>>>      are on the kernel release cycle: we don't want to submit a
>>>>      kernel pull request before the firmware is available @
>>>>      linux-firmware repo.
>>>>
>>>> Note that the fact we are using mmp makes it more complex, although
>>>> explicit.  Going direct with lnl_gu_70.bin would also work and avoid
>>>> updating the commits on the kernel side.
>>> This works for a completely new release. For updating an existing
>>> release, we'll have to push, potentially multiple times, all the
>>> *_guc_70.bin binaries to intel-staging-for-CI. Just to be clear, I
>>> have nothing against this, just noting that it would generate a lot of
>>> noise in that branch and potentially use a lot of space on disk.
>>>
>>>>> We also need some rules to handle the case where there is already
>>>>> a PR in flight and we need to push some more blobs. This might be
>>>>> as easy as the committer seeing that there are commits on top of
>>>>> master, replying to the previous PR to deprecate it, and then
>>>>> generating a new PR with all the blobs.
>>>> the pull requests to linux-firmware would come from tags, not a branch.
>>>> So you have (tip of the branch is on top):
>>>>
>>>>      o <intel-staging> intel: Add lnl_guc_70.bin
>>>>      o <refs/tags/intel-2024-01-30> intel: Update dg2_guc_70.bin  <--
>>>> last in flight pull request
>>>>      o intel: Add lnl_dmc.bin
>>>>      o <origin/main> ....  <--  where linux-firmware is at
>>>>
>>>> Looking at amd-staging, it seems to match what they are doing:
>>>> https://gitlab.freedesktop.org/drm/firmware/-/commits/amd-staging?ref_type=heads
>>>>
>>>>
>>>> see the amd-$DATE tags
>>> Sorry I wasn't very clear in my comment, what I wanted to point out
>>> was that if we are on a unified branch and we have the PR against a
>>> specific tag (intel-2024-01-30 in your example) already in flight, how
>>> do we generate a new PR for the newer commit that comes after the tag
>>> (and which will have its own new tag)? Does git do some tag magic and
>>> handle it for us, or do we need to generate a new PR that supersedes
>>> the one in flight?
>> humn... there is no magic, the old tag is an ascendent path of the new
>> one. But as I said, just coordinating with the few people updating
>> firmware who/when will do the pull request should be sufficient for
>> avoiding a pull request when there's already another one in flight.
> While I see the benefit of having a unified intel-staging-for-ci, I
> think I'm failing to see much benefit of having a unified intel-staging
> here.
>
> Wouldn't it be better if pull request were independent of each other? If
> we had an intel/* (or intel-*) branching namespace, we could keep using
> throwaway branches for the pull requests and have the discipline of
> removing them when not needed anymore.
>
> --
> Gustavo Sousa
>
>>
>>>
>>>>>
>>>>>> 2) mmp firmware versions are only ever pushed to a separate
>>>>>> staging-intel-for-CI
>>>>>>     branch. There is no pull request in the mailing for this. We
>>>>>> can either
>>>>>>     push directly to the branch or create MRs in gitlab. CI would start
>>>>>>     using this branch for the extra firmware for platforms instead of
>>>>>>     whatever it's using today to process the pull requests from the
>>>>>>     mailing list.  Or whatever it's using, because I don't know
>>>>>> and don't
>>>>>>     see it documented anywhere.
>>>>> As long as the CI team is ok with this, I'm all for it.
>>>>>
>>>>>>     The patch on the kernel side to use the mmp firmware is only ever
>>>>>>     pushed to the topic/xe-for-CI branch since a) the firmware is
>>>>>> coming from
>>>>>>     a non-official location and b) end users and distro packaging
>>>>>>     shouldn't see a warning when building the kernel due to a possibly
>>>>>>     missing firmware
>>>>>> 3) Raising firmware version requirement for past platforms used as
>>>>>>     SDV can be done **unless** it raises the major version.
>>>>>> That's because
>>>>>>     end users would start seeing the warning that we avoided in (2).
>>>>> Who are the end users here? If we're talking about older
>>>>> non-officially supported platforms, the only users should be
>>>>> developers and they should be able to handle having to update the
>>>>> firmwares to a newer major versions.
>>>> distros and any developer outside Intel. The kernel build system is
>>>> unaware of xe.force_probe. So if you have, after the several macros:
>>>>
>>>> MODULE_FIRMWARE("xe/tgl_guc_71.bin")
>>>>
>>>> It will show up in `modinfo -f firmware xe`. And it will show as a
>>>> warning when installing/packaging a kernel.
>>>>
>>>> It doesn't matter for minor/patch updates because the file name is
>>>> major-only and **running** with that module is protected by the
>>>> force_probe. The major may be updated when it's available in
>>>> linux-firmware, which means i915 started using it (for i915 that would
>>>> be "as an option, with fallback to the previous major release" of
>>>> course).
>>> Ok I get the concern. My assumption here was that we'd only update the
>>> minimum required version if that version was in linux-firmware even
>>> for minor updates, hence why I didn't see why a major update would be
>>> different. I guess we could go with a more relaxed approach where we
>>> allow the required minor to be updated for force-probe platforms as
>>> long as the firmware is available on a public/CI branch even if it is
>>> not in linux-firmware.
>> yep, I don't see it causing issues to end users.
>>
>>> Getting back on track with the original purpose of this patch, are you
>>> ok with setting the minimum to 70.19 if I first push the matching PVC
>>> 70.19 binary (via the old method for now), while we continue sorting
>>> out how to manage the new repo?
>> yes.
>>
>> Lucas De Marchi
>>
>>> Daniele
>>>
>>>> Lucas De Marchi
>>>>
>>>>> Daniele
>>>>>
>>>>>> thoughts?
>>>>>>
>>>>>> Lucas De Marchi
>>>>>>
>>>>>>> Mine too.
>>>>>>>
>>>>>>> With that:
>>>>>>> Acked-by: Matthew Brost<matthew.brost@intel.com>
>>>>>>>
>>>>>>>> John.
>>>>>>>>
>>>>>>>>> agreeing to stop supporting very old GuC releases on the
>>>>>>>>> newer
>>>>>>>> driver.
>>>>>>>>> Signed-off-by: Daniele Ceraolo Spurio
>>>>>>>> <daniele.ceraolospurio@intel.com>
>>>>>>>>> Cc: John Harrison<John.C.Harrison@Intel.com>
>>>>>>>>> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
>>>>>>>>> Cc: Matt Roper<matthew.d.roper@intel.com>
>>>>>>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>>>>>>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>>>>>>>>>     drivers/gpu/drm/xe/xe_uc_fw.c | 36
>>>>>>>> ++++++++++++++---------------------
>>>>>>>>>     2 files changed, 16 insertions(+), 34 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>>> index 868208a39829..5e6b27aac495 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>>>>> @@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct
>>>>>>>> xe_guc *guc)
>>>>>>>>>         return flags;
>>>>>>>>>     }
>>>>>>>>> -#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min)
>>>>>>>>> <<
>>>>>>>> 8) | (pat))
>>>>>>>>> -
>>>>>>>>>     static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>>>>>>>     {
>>>>>>>>>         struct xe_device *xe = guc_to_xe(guc);
>>>>>>>>>         struct xe_gt *gt = guc_to_gt(guc);
>>>>>>>>> -    struct xe_uc_fw *uc_fw = &guc->fw;
>>>>>>>>> -    struct xe_uc_fw_version *version =
>>>>>>>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>>>>>> -
>>>>>>>>>         u32 flags = 0;
>>>>>>>>>         if (XE_WA(gt, 22012773006))
>>>>>>>>> @@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>>>>>>>         if (XE_WA(gt, 1509372804))
>>>>>>>>>             flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>>>>>>>> -    if (XE_WA(gt, 14018913170)) {
>>>>>>>>> -        if (GUC_VER(version->major, version->minor,
>>>>>>>> version->patch) >= GUC_VER(70, 7, 0))
>>>>>>>>> -            flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>>>>>>> -        else
>>>>>>>>> -            drm_dbg(&xe->drm, "Skip WA 14018913170: GUC
>>>>>>>> version expected >= 70.7.0, found %u.%u.%u\n",
>>>>>>>>> - version->major, version->minor, version->patch);
>>>>>>>>> -    }
>>>>>>>>> +    if (XE_WA(gt, 14018913170))
>>>>>>>>> +        flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>>>>>>>         return flags;
>>>>>>>>>     }
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>>> index 4714f2c8d2ba..e5bf59616f3d 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>>>>>> @@ -296,36 +296,28 @@ static void uc_fw_fini(struct
>>>>>>>>> drm_device
>>>>>>>> *drm, void *arg)
>>>>>>>>> xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>>>>>>>>>     }
>>>>>>>>> -static void guc_read_css_info(struct xe_uc_fw *uc_fw,
>>>>>>>>> struct
>>>>>>>> uc_css_header *css)
>>>>>>>>> +static int guc_read_css_info(struct xe_uc_fw *uc_fw,
>>>>>>>>> struct
>>>>>>>> uc_css_header *css)
>>>>>>>>>     {
>>>>>>>>>         struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>>>>>>>>         struct xe_uc_fw_version *release =
>>>>>>>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>>>>>>         struct xe_uc_fw_version *compatibility =
>>>>>>>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>>>>>>>>         xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>>>>>>>> -    xe_gt_assert(gt, release->major >= 70);
>>>>>>>>> -
>>>>>>>>> -    if (release->major > 70 || release->minor >= 6) {
>>>>>>>>> -        /* v70.6.0 adds CSS header support */
>>>>>>>>> -        compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>>>>>>>> -                         css->submission_version);
>>>>>>>>> -        compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>>>>>>>> -                         css->submission_version);
>>>>>>>>> -        compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>>>>>> -                         css->submission_version);
>>>>>>>>> -    } else if (release->minor >= 3) {
>>>>>>>>> -        /* v70.3.0 introduced v1.1.0 */
>>>>>>>>> -        compatibility->major = 1;
>>>>>>>>> -        compatibility->minor = 1;
>>>>>>>>> -        compatibility->patch = 0;
>>>>>>>>> -    } else {
>>>>>>>>> -        /* v70.0.0 introduced v1.0.0 */
>>>>>>>>> -        compatibility->major = 1;
>>>>>>>>> -        compatibility->minor = 0;
>>>>>>>>> -        compatibility->patch = 0;
>>>>>>>>> +
>>>>>>>>> +    /* We don't support GuC releases older than 70.19 */
>>>>>>>>> +    if (release->major < 70 || (release->major == 70 &&
>>>>>>>> release->minor < 19)) {
>>>>>>>>> +        xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or
>>>>>>>> newer is required\n",
>>>>>>>>> +              release->major, release->minor);
>>>>>>>>> +        return -EINVAL;
>>>>>>>>>         }
>>>>>>>>> +    compatibility->major =
>>>>>>>>> FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>>>>>>> css->submission_version);
>>>>>>>>> +    compatibility->minor =
>>>>>>>>> FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>>>>>>> css->submission_version);
>>>>>>>>> +    compatibility->patch =
>>>>>>>>> FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>>>>> css->submission_version);
>>>>>>>>> +
>>>>>>>>>         uc_fw->private_data_size = css->private_data_size;
>>>>>>>>> +
>>>>>>>>> +    return 0;
>>>>>>>>>     }
>>>>>>>>>     int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>>>>>>>>> @@ -424,7 +416,7 @@ static int parse_css_header(struct
>>>>>>>> xe_uc_fw *uc_fw, const void *fw_data, size_t
>>>>>>>>>         release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>>>>> css->sw_version);
>>>>>>>>>         if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>>>>>>>> -        guc_read_css_info(uc_fw, css);
>>>>>>>>> +        return guc_read_css_info(uc_fw, css);
>>>>>>>>>         return 0;
>>>>>>>>>     }

--------------HIBU6NpuC9ATh58p4ZP3Lzs0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/14/2024 11:22 AM, Gustavo Sousa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:170793852364.56490.8544413096300747144@gjsousa-mobl2">
      <pre class="moz-quote-pre" wrap="">Quoting Lucas De Marchi (2024-02-09 03:01:26-03:00)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Thu, Feb 08, 2024 at 04:29:55PM -0800, Daniele Ceraolo Spurio wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

On 2/7/2024 12:40 PM, Lucas De Marchi wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Wed, Feb 07, 2024 at 10:34:07AM -0800, Daniele Ceraolo Spurio wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">

On 2/7/2024 8:42 AM, Lucas De Marchi wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">+Gustavo who is dealing with DMC firmware lately
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hey, guys. Sorry for being so late for the party...

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
On Wed, Feb 07, 2024 at 03:30:59AM +0000, Matthew Brost wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">On Tue, Feb 06, 2024 at 05:18:50PM -0800, John Harrison wrote:
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">On 2/6/2024 15:41, Daniele Ceraolo Spurio wrote:
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">Supporting older GuC versions comes with baggage, both on the coding
side (due to interfaces only being available from a certain version
onwards) and on the testing side (due to having to make 
sure
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">the driver
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">works as expected with older GuCs).
Since all of our Xe platform are still under force probe, we haven't
committed to support any specific GuC version and we therefore don't
need to support the older once, which means that we can 
force
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">a bottom
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">limit to what GuC we accept. This allows us to remove any 
conditional
statements based on older GuC versions and also to approach newer
additions knowing that we'll never attempt to load something older
than our minimum requirement.

RFC: this patch sets the minimum to the current GuC version (70.19),
but that can be moved one way or the other. The main aim here is
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">Ideally, this would be bumped every time we update Xe to a 
newer firmware
version right up to the point when force probe is lifted. At 
that point it
becomes fixed and we have to add the version check support 
back in for
future w/a's and features.

Get's my vote :).
</pre>
                  </blockquote>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">
Yeah, but see my other reply... I think we will have to wait the
firmware being available in linux-firmware for that.

Also, let's kickstart a discussion on our process with some
possible changes so we can get it documented. I think we have a good
opportunity here to start adopting the
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/firmware">https://gitlab.freedesktop.org/drm/firmware</a> repo.

Rough idea:

1) use intel-staging branch with tags for pull requests to
&nbsp;&nbsp; linux-firmware, just like documented in their readme.
&nbsp;&nbsp; IMO the naming is rather unfortunate since it would be
&nbsp;&nbsp; good to use it for (2) below.... but since it's already used
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Agreed. The &lt;vendor&gt;-staging branches, as proposed in the README, look
more like some sort of &lt;vendor&gt;-next type of branch.

I think it would be good if vendors could have their own `&lt;vendor&gt;/*`
(or `&lt;vendor&gt;-*`) namespace for branch names so that, while having some
common conventions, they could also adapt parts of it to their needs.
For example, we could have branches like intel/next for (1) and intel/ci
for (2). Not sure how easy it is to do this now, though.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp; we can use something else.

&nbsp;&nbsp; this would mainly replace the use we have today for
&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://cgit.freedesktop.org/drm/drm-firmware/">https://cgit.freedesktop.org/drm/drm-firmware/</a> , &nbsp;&nbsp; which 
could be retired. From&nbsp; upstream linux-firmware pov the only
&nbsp;&nbsp; change would be the remote location and that we start using tags
&nbsp;&nbsp; for the pull requests, coming from a single branch regardless of
&nbsp;&nbsp; the firmware (guc, huc, dmc, gsc): intel-staging. Once accepted in
&nbsp;&nbsp; linux-firmware, the branch is fast-forwarded.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
I think this needs a bit more fleshing out, because before we do a 
pull request, we do want to run CI on the blobs. Also, in several 
occasions we went through a couple of versions before we closed on 
what to push to linux-firmware (e.g. in the latest push we started 
with 70.19.1 but then pushed 70.19.2), so we can't go to 
intel-staging until we're actually ready to push. I think the 
process you have below for mmp blobs should work for this early 
testing flow as well, but we might end up with a lot of noise in 
the staging-intel-for-CI branch.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
that would be a throw away branch where we push stuff to be able to test
on CI. I don't think the commit history matters much there. The fact
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
That depends on how CI does things. With the current handling of 
throwaway branches we have on drm-firmware, a CI request can 
accidentally roll back another one. e.g., if we push a throwaway 
branch with a GuC update and then another with a DMC update, the 
second push will roll-back the GuC to what's on the new branch (likely 
the linux-firmware version). That's why there was a suggestion ti use 
a unified branch for CI as well.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
not sure we are talking about the same thing. It is a unified branch for
CI: staging-intel-for-CI is where the mmp +
about-to-be-upstreamed-for-the-first-time firmware blobs are added,
regardless if it's guc, dmc, huc, etc. IMO it's much simpler since CI
basically has to take the additional firmware from this 1 branch. No
risk of rolling back another firmware because of the new one.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Maybe we are having some confusion here because of the term &quot;throwaway&quot;
for intel-staging-for-ci?

We use throwaway branches for the current process, but I guess
intel-staging-for-ci would not really be a &quot;throwaway&quot; branch per se and
a unified one (as already mentioned above).

I think using intel-staging-for-ci will be okay if teams take the care
of only adding/updating/removing blobs they are responsible for.</pre>
    </blockquote>
    <br>
    Just to clarify my POV, I see 3 use cases:<br>
    <br>
    1) <span style="white-space: pre-wrap">mmp + </span><span style="white-space: pre-wrap">about-to-be-upstreamed-for-the-first-time blobs
2) CI on updates to existing blobs
3) Official push to linux-firmware

</span>for #1 we agreed to use intel-staging-for-ci while for #3 we have
    intel-staging. I was just saying that we should use
    intel-staging-for-ci for #2 as well, which however might create a
    lot of churn on that branch.<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:170793852364.56490.8544413096300747144@gjsousa-mobl2">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">that the firmware is available to match what is in the kernel and that
there's a documented process for using it in my view trumps the
this downside.

what I expect would be, considering the LNL case as example:

1) Start testing with the mmp version:

&nbsp;&nbsp;&nbsp;&nbsp;a) Add firmware to&nbsp; drm/firmware intel-staging-for-CI
&nbsp;&nbsp;&nbsp;&nbsp;b) Add commit in topic/xe-for-CI on the kernel side to make
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use of that firmware
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
How would we check for CI after (b)?

For DMC, I have been doing something similar. Differences are:

  * for (a), I am using an intel-ci branch on drm/drm-firmware and send
    a pull request to intel-gfx so that CI makes the mmp blobs
    available;

  * for (b), I send a &quot;[CI]&quot;-tagged patch to intel-gfx making the kernel
    explicitly use that fully versioned blob path. One advantage here is
    that I keep a broken DMC release from causing CI noise on existing
    unrelated patch series.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
2) Ooops, that has bugs

&nbsp;&nbsp;&nbsp;&nbsp;a) add a second mmp firmware to drm/firmware intel-staging-for-CI
&nbsp;&nbsp;&nbsp;&nbsp;b) replace commit in topic/xe-for-CI on the kernel side

3) we think we are good, let's try for real

&nbsp;&nbsp;&nbsp;&nbsp;a) Add lnl_guc_70.bin to drm/firmware intel-staging-for-CI
&nbsp;&nbsp;&nbsp;&nbsp;b) replace commit in topic/xe-for-CI on the kernel side

4) yay, it worked

&nbsp;&nbsp;&nbsp;&nbsp;a) Add that lnl_gu_70.bin firmware to intel-staging branch and
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prepare pull request to linux-firmware
&nbsp;&nbsp;&nbsp;&nbsp;b) move patch from topic/xe-for-CI to drm-xe-next: i.e., rebase
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; topic/xe-for-CI on top of drm-xe-next leaving that commit as
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first one. git push topic/xe-for-CI, dim push drm-xe-next (or
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; implement the logic in dim to push 2 branches)

&nbsp;&nbsp;&nbsp;&nbsp;We may need some time between (a) and (b) depending on where we
&nbsp;&nbsp;&nbsp;&nbsp;are on the kernel release cycle: we don't want to submit a
&nbsp;&nbsp;&nbsp;&nbsp;kernel pull request before the firmware is available @
&nbsp;&nbsp;&nbsp;&nbsp;linux-firmware repo.

Note that the fact we are using mmp makes it more complex, although
explicit.&nbsp; Going direct with lnl_gu_70.bin would also work and avoid
updating the commits on the kernel side.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
This works for a completely new release. For updating an existing 
release, we'll have to push, potentially multiple times, all the 
*_guc_70.bin binaries to intel-staging-for-CI. Just to be clear, I 
have nothing against this, just noting that it would generate a lot of 
noise in that branch and potentially use a lot of space on disk.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
We also need some rules to handle the case where there is already 
a PR in flight and we need to push some more blobs. This might be 
as easy as the committer seeing that there are commits on top of 
master, replying to the previous PR to deprecate it, and then 
generating a new PR with all the blobs.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
the pull requests to linux-firmware would come from tags, not a branch.
So you have (tip of the branch is on top):

&nbsp;&nbsp;&nbsp;&nbsp;o &lt;intel-staging&gt; intel: Add lnl_guc_70.bin
&nbsp;&nbsp;&nbsp;&nbsp;o &lt;refs/tags/intel-2024-01-30&gt; intel: Update dg2_guc_70.bin&nbsp; &lt;-- 
last in flight pull request
&nbsp;&nbsp;&nbsp;&nbsp;o intel: Add lnl_dmc.bin
&nbsp;&nbsp;&nbsp;&nbsp;o &lt;origin/main&gt; ....&nbsp; &lt;--&nbsp; where linux-firmware is at

Looking at amd-staging, it seems to match what they are doing:
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/firmware/-/commits/amd-staging?ref_type=heads">https://gitlab.freedesktop.org/drm/firmware/-/commits/amd-staging?ref_type=heads</a>


see the amd-$DATE tags
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Sorry I wasn't very clear in my comment, what I wanted to point out 
was that if we are on a unified branch and we have the PR against a 
specific tag (intel-2024-01-30 in your example) already in flight, how 
do we generate a new PR for the newer commit that comes after the tag 
(and which will have its own new tag)? Does git do some tag magic and 
handle it for us, or do we need to generate a new PR that supersedes 
the one in flight?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
humn... there is no magic, the old tag is an ascendent path of the new
one. But as I said, just coordinating with the few people updating
firmware who/when will do the pull request should be sufficient for
avoiding a pull request when there's already another one in flight.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
While I see the benefit of having a unified intel-staging-for-ci, I
think I'm failing to see much benefit of having a unified intel-staging
here.

Wouldn't it be better if pull request were independent of each other? If
we had an intel/* (or intel-*) branching namespace, we could keep using
throwaway branches for the pull requests and have the discipline of
removing them when not needed anymore.

--
Gustavo Sousa

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
2) mmp firmware versions are only ever pushed to a separate 
staging-intel-for-CI
&nbsp;&nbsp; branch. There is no pull request in the mailing for this. We 
can either
&nbsp;&nbsp; push directly to the branch or create MRs in gitlab. CI would start
&nbsp;&nbsp; using this branch for the extra firmware for platforms instead of
&nbsp;&nbsp; whatever it's using today to process the pull requests from the
&nbsp;&nbsp; mailing list.&nbsp; Or whatever it's using, because I don't know 
and don't
&nbsp;&nbsp; see it documented anywhere.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
As long as the CI team is ok with this, I'm all for it.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
&nbsp;&nbsp; The patch on the kernel side to use the mmp firmware is only ever
&nbsp;&nbsp; pushed to the topic/xe-for-CI branch since a) the firmware is 
coming from
&nbsp;&nbsp; a non-official location and b) end users and distro packaging
&nbsp;&nbsp; shouldn't see a warning when building the kernel due to a possibly
&nbsp;&nbsp; missing firmware
3) Raising firmware version requirement for past platforms used as
&nbsp;&nbsp; SDV can be done **unless** it raises the major version. 
That's because
&nbsp;&nbsp; end users would start seeing the warning that we avoided in (2).
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
Who are the end users here? If we're talking about older 
non-officially supported platforms, the only users should be 
developers and they should be able to handle having to update the 
firmwares to a newer major versions.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
distros and any developer outside Intel. The kernel build system is
unaware of xe.force_probe. So if you have, after the several macros:

MODULE_FIRMWARE(&quot;xe/tgl_guc_71.bin&quot;)

It will show up in `modinfo -f firmware xe`. And it will show as a
warning when installing/packaging a kernel.

It doesn't matter for minor/patch updates because the file name is
major-only and **running** with that module is protected by the
force_probe. The major may be updated when it's available in
linux-firmware, which means i915 started using it (for i915 that would
be &quot;as an option, with fallback to the previous major release&quot; of
course).
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Ok I get the concern. My assumption here was that we'd only update the 
minimum required version if that version was in linux-firmware even 
for minor updates, hence why I didn't see why a major update would be 
different. I guess we could go with a more relaxed approach where we 
allow the required minor to be updated for force-probe platforms as 
long as the firmware is available on a public/CI branch even if it is 
not in linux-firmware.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
yep, I don't see it causing issues to end users.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Getting back on track with the original purpose of this patch, are you 
ok with setting the minimum to 70.19 if I first push the matching PVC 
70.19 binary (via the old method for now), while we continue sorting 
out how to manage the new repo?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
yes.

Lucas De Marchi

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Daniele

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Lucas De Marchi

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
Daniele

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
thoughts?

Lucas De Marchi

</pre>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">
Mine too.

With that:
Acked-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>

</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">John.

</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">agreeing to stop supporting very old GuC releases on the 
newer
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">driver.
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Daniele Ceraolo Spurio
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap=""><a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
---
&nbsp;&nbsp; drivers/gpu/drm/xe/xe_guc.c&nbsp;&nbsp; | 14 ++------------
&nbsp;&nbsp; drivers/gpu/drm/xe/xe_uc_fw.c | 36
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">++++++++++++++---------------------
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp; 2 files changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">b/drivers/gpu/drm/xe/xe_guc.c
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">index 868208a39829..5e6b27aac495 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">xe_guc *guc)
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return flags;
&nbsp;&nbsp; }
-#define GUC_VER(maj, min, pat)&nbsp;&nbsp;&nbsp; (((maj) &lt;&lt; 16) | ((min) 
&lt;&lt;
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">8) | (pat))
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">-
&nbsp;&nbsp; static u32 guc_ctl_wa_flags(struct xe_guc *guc)
&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_device *xe = guc_to_xe(guc);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_gt *gt = guc_to_gt(guc);
-&nbsp;&nbsp;&nbsp; struct xe_uc_fw *uc_fw = &amp;guc-&gt;fw;
-&nbsp;&nbsp;&nbsp; struct xe_uc_fw_version *version =
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&amp;uc_fw-&gt;versions.found[XE_UC_FW_VER_RELEASE];
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">-
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 flags = 0;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (XE_WA(gt, 22012773006))
@@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (XE_WA(gt, 1509372804))
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags |= GUC_WA_RENDER_RST_RC6_EXIT;
-&nbsp;&nbsp;&nbsp; if (XE_WA(gt, 14018913170)) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (GUC_VER(version-&gt;major, version-&gt;minor,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">version-&gt;patch) &gt;= GUC_VER(70, 7, 0))
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg(&amp;xe-&gt;drm, &quot;Skip WA 14018913170: GUC
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">version expected &gt;= 70.7.0, found %u.%u.%u\n&quot;,
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">- version-&gt;major, version-&gt;minor, version-&gt;patch);
-&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp; if (XE_WA(gt, 14018913170))
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return flags;
&nbsp;&nbsp; }
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">b/drivers/gpu/drm/xe/xe_uc_fw.c
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">index 4714f2c8d2ba..e5bf59616f3d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -296,36 +296,28 @@ static void uc_fw_fini(struct 
drm_device
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">*drm, void *arg)
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
&nbsp;&nbsp; }
-static void guc_read_css_info(struct xe_uc_fw *uc_fw, 
struct
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">uc_css_header *css)
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">+static int guc_read_css_info(struct xe_uc_fw *uc_fw, 
struct
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">uc_css_header *css)
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_gt *gt = uc_fw_to_gt(uc_fw);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_uc_fw_version *release =
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&amp;uc_fw-&gt;versions.found[XE_UC_FW_VER_RELEASE];
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_uc_fw_version *compatibility =
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">&amp;uc_fw-&gt;versions.found[XE_UC_FW_VER_COMPATIBILITY];
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_assert(gt, uc_fw-&gt;type == XE_UC_FW_TYPE_GUC);
-&nbsp;&nbsp;&nbsp; xe_gt_assert(gt, release-&gt;major &gt;= 70);
-
-&nbsp;&nbsp;&nbsp; if (release-&gt;major &gt; 70 || release-&gt;minor &gt;= 6) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* v70.6.0 adds CSS header support */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatibility-&gt;major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; css-&gt;submission_version);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatibility-&gt;minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; css-&gt;submission_version);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatibility-&gt;patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; css-&gt;submission_version);
-&nbsp;&nbsp;&nbsp; } else if (release-&gt;minor &gt;= 3) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* v70.3.0 introduced v1.1.0 */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatibility-&gt;major = 1;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatibility-&gt;minor = 1;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatibility-&gt;patch = 0;
-&nbsp;&nbsp;&nbsp; } else {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* v70.0.0 introduced v1.0.0 */
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatibility-&gt;major = 1;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatibility-&gt;minor = 0;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatibility-&gt;patch = 0;
+
+&nbsp;&nbsp;&nbsp; /* We don't support GuC releases older than 70.19 */
+&nbsp;&nbsp;&nbsp; if (release-&gt;major &lt; 70 || (release-&gt;major == 70 &amp;&amp;
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">release-&gt;minor &lt; 19)) {
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_err(gt, &quot;Unsupported GuC v%u.%u! v70.19 or
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">newer is required\n&quot;,
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; release-&gt;major, release-&gt;minor);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
+&nbsp;&nbsp;&nbsp; compatibility-&gt;major = 
FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">css-&gt;submission_version);
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp; compatibility-&gt;minor = 
FIELD_GET(CSS_SW_VERSION_UC_MINOR,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">css-&gt;submission_version);
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp; compatibility-&gt;patch = 
FIELD_GET(CSS_SW_VERSION_UC_PATCH,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">css-&gt;submission_version);
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uc_fw-&gt;private_data_size = css-&gt;private_data_size;
+
+&nbsp;&nbsp;&nbsp; return 0;
&nbsp;&nbsp; }
&nbsp;&nbsp; int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
@@ -424,7 +416,7 @@ static int parse_css_header(struct
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">xe_uc_fw *uc_fw, const void *fw_data, size_t
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; release-&gt;patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">css-&gt;sw_version);
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (uc_fw-&gt;type == XE_UC_FW_TYPE_GUC)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guc_read_css_info(uc_fw, css);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return guc_read_css_info(uc_fw, css);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
&nbsp;&nbsp; }
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------HIBU6NpuC9ATh58p4ZP3Lzs0--

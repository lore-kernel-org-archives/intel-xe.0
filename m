Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5462EC76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 13:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295FA10E0D2;
	Mon,  3 Apr 2023 13:02:54 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF5810E0D2
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680526971; x=1712062971;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hUhAptbvMqV1l+CkseDOaj2kaSV+Qe3pcMvKe3l3xQE=;
 b=YxBgX+Zub5hohw78wUteuL3eFYcB0RcK+gSUXPNZuYR5eeO5CbvAC0b6
 Wtkv5gSTgaeNmFw2CVrWtKugnlGQIIRT55QJKMo7BdyW1Vxlnu+i5uUNn
 dNonK9wJpkH9gSN2GCiSmI9hLzOcyCLLXFFOeKlLTgVjqocc6qHYIUCA1
 NbBB6F6ZEOPsxg+ino6WfC1URlCIH+eWARlWcy81J68S1CkhBrMn5/Hby
 rv2kG2ig7/s+zNv/w7+0zwAeqVfZBO5UYP5kQQi565u0umccV8GZ2P2H/
 k8PfClWPjAMkFAdikUDvSgJW3Z/9WTznWdfOmqKe3i3dmIxo7WLWKnCMy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="330462034"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="330462034"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 06:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="685956854"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="685956854"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 03 Apr 2023 06:02:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 06:02:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 06:02:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 06:02:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XV0r3Stn+ViTpnPbPY/wiX2YumXh7bCNqXnTnMzs1VNsp7A6oAtMwMhOKBT6T4dfJQ/HIxzGhlUkJmjqPWUxGodQ8XnEwh/WC3tV505DdcY+texwWb2W0XeXyc8P3QLzknTSUzn1Cad2gk5Zco22Ae9tB2FVqaUgG4EQxs8hVDk8KxN0xlRq4+dQUj/BumwEY3iztP9LQGWOl1LAV01PP6G9Q3WneXF+xHM/nDBYz5J5KRQD21kAx2VZx5ADZTzCrImiakzVRUgXRUOMeL62z1UcgnNrvLp39oRLnZxZ6SUH6qw0xAPL7sMiKnZBkpEN0IlSiY4EvKjGh4Y8Buo4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPrmoBUilXe2HJQnBD4ITPswjiiBa5KsKzcMnr+dP68=;
 b=TnuVEQ76K87pjbFe+hFzvFH0Pl1T/uQLYmkrXSpa4T/ZP99jgtV840XSjQZ48PJnkpqAsB8Cl9C25xYs6nQMdo94HCY4T0QGGNL8MGsR8b+F8INWjkqPc2y0aO5ktI0anH+MSAJNf1ki2CwhhETgAhRmB/0HqizYFg8ICiGZ/ZD3uAsovgmNHFn7eV6qTprazUGbW9X3fv2AgLqpPcigC3AoVqJVAWq7M8H4MKqEN+ct9qtwVm4g5wfUu4E+Ub9UYkVQcpZlO6+Bijn+DGf1GGvUY6Xj4LBamn76bwY2EuDhdsO0fpbDZUZMtOSfz7GZn5jt2ww7uyAohd8o3YwpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4866.namprd11.prod.outlook.com (2603:10b6:303:91::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 13:02:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 13:02:33 +0000
Date: Mon, 3 Apr 2023 06:02:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230403130230.ecltjsfu2q47iliz@ldmartin-desk2.lan>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331143337.vtlyhttwwqfv2tad@ldmartin-desk2>
 <20230401085459.ub2rgeiqbi225n42@ldmartin-desk2.lan>
 <epatz7qx73i3kzxa4fzn7xcizmdiesgqei62ixvjvhi64i5z36@qz6l54vqdsp7>
 <20230402013449.orx5njgiy4uyjcbj@ldmartin-desk2.lan>
 <cb9c13f0-fbbf-415b-35a8-0c00bfe1864a@intel.com>
 <20230402215431.lhqn4qtqawbrefmb@ldmartin-desk2.lan>
 <0ce8d4fe-59e9-d950-4e0d-d70e74e395a6@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ce8d4fe-59e9-d950-4e0d-d70e74e395a6@intel.com>
X-ClientProxiedBy: MW4P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: dd46d21b-ad15-45b4-b492-08db3443b07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DJuAm840aGtPgKffVd5buFPw+XdnSSgOVefdZOQbltQLCVowFqUEGUfheV6/wK7pN6RylhPKmPQ2gKFwLGOsb9qtYweiOlCUfFhOJi0q3L4kIuiOWS138R2jGsUUJvPAt7DlS9lg+HXMmiRnCBpR2tf3K7M0QW9gQxf1EMuHnVZLvQHl1+zQtwqwhbeQINXQbewjb+W09e882pdBOG6kbnIH1jcHHynnsEn2sDCl5GYCgNUe/tOb6GkJbHRXenh9Kq5DldFThbWy9WGkdFJB6mDXWGwu3HxYZMwJqegqS1wXxJ2O5wKtd2ZxlBNexmj5/9ecQaxQFjZv/708Fdug/ijZx1buXW/SbMHK6HPGNA/5wbEAv1gOwNyN4t2iRTXy/kszVSoPAh7Inp3MdSaWR0EX1aUJUTf8w0CcrUTN5upYHycUFGig015umaqYjkfMFRPS9UAqf+CvgZHYhbO4rYOa/bBznTmOc9QEIcWfiXN41RITlk3olhY10wVoCFXv26EELEJtU2BhfB7mA5BPcoV1RUUl8vEh3z56eFs3frBsNw9P27Xujo6E+9RnsR0R47xpdtdbT+AT+30akaKB7Snf7wcljfDYKdd4dsAANmM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(2906002)(38100700002)(5660300002)(82960400001)(66476007)(66556008)(6862004)(66946007)(8936002)(41300700001)(8676002)(4326008)(36756003)(1076003)(6636002)(316002)(83380400001)(53546011)(86362001)(966005)(478600001)(186003)(107886003)(9686003)(26005)(6512007)(6506007)(6486002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzZrcTNGNFBLRXFIc0tnL0xuem1vMWozSmxmd0FQL3I4cUFGVkZ1RW1EWE9u?=
 =?utf-8?B?SG9STVNwVXBxVHJRTE8vWFpFZTdQdWZvVVNYM09aN2xhUklTMmJ0Y3JOdzNR?=
 =?utf-8?B?NS9Bb1BPeXNhS2FtUFVjTEpsYmxmbi80eWplUjJ1NzF0WEY5MG51Ni84WVc5?=
 =?utf-8?B?T2Riand3Zk9aLzNCZDhKdVN5VHN3UDBJODVuOU5PeUEvVmM1bXJ4K1RUNytN?=
 =?utf-8?B?UmtpTFRPZVVmNnVyWElZWVhRanBDemdwWGIyUlh2ck4vUTdtMFJ5RXBlVkxB?=
 =?utf-8?B?a3ZvQ1RHZmR5bjM1WEZ4SFpSYmNlTUw0dzREeHovYU53S1k3RTdNOU8yMDJs?=
 =?utf-8?B?WExmdElwelQ5TjkwZ0hpMDJlYzk4bmVDeS8vNW80Q09IS1FTY203dE40MGlx?=
 =?utf-8?B?cytuZ1RzcUR5djV1QlNmM20vZGNXZkdOUWNTRlNpTDh0SEZFR0lCaDJtTkpv?=
 =?utf-8?B?b3VlMk9xTlV6ZzhISUlsaG5TNnZMZ3VsSEZxOXVYejdiQUFHZkl3RFZ0ejVz?=
 =?utf-8?B?QXl3bm1scHpwWEhLL3JEclVyam02QWtOVW5JTEZSYUsvSWg5NnFSMThXa2U0?=
 =?utf-8?B?ZGc4WWpHTWtNdFlVSlRyeHl5dmhKeXY2VEZ5QVp3RUJQYnRzQlRtd3IyenUv?=
 =?utf-8?B?MTdDZGkybGlCOEVTcDlQaVlrVFVwZmtxbFNiQU84aktZTVRhNGc0UnRCWEZu?=
 =?utf-8?B?NHNvOHl0eC9xVEUzMDBZRldOQ1N2eWc2UzlnQUxqUnFFUFIrQkc5Qk1Kb2cy?=
 =?utf-8?B?b3pQVHpSQzArcDJiRGhmTGRnUnRxRVhUaHFHcGxsam52OXJqSW1ObjlRdXN2?=
 =?utf-8?B?MDhRZ2lKQzRwUXJma0I4SXo4U2RsaGNHcmVGZ3J1Q3hHdnVTZkNUZVBnVk9j?=
 =?utf-8?B?eWs4ZDdYVjhzelJKdWY4aHdFcGpoRmo0SUpRYkdEUzdGY3R2cDRtU0xWYTNp?=
 =?utf-8?B?YmswYUNJZ0xxWnk0Mm9Vc0t5aklTR1A3M3hXKzk1N2ZaaXZXeENIR2dhWDU3?=
 =?utf-8?B?dmtvVG1YbWFjOFMrWVlDa2Z0WVY5K2d4YzM3TTdpd01mTkt6OWt2RmpBcE1z?=
 =?utf-8?B?MmNzcDI4Rzg3QmVXNTNPbFRkdUNKbE9QYkNOWmNqM2hHTTJmNzlCRVVTeEtt?=
 =?utf-8?B?eXRCVHhndmpnb1hFZCtlSzAwa3lkOXZRUDRyRWFEd2NoMFhDNnFxNDVLdnpj?=
 =?utf-8?B?RG9wN1h2OHFwZWREMnpVSFZXd0RDRzIwakFsYktHU0V6cVkrQVI1V0R1VWhO?=
 =?utf-8?B?OHBFd2FWVzV6M3JSOUtjeG1JcE1JNWNQVEh6NnpOUDN6eVlod0xNU2RVU3dF?=
 =?utf-8?B?amJCM2lhTmsrMWgrb2M0Um5KVVpacmttSzZiTk56WTkyV3RGdENnNjBZZTFo?=
 =?utf-8?B?b0hLb2h2Zlg1T2Iwd3JaTmdOb1pZT0Zzc1krME9HaGZLMDhrVkNFMllBVFNw?=
 =?utf-8?B?SXVzenR6Wm4wUjNwbjJRUXVITlRWQ2IrWHIwOFByU1d5bE8vWUpCK2RnQldC?=
 =?utf-8?B?UXZjSVRVWEdWVEFLdlF1OGN1dlllRGxzYitTaG9sVzQvdnk2UkkvR0hGNE5M?=
 =?utf-8?B?L1IwbExQRGtYS1NnOVVDbFAyQVRBZll0M3V3N1ExMHJNbVlkSEdHbHJNUEtO?=
 =?utf-8?B?L3BYUlNqQi8xdzhPNW5PQlNPU0pwMHJmK1lDYWFSV09rOWUrd0lVeVl1NUYr?=
 =?utf-8?B?TWp3UTF1WEdicDBWaXVycEJ0QWZRZitRamcwQ2Nsbkd3ZHJOZUdwb0VTbTFQ?=
 =?utf-8?B?dXhRaEl6WW1DUFpYTVFPSER0Y0U0SGQzRjZTV3hTNlJUbG1EWWt5dFFpdGhV?=
 =?utf-8?B?YVk3TnFtWER6VTE4ZUM1MWVnbktFckNOc2dUbVJRVFYzN1pZVVprVFZoMjRp?=
 =?utf-8?B?SG8ybzR6ZDNwdnh4VDRDeUIxcm10YURhUGZZUlo0cnM0cGtuNE51UE5ZZ0lI?=
 =?utf-8?B?SVpOTUJuZ1ZvTUJYZjRlSkdTSWlKUUlSM21JTW8rdW9CRklrVDBiSXNJOEpm?=
 =?utf-8?B?TnFKdTV5UnMwb3ZvdHloZy9vdnkzNW53MGxNS1NiZlZsRm00b3Rsb0VhTXhQ?=
 =?utf-8?B?T0p0ZG1Bd25DQzZLZk0yR0tiR3N4ZDgwUFFBMmZiQk9kWVhwdXNNVnYxb3dC?=
 =?utf-8?B?UnJTZURuWWpLWVFMeTBxSlRvUitPY0VyRW9XVGM0QUZhbkFZUjRaWlNaZjBG?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd46d21b-ad15-45b4-b492-08db3443b07b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 13:02:33.4130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8GTfOqDVCnWtGTkvkJcpSKy8YpnkU40HztuJkfsdmFg6j+V87lnwF3iXawc8ZB6NXoI1EHBqSegOf39qzE+8egabPkwGnzApLofTUXW1W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4866
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>,
 intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 09:38:01AM +0200, Michal Wajdeczko wrote:
>
>
>On 02.04.2023 23:54, Lucas De Marchi wrote:
>> On Sun, Apr 02, 2023 at 01:17:50PM +0200, Michal Wajdeczko wrote:
>>>
>>>
>>> On 02.04.2023 03:34, Lucas De Marchi wrote:
>>>> On Sat, Apr 01, 2023 at 08:26:24PM +0200, Michał Winiarski wrote:
>>>>> On Sat, Apr 01, 2023 at 01:54:59AM -0700, Lucas De Marchi wrote:
>>>>>> On Fri, Mar 31, 2023 at 08:34:21AM -0600, Lucas De Marchi wrote:
>>>>>> > On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>>>>>> > > On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>>>>>> > > > +EXPORT_SYMBOL(xe_rtp_process_incompat_types);
>>>>>> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>>>> b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>>>> > > > new file mode 100644
>>>>>> > > > index 000000000000..4a12aad3f759
>>>>>> > > > --- /dev/null
>>>>>> > > > +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>>>>> > >
>>>>>> > > There's no need to have this as a separate file.
>>>>>> > > We can move the contents of tests/xe_rtp.c into
>>>>>> tests/xe_rtp_test.c and
>>>>>> > > include tests/xe_rtp_test.c directly in xe_rtp.c
>>>>>> >
>>>>>> > this is not how the tests are currently structured.
>>>>>> >
>>>>>> > xe_rtp.c includes tests/xe_rtp.c. The latter can be seen as "an
>>>>>> > extension of the that file, exporting whatever entrypoint is needed
>>>>>> > for the real test". They are then part of the xe.ko module.
>>>>>> >
>>>>>> > tests/xe_rtp_test.c is the one in the separate test module, and
>>>>>> contains
>>>>>> > the integration with kunit.
>>>>>>
>>>>>> but it's possible to keep everythin in the separate module and not
>>>>>> need
>>>>>> the include of tests/xe_rtp.c. I did that on v2.
>>>>>>
>>>>>> Lucas De Marchi
>>>>>
>>>>> From my perspective - the way that the test is implemented carries an
>>>>> additional information.
>>>>> 1) Test is a separate module:
>>>>> Means that we're testing the API exported by the module (that's used by
>>>>> other modules).
>>>>> 2) Test is a file that's a part of a module:
>>>>> Means that we're testing non-static API used internally by the module.
>>>>> 3) Test is a file that's included at the end of a file:
>>>>> Means that we're testing static functions.
>>>>>
>>>>> Forcing everything to be a module doesn't really serve any purpose.
>>>>> It just makes things harder to follow, as it removes this useful
>>>>> additional bit of information.
>>>>
>>>> I strongly disagree here.  Basing the test location on how much a
>>>> function is exposed is a recipe for having to move the tests from one
>>>> place to another. There are always refactors that make function change
>>>> from non-static -> static, static -> non-static, and to a smaller degree
>>>> exporting it.
>>>>
>>>> In the end the code will just be inconsistent with the rules you
>>>> outlined.
>>>>
>>>> Separating everything to a separate module means the test code doesn't
>>>> bloat the xe.ko module. I do think we should group all the tests into a
>>>> single xe_test.ko, but that is a different topic.
>>>>
>>>> See v2 of this patch series where I move *all* of the rtp tests to the
>>>> separate module and simply use EXPORT_SYMBOL_IF_KUNIT() to export the 2
>>>
>>> but having to export static functions simply don't scale, it's fine if
>>> all you test needs is 2 functions, but to have full coverage we might
>>> end with exporting all static functions (and to some extend bloating
>>> xe.ko anyway, both in code and binary)
>>
>> ... the fallacy of full code coverage.
>
>so having full coverage is not our goal any more ?
>then others work like [2] seems unnecessary
>
>[2] https://patchwork.freedesktop.org/series/115513/

no idea about that test - I'm talking about the concept about full
*code* coverage above all else and think you are covered when you
reached that goal... ther are multiple articles around about that.

>
>>
>>>
>>> there is already BKM for testing static functions [1]
>>> so why are we trying to force different (and IMO worst) model ?
>>
>> it's fine as long as the test is small and you really want/need to test
>> that single function rather than a higher order interface to it.
>>
>>>
>>> [1]
>>> https://docs.kernel.org/dev-tools/kunit/usage.html#testing-static-functions
>>
>> "If we do not want to expose functions or variables for testing ...".
>> There are several sections before that one.
>>
>> It will depend on the test. Some may be inevitable and simpler to
>> include in the file. With the dowside of bloating the module.
>
>but what exactly bothers you by "bloating the module"
>
>- additional single #include at end of .c file
>- multiple xxx_IF_KUNIT macros across all over .c file
>- bigger footprint of the xe.ko due to export tables
>- bigger footprint of the xe.ko due to inclusion of test functions
>- bigger footprint of the xe.ko due to inclusion of test suites
>- additional headers to expose test functions
>- ...
>
>>
>>>
>>>> functions I need (In this v1 I was using
>>>> EXPORT_SYMBOL_NS_GPL(..., XE_KUNIT) to make sure the tests were in a
>>>> separate namespace, but then I noticed kunit itself has a recommended
>>>> way by using its macro).
>>>>
>>>> This makes the rule very simple to be followed:
>>>>
>>>> 1) Place everything you can in the separate test module
>>>
>>> but why? as Michal pointed out, this works best for testing already
>>> exported API functions, to test internal static functions, this would be
>>> unnecessary complicated solution
>>
>> then provide a better test on the interface rather than on the static
>> function. If really needed/wanted, then including it on the bottom of
>> the file can be done.
>
>majority (if not all) of our functions are not module exported, thus
>testing them will look almost exactly as static

I'm saying you could have good tests by using the interface of the
module/file instead of trying to test every single static function.

>
>>
>>>
>>>> 2) Place it in end of the file with the #include otherwise
>>>
>>> this should be our primary BKM for mock/fake/sw/self/kunit/unit(*) test.
>>>
>>> (*) pick one
>>>
>>> note that in addition to easy maintenance (it doesn't require writing,
>>> building, distributing and loading separate modules), this single test
>>> file already has access to all required compilation unit static
>>> functions that we want to test.
>>>
>>> also from IGT point of view, this would mean that in case of
>>> adding/removing some subtests all we need is just update test filter
>>> rather then updating list of modules to load/unload.
>>
>> you are making this up as "it's harder to maintain" to justify your bias.
>> There is 1 single call you make, using the already provided kunit.py.
>> Developers can run it on their machines and so can CI.
>
>it's not about how you run such test, as in both cases this will be
>exactly the same kunit.py line
>
>problem is during creation of such test where you need to:
>- provide new .h with prototypes for the otherwise static functions
>- tag (bloat) static functions with VISIBLE_IF_KUNIT
>- export (bloat) static functions with EXPORT_SYMBOL_IF_KUNIT
>- create new .c with test module

I don't think it was hard to write the v2 of this series and the
boilerplate was very minimal. So I'm ok with the current state.

>- update Makefile with new module definition

as I said before, this would be a good thing to consolidate, making all
tests under a single .ko rather than 1 per area.... it's on my todo list

>- update IGT to consider new test module

see above about 1 test module... but also it seems igt would reinvent
kunit.py with the intergration you have in mind for it.

IGT could simply have 1 test: kunit. That runs kunit.py with the rigt
args, get the json output and interpret it.

>- update CI to run new module
>- update any scripts to load/unload new module
>- ..

no, see above

>
>
>>
>>> and I wouldn't count this final #include as .ko bloating factor as it
>>> would be primary used in UML build, where we don't care, and for the
>>> target builds this could be easily compiled out.
>>
>> then you can't get the prebuilt kernel to be executed "in production"
>> and sanity check it still passes the sw tests.
>
>but really why you need to rerun those tests ?
>if you don't trust results from kunit.py UML run, then maybe

CI / distro / whatever built a x86-64 / ARM64 / whatever-!UML kernel.
User downloads *that* kernel. How can he sanity check the sw tests if
we make the tests to run strictly under UML?

>
>a) we should drop it from our build step
>b) change kunit config from UML to x64 or something
>c) notify kunit maintainers about problems/gaps with UML runs
>
>as I don't expect any differences between UML and 'production' build
>then I can see no point in running them twice or more

answered above.

Also, it doesn't seem this is being productive as you are convinced the
current state of test integration is completely broken and can't be
used. I disagree. And I see that the changes you are proposing would
bring other issues or are simply not worth it. I'd rather spend time
adding more tests with the current state of the integration and improve
the integration as needed.  So... I already sent v2 of this patch series
which also covers some of the things discussed and I'd rather not reply
to this v1 series anymore.

thanks
Lucas De Marchi

>
>thanks,
>Michal
>
>>
>> Lucas De Marchi
>>
>>>
>>> thanks,
>>> Michal
>>>
>>>>
>>>> Lucas De Marchi

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF85BC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 12:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CDC112004;
	Thu, 25 Apr 2024 12:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORv5Sm1q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FD1113295
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 12:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714049310; x=1745585310;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cULLeih7oHdwokwQyr3OxMkiO8j4vsUdZNHHvQjohXI=;
 b=ORv5Sm1q7m88KroL9jtbjdMGlfQhf+0qA/yFuP6uADKY1A8V4/mNUsSP
 LSlFihDBn2CmHUh6UfNfX+5oMZ/+cX+sgG2y6q4ftjzMdDf3GFU9MGHY8
 htYH+Tc+YzOUnl4pTrB1NeQD7wL7hDRJNvNMAAscEKRPl2VyT5xxFHxVT
 k0mbnfMh8oSppSEJnRC9JlfNVnVW1vOm8Eg7ReETlihRkdhbI2JMr0Gl4
 WoLWkvKs03b1iKhR8dute5C8RPeN6wQpl75Dsnamzdp4icrLEDBCtglH7
 WnGhwjhODfLpwgfEAeQYyU9jDFNEz/Xcg+IYafAqbgDY/3/CvhHatmly0 w==;
X-CSE-ConnectionGUID: NTJ4zuTxS9WwG+4VX8oJjA==
X-CSE-MsgGUID: VMPVJNvNTDC+2tZ6rMMXAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="35125557"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="35125557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 05:48:29 -0700
X-CSE-ConnectionGUID: a3l7zjKLTaq97rV9RZGz3w==
X-CSE-MsgGUID: VenVvE5FTjKILDkbLB8ZoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="24931332"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 05:48:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 05:48:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 05:48:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 05:48:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROtFvp2eIVzKUleFgR9EyRqYaiDtv5hjW8u7Q7e+4/TuW0Lv8SUHHKURWCrHNStyM53QVLXSXpcFkA+Gfcj2PaA2vuIaNAs7oz/LFkiWioUqVtsMrDfWsjqG2TLpZ+0y3nSQX91R1qlemQDitftoo7KMzkh/udQMKccXudHMkxmNEbFTfgsu3Cm+Rnq2YFRgfIM62soNDpsSIdZtOOuualbGgWysYLBHSuwDMcgilB7MsjpG6qN6I7dXmolbeGFPosIDBbkUXqEa4G3sUAT5pu4hhtvm6Mwg67F3KB122654gZJ2CoKTlZNExxxDR2EXYxOdys6PgOR6FFVBctRexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcEPesw2t7JJFsDTWYsZoegUeAzvoRhyVu/PAdpeq7E=;
 b=FkbB5whbXBMtM54hY4mzXvN/jNYMCYq7hLENczCBVrVIl3OWWJ3D7t7tUXr6F1qc7CVy3r+Kj+HU2W464wJ4Mu2KtnsLv9giNpmyTNKIgozeVNDySjExVYjIMWc5O7I1foVDpdrU7irpfyOo9le1v9Cl1ivsI8lKDy1h9wxn238lB32/Q3SrDpocmXg1wtu/VNURJ4yjXTUbnyg7ItAhB/nRvuPSjihjkaYEWPqFSBIC4NUl3y6+EqqFYWTH15txFpF5osVgOAZomTotENH+R1SMInDxVl6B5LowPiwR6NQ20ZTBCQ8mlM4w8ClMn+LiSfYmnClVNGpB1gSMCOoClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6210.namprd11.prod.outlook.com (2603:10b6:930:26::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Thu, 25 Apr
 2024 12:48:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 12:48:24 +0000
Date: Thu, 25 Apr 2024 07:48:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Dafna Hirschfeld
 <dhirschfeld@habana.ai>, Matt Roper <matthew.d.roper@intel.com>, "Niranjana
 Vishwanathapura" <niranjana.vishwanathapura@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Generate oob before compiling anything
Message-ID: <crdry63sz6va3gxsa55fw2dz7zyyxyhcrdboe4cxpre27ydfae@i5qdm3wni22k>
References: <20240411210703.3296782-1-lucas.demarchi@intel.com>
 <87le51pu3y.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87le51pu3y.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: ddabe313-2b6d-4b46-1c53-08dc6525fea6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0n3l9ZGyjVB2A+GFhY6CBBNgxEdrB92m0x2woXEWKDq0CcME8ZrizsCmir5R?=
 =?us-ascii?Q?sCbJ5UVGEDKZknilgit/qUI87nXEenBqWlF0ywRjjMqVIqyuDCRvXXmlJmt/?=
 =?us-ascii?Q?E1dZhuGHcNu3YWdPPNYm6V/ya6WnM0IOVWZ4Km+vWX9gdueL7FrxST4SkFao?=
 =?us-ascii?Q?WGVjSxR43UQtS+/YZn762s+XmjVJ9S+iFJGmB4u2gDIi8BKzXc/o/DGnxl5T?=
 =?us-ascii?Q?GWDsteC5ZAIuqXjZKYnU/qkB8YmlnqKI1iJN7zjMFO1hOTO+sfjtggj1fjLj?=
 =?us-ascii?Q?THdUSfaigGRTY/MYiJuwjfel4QcTwSDmllmnaqlwN5GRajHQjVxfifK3OnDr?=
 =?us-ascii?Q?f7tX9M0tqvyqtIywEXzyT8oAuodGYsQHWdTeiWu8tHRc1obtawOW3IW6L45d?=
 =?us-ascii?Q?ESJgf0FoYCbbnZqewl3K3I6s8ELpTYePPcVu7IScP2RiW9uuDZ0Tuz3oV0tF?=
 =?us-ascii?Q?gRHLAQRQV8OWYsq9qr19EVfcMbQZSi7pXma8VhOn8iCvoC1pKsXuodVOlewq?=
 =?us-ascii?Q?uVWUk6b0c7e/C+BfmLcdkyt1syDrW3ZzHRc9zwYhggHCqW44g+5eA7qpj1+Q?=
 =?us-ascii?Q?89chWccebsDtrTExCIgIaiesGOMUTxLpObfXkFxm5iT1lxfm9zhLjPKQ7HCs?=
 =?us-ascii?Q?+YQwkvkNT4MYC63aii6LyAkbM/QkRFYHH6HHYNKsjieP64f48/RP5GJ4u07N?=
 =?us-ascii?Q?GEqtwfsR/GF+DV0+pejJQ0iuJMGXnqoBJ896o0+3/7cOdXvOzuUsp/2l2U+n?=
 =?us-ascii?Q?ZPv5Dk7fs7svk1ykaQeNDYYtZV7pKX0o61sjh6nbmilflKrbiocc7QS5jWm2?=
 =?us-ascii?Q?7RmXniBZlhUZf2YrlDPV0l1LCH6j8OcJYWaqi02AW7xJWH6c3X2N1r6FHHo0?=
 =?us-ascii?Q?ypvncYcwJ7YW+W0SIYLXAjWvTznYpSiqA+XwFEI2RvAkZBmvKUbDyCYbDW8i?=
 =?us-ascii?Q?tZMAl3tYKtYdHr0mU4dkyyZE0sEdhqbcOXye/88miLdZjLbtQKhvyD7+fCDH?=
 =?us-ascii?Q?1kf59mKBNdWVabe8sMmNGYWKlMujfrUlXCx6L26svl77RII/502kqTRJ9YlD?=
 =?us-ascii?Q?tU3T3quT58kY8wQqjA+Rn8NWexkFGuGDbKbdgEa161Va9Kk/J8GWO1aEYvnT?=
 =?us-ascii?Q?FnwTjHT1cfhSX5+s9Mp0IUS1XDf69aEfjiFm4n07EFKda2WQf+hdh6/c10gY?=
 =?us-ascii?Q?q0UiUvpwMMGztis/bQcRKf7kUlZs6h7iumyKVZASCkOMJkd8YzVUTtcA51LT?=
 =?us-ascii?Q?ssWY4HAAnE5L3xIstw+RkCW7k0CkBD9KxcqIGG0iig=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vkMHWrsvT1J170dWmrTGt3hTxeZLht4D+Ev5gMB0gK52rDJ/1W3HFDvvnfd3?=
 =?us-ascii?Q?7J5EhbfTMx01nl5VrfdrCLy/QVmGfRyqeEKLk12nAIqQxvep2O845Nwy21Vs?=
 =?us-ascii?Q?0TYp5BoeyqxHm+EW6uqvWD6DYGVH0aP95PjaftBKpCw9SeZTnsCKi/hUClZ8?=
 =?us-ascii?Q?dJB26WEzUT8kQlEAOlEutMKGLMpH7HV+cQawEw4Pjrjh1aculIoKIfDRSrq/?=
 =?us-ascii?Q?Z8yjrQ+H/SDNK1i/DC9BFIlezgeofRAlNyYPP0YI71IzyaOndk8Wnowq/bEr?=
 =?us-ascii?Q?v8bCCo2+g9I21P+QCZd9buj1E/U0e1/elWSnozKgKViXkKiz3W3njhfgTkge?=
 =?us-ascii?Q?QNCLW7CbOSpqh87/1jpkoQ5B/FhSczj/u9juPe1lhHkN+7AdLs1WbzcJuzkh?=
 =?us-ascii?Q?M88fzWYIyG4b7WX4fFPRTz2Ruty8WK9LwcNnoT0jreKYTel0RK6o/4uB95ap?=
 =?us-ascii?Q?V/i+R54HGEFpvlzElnG4J055AysNy50dvGelLn1Xduk0FfP1aaUhV1aLSnCT?=
 =?us-ascii?Q?UTjbRJRxpLpat+DDYYvEQuWavcjejphTc+Sc5Xmjbij1iROJs7ECh6dp98P1?=
 =?us-ascii?Q?8Q5uKOTV8EfNPbwt7fjj9sO4Z7K6h0HqIqOxxfvjGsftUaaRfab3dXcQg/98?=
 =?us-ascii?Q?1O+ypTBVkI9uVcS2SzH+caRM+J7iAaHqA/Mqn8r3t5YfrwoDrkTvlAdwa8Wj?=
 =?us-ascii?Q?bBeqVHGStYEYYitOGXd+dm548WveVDQnPJRqhPMpAj5v5R+GadJwgF2aMPLi?=
 =?us-ascii?Q?ii9gmob+IMK9Le23U9yHfNxEc864K++MkAT1HqlavdNDDtEA2y08kW7poNIA?=
 =?us-ascii?Q?/oNZ6r9+9K/zZKEAsUj2F2s/6swpMiYKvEahyB0PMs5YAkz6mDRLvOr7+3b4?=
 =?us-ascii?Q?RFVuj8K34Oo3vmYYkpkBHmUd5iyDUYHj2a2ggsAFB4dMTLQg3ikSMEsWzooj?=
 =?us-ascii?Q?SzHaWwZuZNMlYgBefLF3UtvJMaQjWpOPrWU3IVPmqSYIYVtx8h2NlDUU7PvZ?=
 =?us-ascii?Q?M8HpgazzACnL6bW4NLtrER+yyCfPozlRrnIwF7nwg1JeyDiRV2/Y9Xo9XLqy?=
 =?us-ascii?Q?TebbeUBs+mjVUyMvlv8JylKLX6s6oMhVvSOm6r3ezvWwj4TpFwfxmtT8rIIl?=
 =?us-ascii?Q?erNKROPhAMydM4L+YrT8aOBpAwrELjcRvqx360NR6K+7k/PSLVvndLJHeAhg?=
 =?us-ascii?Q?+rdZ2sBZXTAnfnbej2gtZPRMLIdxSuH1xCD5+r6IATZTNZ1ANvkc4vpb5Xcg?=
 =?us-ascii?Q?w9jT1NP272EhwlP//H3xuIKt4QE4ivcl6iTg0LaVGKVsZipWfOC15epWlhsk?=
 =?us-ascii?Q?cd2HMa4AjNWBLs91gjD5Sn3nNyo54YkapyYkb/759jlxrZbHS2692KI0NhyR?=
 =?us-ascii?Q?8XzbX/a8ZL5kx+cyNoCv7Z0FtNMg39ztmmyfx5PTTLWkAx7Lt7pQ3rvHSvK9?=
 =?us-ascii?Q?wQdi8gxpBANEExWjRsHCqdsNUa5MkPEK/TF0H3JfgVVnYRkh7XWJY3ztr/tu?=
 =?us-ascii?Q?ENt8bawAIcSaphd5Y7J/8EHEDa2b4cW4tMI/svQNUpYJxauHlRpnxKf4RKKU?=
 =?us-ascii?Q?+s3dL+Fw4wEB45knyZemHAXRrVJzr19IXfFlfx5n1S9dvVKw0xXQsLGSCI0j?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddabe313-2b6d-4b46-1c53-08dc6525fea6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 12:48:24.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /M2NmUEH7z/puyD+qVfYBQBG2kgjmHYyjxumXt54VqSnLkYK3cQ0O290ApkU9SMbcuS/XwQfLGRXVwOwBYQW62O41LU+OWPSa3jl8CZTEi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6210
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

On Thu, Apr 25, 2024 at 02:19:45PM GMT, Jani Nikula wrote:
>On Thu, 11 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Instead of keep adding more dependencies as WAs are needed in different
>> places of the driver, just add a rule with all the objects so the code
>> generation happens before anything else.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile | 16 ++++------------
>>  1 file changed, 4 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 6015c9e41f24..a5809b3ec8a5 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -46,18 +46,6 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>  		 $(srctree)/$(src)/xe_wa_oob.rules
>>  	$(call cmd,wa_oob)
>>
>> -uses_generated_oob := \
>> -	$(obj)/xe_gsc.o \
>> -	$(obj)/xe_guc.o \
>> -	$(obj)/xe_guc_ads.o \
>> -	$(obj)/xe_migrate.o \
>> -	$(obj)/xe_ring_ops.o \
>> -	$(obj)/xe_vm.o \
>> -	$(obj)/xe_wa.o \
>> -	$(obj)/xe_ttm_stolen_mgr.o
>> -
>> -$(uses_generated_oob): $(generated_oob)
>> -
>>  # Please keep these build lists sorted!
>>
>>  # core driver code
>> @@ -319,3 +307,7 @@ quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>>
>>  $(obj)/%.hdrtest: $(src)/%.h FORCE
>>  	$(call if_changed_dep,hdrtest)
>> +
>> +# make sure the generated header is done before any
>> +# compilation unit is attempted
>> +$(xe-y): $(generated_oob)
>
>I'm sorry, I don't understand why this would ensure the order.

$(xe-y) should expand to every single .o listed here. So this is adding
a dependency "every single .o depends on the generated files. Or at
least it was the intention and appeared to work fine for x86, but no UM.
Before we had:

$(uses_generated_oob): $(generated_oob)

with $(uses_generated_oob) being crafted by hand.

>
>Moreover, I think there should be a way to express the dependency
>accurately and automatically. I'm just not sure how. I guess it's the
>system include <generated/...> that prevents the usual dep handling from
>working.

why? there's nothing special with "generated" or instructing the
compiler to look at the include paths (without looking at the current
dir)

Lucas De Marchi

>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel

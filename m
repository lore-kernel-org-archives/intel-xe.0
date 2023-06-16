Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0605DEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 13:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D054D10E0B9;
	Fri, 16 Jun 2023 13:34:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CED10E0B9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686922469; x=1718458469;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ztJMtuJy4j5TprWd2ZG4GRdG5WCxA3mhVksPzb8pIA8=;
 b=GJihMBbXEYwoj16yaQhYBcWXv9R4d1llaz1MsdCufDV6NhVyN5nun35k
 ftZ9F9zcBBoKJi6bRvVtj715GaZfKLAau7TT5cQ/RT8SeTZm/eMhlPgf9
 smmQheCT2RkQpUtSja4ztaED7ucHmMSOMUeOGME+2ZA7PIYOl1zCrA7OT
 c7DZ8sQkDeZuDuk8iuc2f6pXMh+kIWZihZV84hertEGx+USH0rw/p7o+X
 Ga6XwR41pdfdyM3jQLgVRwX9KUgzx9XkjGfDuiAddFSCjamii3izMj9Wo
 CJNMLCg/TDqWFwBM1T3jQCVnrXEBVpCIY4EtjK005LKlCKOfqN4vTbziv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="425149495"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="425149495"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 06:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="690249477"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="690249477"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 16 Jun 2023 06:34:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 06:34:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 06:34:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 06:34:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A34hm7eIFEBL/ydT9kyZCgzvIFegeRpS3xOvEd9LhLnfktOcwwmKiBgvWOqqrhDtyHRGCmTNaPDTo8HrTlW9gdkESvodAdvwzMTGxRN3jcOE09laZQ2QBYZz7YehOrq1aF8qWyoTEFzyLbjm7f0XS/kh023fqRvieyyERALW5ctjsK91cqUS8OlzHJqzOw0buvE4dEuBqattV5D/KPqn6zYsaC9k4ZZuSgVQ/+R24Uzv1y/b6Ih3HB4IdQ+oJXOTM7+zLhBS/cqDbd3UrxB4DdTY+CbTU5UkzywcgMeodZeuNmtHU0emGh+ivV2rBibJDtzLZZpexGMwbt/wFooO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qkojn/6GbPZsTyRuot4Aq3qbpoNXFtVjaJXqyJvi/o=;
 b=NOS47LGS8qr4LcUfVtH6T97qx7lyhN1Ct0+z1CzqxYUnOXhGiN0u5r23CRXfUCeXkh6V9sZxLjYtieA9xiCYEPuZXUfUAK2x/2tkQ6NbHlgPS9my89Qh4SRkPj6ttap3pp1URD7WAEssHQcpk2oIce31yqEetG1rXOepEHPYwatefsxnSW+NaoQGu0vywfZqhqw0cJewF1uEvWZQ9zhL55dqVcJtO+7qHl0xaGgij61vHPQQIwU+vOgvjkg9fgLtQQwuJ92+6ExiJTVXDStZwv3VkaPn6imDCISOBWn/1ZzeMFGFABCamCRKbTjDZo3FEAuSKdtjGGCbMHq0ExCDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 13:34:26 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d%4]) with mapi id 15.20.6455.043; Fri, 16 Jun 2023
 13:34:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230616102406.klskmif6thctfgxd@zkempczy-mobl2>
References: <20230616053727.134130-1-zbigniew.kempczynski@intel.com>
 <ZIwaG2tlLQIpposb@ashyti-mobl2.lan>
 <20230616102406.klskmif6thctfgxd@zkempczy-mobl2>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Zbigniew
 =?utf-8?q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 16 Jun 2023 10:34:20 -0300
Message-ID: <168692246024.4441.17764425834569144288@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|IA1PR11MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a902c1-c9b3-4b66-226e-08db6e6e670b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQz0LIJIhprEnSmYZDyd5tbLUKSh/6jXv7USLrFYCLcqqNvgMtVp9pKkSxtDHyL0+et3uJN1/blfoyqdTNuiK7qTM0D9Ssln/9V1/1boNhKOMAfB5GfrBXN2SigE1ue8TzKoCxM+0NUKry60nYVXeh6pDYaQuSJTJEPCsZwe80Yn1Gjb0AT2bgxQiJNbcJxwmX3Gu/UiXmiWf3p17DDaID1pltVkXiNzvz2b0CTmDuUOXU13/SxQU/7HRJCbR3dpbKx3/obIvHtRx1qGNWBxWkw6M1jwkkZg41vNU/dZe8kivpapCuwVdG/lKyWreyn6U6548x8lWPB6tVy5qBzCyZfRh+oEYDzk9lod5T0IDDCP38lO9etncB2jhO837LebAYMjBVbhhC4P19aFb/G0W80DWLfvekJT1JqOj0PBYJ9RE/a9/N5pMJrpKqASOWpxRdzBZLlZRVG3iRnUYCebSb6BYmpjZEH8UF2apl2lQ+k8sz6lFYaF1wZ0sdXvtxak0/VcmNJARMMCnDXFCY9VBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(478600001)(110136005)(966005)(6666004)(6486002)(33716001)(5660300002)(8936002)(44832011)(8676002)(82960400001)(4744005)(2906002)(41300700001)(86362001)(38100700002)(66476007)(66556008)(316002)(6636002)(66946007)(4326008)(26005)(9686003)(6512007)(6506007)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2dqaDFva0swSm1tTWd3ZTgrSTVIaFI1bmR5QU80ZkxEVTJBb2VqRGRqOFhT?=
 =?utf-8?B?ellqOWdudFV3U3BvcEdlS1BLQUFXZERXYnBTd0I1UE9GN2FnU2NaTngrYU1B?=
 =?utf-8?B?WklvbUtjOVdTendSNzYxaFdwL0J2Q2N5SE1HQkNtR0dBczBZQXJ2Q2s0dnZO?=
 =?utf-8?B?eDk1bVFGSndpcExsSkVhRXdxTks1UVhodElZSmVFYzUzRCt2QjlvWURaRmo5?=
 =?utf-8?B?TllvRnpJWTRwYlZwSUxtQmhLbzVSRVpDaW1Sa3JmN05ZOTZucGRINVNIdTBa?=
 =?utf-8?B?OE5KQXNUa01hOWtodlExYUkvUkcrODVOQmpKS293c0M5Z2lzbFdiRDBDYkJQ?=
 =?utf-8?B?dGZUNnRVd09ZcFhBSVdtVlpySHFvbHRFT3pOSnpDblM4WEEwRTFUMEx0RWJU?=
 =?utf-8?B?RDQwNjh1U09vQVZrRng3ei8waEpqVVU1Z0krZytzZ3g5S3dpUURlTVdpQlJS?=
 =?utf-8?B?ZE9VVmZ5VkV4SFc2M3Z5S2NFaksvU0F1clZmVnBDcEVQbmJtQ1lKc0haYmUz?=
 =?utf-8?B?ZDY1NVpDMWRFRlZUeXpsUWxKczBqelkyRXBCdUk5Y2s0UDdlTVFaRjVqelRt?=
 =?utf-8?B?bmdZaFh0MkpZTlhVb3VreS9VaVA5QWNFQWNqay92OWpNdkxkc3h5VHcxd2hG?=
 =?utf-8?B?T2dSR3NUR2FPWDM0WTlaeTYvK1MycE9Sck04VDdWYUJiK2Vld3kwVkliOVlP?=
 =?utf-8?B?TkFnQWdPbGRrbHdJdEhjdlphSjFBcFJROG1RZ0t1cWsvTW5ZMUg4SElPdDNk?=
 =?utf-8?B?ektRRkxPaWVsRHcxYUVwSUV5Uit2MnZPL1l2RytVUktPNEd4T3FsbE01YnF5?=
 =?utf-8?B?YTVTbW5aZllBbUQ4RlFFWGRUNUtTNHduYXdaVDlIa01aVFBKUFhFY2JxS1Ar?=
 =?utf-8?B?QUpyREV6c1VITnlRZFlOS2tPQWgvbUtPVWh1VDFQVFkwbGtiNGt6OTNRbk9K?=
 =?utf-8?B?cktpU1VnZDgvSU5oOUQrVVYrU3pNK1h5ZW5wbFdIckp4Y3VZaXgrVENLNnFI?=
 =?utf-8?B?dXlrdWRhckZrR245RGkvOHMzTkNXU2x0Nk5jb2lITHZka0pkLzJlZGd1Z2F2?=
 =?utf-8?B?dkpVUkU3UDdKV2lJWXpRbWJwcHkybXhlTFh5MnJOTk84Ukg1MWNtWjQ2L0Qz?=
 =?utf-8?B?cWJoUnZKMjJNalNKemkrREJVVzRXNkNKRk5sdXFJTmRDU1oreUlBWTU5QXZ3?=
 =?utf-8?B?ejhxUm1KaHd1cjg3RGljb2NJL3Q1QUxkM0gxeVA1cnRVMmM1N3pGRDBCSGNG?=
 =?utf-8?B?WVR1UzNYbUxtV1BGZmc0UlFzSUVDV1Z6MlVzODlxOG9ONXZHVGtVMmlGNm9I?=
 =?utf-8?B?QnQ1dmNkUG0xbDFXMXdUNWVDQU5ldW1lWSszanhEbmd3NUxVa2ZSNGZYMHRx?=
 =?utf-8?B?dWp3ckNITDA4emoxSVR4QTkySTBXTDBQL1ZscTBQS3o3QWlFeCtVT0FEM2w3?=
 =?utf-8?B?SDMxTEtQN291YTFFRlFKdWlzTGRvemgyTHN0UEhTS0MyNnlIakJTNEJtNHdW?=
 =?utf-8?B?WE1mWWovYzFNV1VnUU5qRjNhaDByb0pMZ3FGT3FyRGFQSHVsRDFiQjErNHVP?=
 =?utf-8?B?TkhyZGdXRHc5blVPNThuMWxMd3pvTVdSYk5RbGNJOGx3SHZEMjRaTVFBZ1Ft?=
 =?utf-8?B?dDVqNU1RdGNsMUsvbXhHcmhFRkcrQytueG5GVjVCVHdLZWtidU0vdDBUY1ZT?=
 =?utf-8?B?dElJTy9iaVdETUtpZUVmdWRudFFSbi9GQ2lFT3VWbFZUZytTbVhXZXVxRFpS?=
 =?utf-8?B?TXhEekRsVSsrajZiSitueGpKNFQwOU9ITFVuL0J2a1VTL1ljU3ZoRElpaEJQ?=
 =?utf-8?B?TFFDTXMvRWNiZ21obFRrd2F6Q2Vlb09NWk1YUHdRZHFRVWowbzdkU25jd3R6?=
 =?utf-8?B?dVp1SVNJSC9nRDlxK1RVd0pqSDB4TFdONTJNZVluU1BYMGRpRFJLMjI5SXpm?=
 =?utf-8?B?Q2t2bXhLdGhHRmwvaDJmbC9mWmlsbjM1cnZZMFQwQnRORlA1SFUveThHTmcy?=
 =?utf-8?B?Qk5QUTY3Y0lqNWg1bDI5aWR0c1JlV2NTVVlQY3V2TkN0WGloaSs3Y1ZldytX?=
 =?utf-8?B?MExYZm5VRy9iSkdBZkk0NjdLRWxmMnB6dWNPVDArdk9rNGppYldPd2dwZG1C?=
 =?utf-8?B?TVd2cm01dUp6Uml1MmJ6d051SEVDTGpKYVdsTDB0c20rMmxYS1lvUDBsWHhT?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a902c1-c9b3-4b66-226e-08db6e6e670b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:34:25.9566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfVL60ykfFXbwMe9fjxCvQohwuf3nFk79NTk79vUJ1jT87FMlxZjI2UrJ3QpPh/QMUdYaeDMNw83OqRw3FV1Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Use nanoseconds instead of
 jiffies in uapi for user fence
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Zbigniew Kempczy=C5=84ski (2023-06-16 07:24:06-03:00)
>On Fri, Jun 16, 2023 at 10:15:23AM +0200, Andi Shyti wrote:
>> Hi Zbyszek,
>>=20
>> On Fri, Jun 16, 2023 at 07:37:27AM +0200, Zbigniew Kempczy=C5=84ski wrot=
e:
>> > Using jiffies as a timeout from userspace is weird even it theoretical=
ly
>> > exists possiblity of acquiring jiffies via getconf. Unfortunately this
>> > method is unreliable and returned value may vary from configured in th=
e
>> > kernel config.
>> >=20
>> > >From now on timeout is expressed in nanoseconds and its interpretatio=
n
>>  ^^^
>>=20
>> you have a trailing '>' here, maybe a copy/paste error.
>
>I've checked in the patch and I don't see this character there. Are you
>sure you haven't inserted it unintentionally during review?
>

Drive-by comment: The ">" is probably due to an mbox[1] variant that uses i=
t to
distinguish it from a new message delimiter.

[1] https://en.wikipedia.org/wiki/Mbox

>--
>Zbigniew
>
>>=20
>> Andi

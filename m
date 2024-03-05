Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ED0C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 15:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B231132D6;
	Wed,  6 Mar 2024 15:40:57 +0000 (UTC)
Received: from out0-213.mail.aliyun.com (out0-213.mail.aliyun.com
 [140.205.0.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E816112B3F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 14:26:57 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018047194;
 MF=tiwei.btw@antgroup.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---.WfwGJqM_1709648800; 
Received: from 30.121.51.238(mailfrom:tiwei.btw@antgroup.com
 fp:SMTPD_---.WfwGJqM_1709648800) by smtp.aliyun-inc.com;
 Tue, 05 Mar 2024 22:26:54 +0800
Message-ID: <496c61e9-0f0a-41d1-ac3c-61992b3f0b96@antgroup.com>
Date: Tue, 05 Mar 2024 22:26:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: -Wmissing-prototypes warnings in user-mode linux
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <87jzmh2chs.fsf@intel.com>
 <5d1dfb9fce5d7647ff3203080416eadc9806059a.camel@sipsolutions.net>
 <87frx52btl.fsf@intel.com>
 <9d297bf5-4f54-431b-ab8d-c5be825f129e@antgroup.com>
 <87y1aw23n3.fsf@intel.com>
From: "Tiwei Bie" <tiwei.btw@antgroup.com>
In-Reply-To: <87y1aw23n3.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 06 Mar 2024 15:40:55 +0000
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

On 3/5/24 9:45 PM, Jani Nikula wrote:
> On Tue, 05 Mar 2024, Tiwei Bie <tiwei.btw@antgroup.com> wrote:
>> Thanks for raising this topic!                            
>>                                                               
>> Indeed. To make it easier to review, the current series only addressed
>> the -Wmissing-prototypes warnings that can be fixed straightforwardly (e.g.
>> by turning into static functions or including missing headers). The remaining 
>> -Wmissing-prototypes warnings mainly fall into the following categories:
>>
>> - Symbols defined and used in os-Linux/;                
>> - Symbols defined in os-Linux/, but declared in kernel headers;
>> - Symbols defined in individual files and not called explicitly;
>>
>> My plan was to fix the remaining warnings in followup series. Ultimately,
>> I wish we can let cc treat -Wmissing-prototypes warnings as errors.
> 
> Yay! That's good to hear.
> 
> If you want to get build testing from our CI, using our configs, please
> just Cc: intel-xe@lists.freedesktop.org when sending the patches. You'll
> get the results in reply.

Cool. Will Cc the list in the future. Thanks! :)

Regards,
Tiwei
